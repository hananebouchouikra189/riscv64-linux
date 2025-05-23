# RISC-V Linux Cross-Compilation and Emulation Guide

This guide provides complete instructions for setting up a RISC-V development environment, compiling the Linux kernel, creating a minimal root filesystem with BusyBox, and running it in QEMU.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Toolchain Installation](#1-install-risc-v-toolchain)
3. [Linux Kernel Compilation](#2-compile-linux-kernel)
4. [Root Filesystem Creation](#3-create-root-filesystem-with-busybox)
5. [Running in QEMU](#4-run-in-qemu)
6. [Troubleshooting](#troubleshooting)

## Prerequisites

- Linux system (Ubuntu/Debian recommended) or WSL2
- 5GB+ free disk space
- Basic terminal knowledge

## 1. Install RISC-V Toolchain

Install the necessary packages:

```bash
sudo apt update
sudo apt install -y \
    gcc-riscv64-linux-gnu \
    qemu-system-misc \
    git \
    make \
    bison \
    flex \
    libssl-dev \
    build-essential
```

## 2. Compile Linux Kernel

Clone the kernel source:

```bash
mkdir -p ~/riscv64-linux && cd ~/riscv64-linux
git clone --depth=1 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
```

Configure and compile:

```bash
make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- defconfig
make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- -j$(nproc)
```

The compiled kernel will be at: `arch/riscv/boot/Image`

## 3. Create Root Filesystem with BusyBox

Download and prepare BusyBox:

```bash
cd ~/riscv64-linux
wget https://busybox.net/downloads/busybox-1.36.1.tar.bz2
tar -xf busybox-1.36.1.tar.bz2
cd busybox-1.36.1
```

Configure static build:

```bash
make CROSS_COMPILE=riscv64-linux-gnu- defconfig
sed -i 's/# CONFIG_STATIC is not set/CONFIG_STATIC=y/' .config
make CROSS_COMPILE=riscv64-linux-gnu- -j$(nproc)
```

Create rootfs structure:

```bash
cd ~/riscv64-linux
dd if=/dev/zero of=rootfs.img bs=1M count=64
mkfs.ext4 rootfs.img
mkdir -p mnt
sudo mount rootfs.img mnt

# Create directory structure
sudo mkdir -p mnt/{bin,dev,etc/init.d,lib,proc,sbin,sys,usr/bin,usr/sbin}
sudo cp busybox-1.36.1/busybox mnt/bin/
sudo chmod +x mnt/bin/busybox
```

Create essential symlinks:

```bash
for cmd in $(./busybox-1.36.1/busybox --list); do
  sudo ln -s /bin/busybox mnt/bin/$cmd
done
sudo ln -s /bin/busybox mnt/sbin/init
```

Create initialization files:

```bash
sudo bash -c 'cat > mnt/etc/inittab <<EOF
::sysinit:/etc/init.d/rcS
::askfirst:/bin/sh
EOF'

sudo bash -c 'cat > mnt/etc/init.d/rcS <<EOF
#!/bin/sh
mount -t proc proc /proc
mount -t sysfs sysfs /sys
mount -t devtmpfs udev /dev
/sbin/mdev -s
EOF'

sudo chmod +x mnt/etc/init.d/rcS
sudo umount mnt
```

## 4. Run in QEMU

Basic boot:

```bash
qemu-system-riscv64 \
  -nographic \
  -machine virt \
  -kernel linux/arch/riscv/boot/Image \
  -append "root=/dev/vda rw console=ttyS0" \
  -drive file=rootfs.img,format=raw,id=hd0 \
  -device virtio-blk-device,drive=hd0
```

Advanced options (4 cores, 2GB RAM):

```bash
qemu-system-riscv64 \
  -nographic \
  -machine virt \
  -smp 4 \
  -m 2G \
  -kernel linux/arch/riscv/boot/Image \
  -append "root=/dev/vda rw console=ttyS0" \
  -drive file=rootfs.img,format=raw,id=hd0 \
  -device virtio-blk-device,drive=hd0
```

To exit QEMU: `Ctrl+A, X`

## Troubleshooting

### Common Issues

- **Missing dependencies**: Run `sudo apt install build-essential`
- **BusyBox fails to compile**: Ensure `CONFIG_STATIC=y` is set
- **Kernel panic**: Verify rootfs contains proper init files
- **QEMU errors**: Check image paths and formats

### Debug Tips

- Add `earlycon` to kernel command line for early output
- Use `init=/bin/sh` for minimal shell access
- Check dmesg output for boot messages
- For verbose boot: add `debug` to kernel parameters

### File Structure Verification

After mounting rootfs, verify the structure:

```bash
sudo mount rootfs.img mnt
ls -la mnt/
# Should show: bin, dev, etc, lib, proc, sbin, sys, usr
sudo umount mnt
```

## Notes

- Compilation time varies (10-30 minutes for kernel)
- Default rootfs is 64MB (adjust `count=64` for larger size)
- The system boots to a BusyBox shell with basic utilities
- Network and additional drivers may require kernel configuration changes
