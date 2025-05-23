cmd_libbb/makedev.o := riscv64-unknown-linux-gnu-gcc -Wp,-MD,libbb/.makedev.o.d  -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.36.1"' -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Oz    -DKBUILD_BASENAME='"makedev"'  -DKBUILD_MODNAME='"makedev"' -c -o libbb/makedev.o libbb/makedev.c

deps_libbb/makedev.o := \
  libbb/makedev.c \
  /home/hanane/riscv/sysroot/usr/include/stdc-predef.h \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /home/hanane/riscv/lib/gcc/riscv64-unknown-linux-gnu/15.1.0/include/limits.h \
  /home/hanane/riscv/lib/gcc/riscv64-unknown-linux-gnu/15.1.0/include/syslimits.h \
  /home/hanane/riscv/sysroot/usr/include/limits.h \
  /home/hanane/riscv/sysroot/usr/include/bits/libc-header-start.h \
  /home/hanane/riscv/sysroot/usr/include/features.h \
  /home/hanane/riscv/sysroot/usr/include/features-time64.h \
  /home/hanane/riscv/sysroot/usr/include/bits/wordsize.h \
  /home/hanane/riscv/sysroot/usr/include/bits/timesize.h \
  /home/hanane/riscv/sysroot/usr/include/sys/cdefs.h \
  /home/hanane/riscv/sysroot/usr/include/bits/long-double.h \
  /home/hanane/riscv/sysroot/usr/include/gnu/stubs.h \
  /home/hanane/riscv/sysroot/usr/include/gnu/stubs-lp64d.h \
  /home/hanane/riscv/sysroot/usr/include/bits/posix1_lim.h \
  /home/hanane/riscv/sysroot/usr/include/bits/local_lim.h \
  /home/hanane/riscv/sysroot/usr/include/linux/limits.h \
  /home/hanane/riscv/sysroot/usr/include/bits/pthread_stack_min-dynamic.h \
  /home/hanane/riscv/sysroot/usr/include/bits/posix2_lim.h \
  /home/hanane/riscv/sysroot/usr/include/bits/xopen_lim.h \
  /home/hanane/riscv/sysroot/usr/include/bits/uio_lim.h \
  /home/hanane/riscv/sysroot/usr/include/byteswap.h \
  /home/hanane/riscv/sysroot/usr/include/bits/byteswap.h \
  /home/hanane/riscv/sysroot/usr/include/bits/types.h \
  /home/hanane/riscv/sysroot/usr/include/bits/typesizes.h \
  /home/hanane/riscv/sysroot/usr/include/bits/time64.h \
  /home/hanane/riscv/sysroot/usr/include/endian.h \
  /home/hanane/riscv/sysroot/usr/include/bits/endian.h \
  /home/hanane/riscv/sysroot/usr/include/bits/endianness.h \
  /home/hanane/riscv/sysroot/usr/include/bits/uintn-identity.h \
  /home/hanane/riscv/lib/gcc/riscv64-unknown-linux-gnu/15.1.0/include/stdint.h \
  /home/hanane/riscv/sysroot/usr/include/stdint.h \
  /home/hanane/riscv/sysroot/usr/include/bits/wchar.h \
  /home/hanane/riscv/sysroot/usr/include/bits/stdint-intn.h \
  /home/hanane/riscv/sysroot/usr/include/bits/stdint-uintn.h \
  /home/hanane/riscv/sysroot/usr/include/bits/stdint-least.h \
  /home/hanane/riscv/lib/gcc/riscv64-unknown-linux-gnu/15.1.0/include/stdbool.h \
  /home/hanane/riscv/sysroot/usr/include/unistd.h \
  /home/hanane/riscv/sysroot/usr/include/bits/posix_opt.h \
  /home/hanane/riscv/sysroot/usr/include/bits/environments.h \
  /home/hanane/riscv/lib/gcc/riscv64-unknown-linux-gnu/15.1.0/include/stddef.h \
  /home/hanane/riscv/sysroot/usr/include/bits/confname.h \
  /home/hanane/riscv/sysroot/usr/include/bits/getopt_posix.h \
  /home/hanane/riscv/sysroot/usr/include/bits/getopt_core.h \
  /home/hanane/riscv/sysroot/usr/include/bits/unistd_ext.h \
  /home/hanane/riscv/sysroot/usr/include/linux/close_range.h \
  /home/hanane/riscv/sysroot/usr/include/sys/sysmacros.h \
  /home/hanane/riscv/sysroot/usr/include/bits/sysmacros.h \

libbb/makedev.o: $(deps_libbb/makedev.o)

$(deps_libbb/makedev.o):
