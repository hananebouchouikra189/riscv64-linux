cmd_libbb/ptr_to_globals.o := riscv64-unknown-linux-gnu-gcc -Wp,-MD,libbb/.ptr_to_globals.o.d  -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DBB_VER='"1.36.1"' -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -finline-limit=0 -fno-builtin-strlen -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Oz    -DKBUILD_BASENAME='"ptr_to_globals"'  -DKBUILD_MODNAME='"ptr_to_globals"' -c -o libbb/ptr_to_globals.o libbb/ptr_to_globals.c

deps_libbb/ptr_to_globals.o := \
  libbb/ptr_to_globals.c \
  /home/hanane/riscv/sysroot/usr/include/stdc-predef.h \
  /home/hanane/riscv/sysroot/usr/include/errno.h \
  /home/hanane/riscv/sysroot/usr/include/features.h \
  /home/hanane/riscv/sysroot/usr/include/features-time64.h \
  /home/hanane/riscv/sysroot/usr/include/bits/wordsize.h \
  /home/hanane/riscv/sysroot/usr/include/bits/timesize.h \
  /home/hanane/riscv/sysroot/usr/include/sys/cdefs.h \
  /home/hanane/riscv/sysroot/usr/include/bits/long-double.h \
  /home/hanane/riscv/sysroot/usr/include/gnu/stubs.h \
  /home/hanane/riscv/sysroot/usr/include/gnu/stubs-lp64d.h \
  /home/hanane/riscv/sysroot/usr/include/bits/errno.h \
  /home/hanane/riscv/sysroot/usr/include/linux/errno.h \
  /home/hanane/riscv/sysroot/usr/include/asm/errno.h \
  /home/hanane/riscv/sysroot/usr/include/asm-generic/errno.h \
  /home/hanane/riscv/sysroot/usr/include/asm-generic/errno-base.h \
  /home/hanane/riscv/sysroot/usr/include/bits/types/error_t.h \

libbb/ptr_to_globals.o: $(deps_libbb/ptr_to_globals.o)

$(deps_libbb/ptr_to_globals.o):
