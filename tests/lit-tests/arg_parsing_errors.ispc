//; RUN: not %{ispc} %s -o %t.o --nowrap --addressing=123 --x86-asm-syntax=amd --fast-math --fast-masked-vload --dwarf-version=15  --target=avx2-i32x8 --math-lib=fast2 -opt=make_me_happy -not-existing-opt %s 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_1
//; RUN: not %{ispc} %s -o %t.o --nowrap --target=avx2-i32x8 -I 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_2
//; RUN: not %{ispc} %s -o %t.o --nowrap --target 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_3
//; RUN: not %{ispc} %s -o 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_4
//; RUN: not %{ispc} %s -o %t.o --nowrap --target=avx2-i32x8 -h 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_5
//; RUN: not %{ispc} %s -o %t.o --nowrap --target=avx2-i32x8 -MMM 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_6
//; RUN: not %{ispc} %s -o %t.o --nowrap --target=avx2-i32x8 -MF 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_7
//; RUN: not %{ispc} %s -o %t.o --nowrap --target=avx2-i32x8 -MT 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_8
//; RUN: not %{ispc} %s -o %t.o --nowrap --target=avx2-i32x8 --dev-stub 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_9
//; RUN: not %{ispc} %s -o %t.o --nowrap --target=avx2-i32x8 --host-stub 2>&1 | FileCheck %s -check-prefix=CHECK_ERROR_10

//; RUN: not %{ispc} %s -o %t.o --nowrap --target=avx2-i32x8 -not-existing-opt --quiet 2>&1 | FileCheck %s --allow-empty -check-prefix=CHECK_ERROR_QUIET

//; CHECK_ERROR_1: Error: Addressing width "123" invalid -- only 32 and 64 are allowed.
//; CHECK_ERROR_1: Error: Invalid value for --x86-asm-syntax: "amd" -- only intel and att are allowed.
//; CHECK_ERROR_1: Error: --fast-math option has been renamed to --opt=fast-math!
//; CHECK_ERROR_1: Error: --fast-masked-vload option has been renamed to --opt=fast-masked-vload!
//; CHECK_ERROR_1: Error: Invalid value for DWARF version: "15" -- only 2, 3 and 4 are allowed.
//; CHECK_ERROR_1: Error: Unknown --math-lib= option "fast2".
//; CHECK_ERROR_1: Error: Unknown option "-opt=make_me_happy".
//; CHECK_ERROR_1: Error: Unknown option "-not-existing-opt".
//; CHECK_ERROR_1: Error: Multiple input files specified on command line:

//; CHECK_ERROR_2: No path specified after -I option.
//; CHECK_ERROR_3: No target specified after --target option.
//; CHECK_ERROR_4: No output file specified after -o option.
//; CHECK_ERROR_5: No header file name specified after -h option.
//; CHECK_ERROR_6: No output file name specified after -MMM option.
//; CHECK_ERROR_7: No output file name specified after -MF option.
//; CHECK_ERROR_8: No target name specified after -MT option.
//; CHECK_ERROR_9: No output file name specified after --dev-stub option.
//; CHECK_ERROR_10: No output file name specified after --host-stub option.

//; CHECK_ERROR_QUIET-NOT: Error

uniform int i;
