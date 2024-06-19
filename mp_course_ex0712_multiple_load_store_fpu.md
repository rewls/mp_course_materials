# mp_course_ex0712_multiple_load_store_fpu_netduinoplus2_baremetal_qemu

## Source

- The registers in the register list of multiple load/store memory access instructions for floating point unit are consecutive.

- Otherwise, error occurs:

```sh
$ make rebuildd
...
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0712_multiple_load_store_fpu/appmain.S: Assembler messages:
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0712_multiple_load_store_fpu/appmain.S:122: Error: bad instruction `tmdb r7!,{s0-s3}'
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0712_multiple_load_store_fpu/appmain.S:150: register list not in ascending order
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0712_multiple_load_store_fpu/appmain.S:150: Error: non-contiguous register range -- `vldmdb
r7!,{s3,s0-s1}'
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0712_multiple_load_store_fpu/appmain.S:156: register list not in ascending order
/home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0712_multiple_load_store_fpu/appmain.S:156: Error: non-contiguous register range -- `vstmdb
r7!,{s1,s0,s3}'
...
```

## Debug

```as
49          ldr     r7, =float_array        @ Set r7 to float_array (address)
(gdb) p/x (float[8])float_array
$1 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) p/f (float[8])float_array
$2 = {0.100000001, 0.200000003, 0.300000012, 0.400000006, 0.5, 0.600000024, 0.699999988, 0.800000012}
(gdb) x/8x (float[8])float_array
0x200006f8:     0x3dcccccd      0x3e4ccccd      0x3e99999a      0x3ecccccd
0x20000708:     0x3f000000      0x3f19999a      0x3f333333      0x3f4ccccd
(gdb) x/8f (float[8])float_array
0x200006d0:     0.100000001     0.200000003     0.300000012     0.400000006
0x200006e0:     0.5     0.600000024     0.699999988     0.800000012
(gdb) n
51          vldmia  r7, {s0-s3}             @ Read 4 words and store them to s0 - s3
(gdb) n
54          ldr     r7, =float_array_2      @ Set r7 to float_array_2 (address)
(gdb) p $s0
$3 = 0.100000001
(gdb) p $s1
$4 = 0.200000003
(gdb) p/f (float[8])float_array_2
$5 = {0, 0, 0, 0, 0, 0, 0, 0}
(gdb) n
56          vstmia  r7, {s0-s3}             @ Store 4 words stored in s0 - s3 to memory[r7]
(gdb) n
60          mov     r0, #0
(gdb) p/f (float[8])float_array_2
$6 = {0.100000001, 0.200000003, 0.300000012, 0.400000006, 0, 0, 0, 0}
```

```as
81          ldr     r7, =float_array        @ Set r7 to float_array (address)
(gdb) n
83          vldmia  r7!, {s0-s3}            @ Change r7 to float_array (address) + 0x10 after the load
(gdb) p/x $r7
$7 = 0x20000200
(gdb) n
86          ldr     r7, =float_array_2      @ Set R4 to float_array_2 (address)
(gdb) p $s0
$8 = 0.100000001
(gdb) p $s1
$9 = 0.200000003
(gdb) p/x $r7
$10 = 0x20000210
(gdb) p/f (float[8])float_array_2
$11 = {0, 0, 0, 0, 0, 0, 0, 0}
(gdb) n
88          vstmia  r7!, {s0-s3}            @ Change r7 to float_array_2 (address) + 0x10 after the store
(gdb) n
92          mov     r0, #0
(gdb) p/f (float[8])float_array_2
$12 = {0.100000001, 0.200000003, 0.300000012, 0.400000006, 0, 0, 0, 0}
(gdb) p/x $r7
$13 = 0x20000230
```

```as
113         ldr     r7, =float_array        @ Set r7 to float_array (address)
(gdb) n
114         add     r7, r7, #16
(gdb)
116         vldmdb  r7!, {s0-s3}            @ Read 4 words and store them to s0 - s3
(gdb) p/x $r7
$14 = 0x20000210
(gdb) n
119         ldr     r7, =float_array_2      @ Set r7 to float_array (address)
(gdb) p $s0
$15 = 0.100000001
(gdb) p $s1
$16 = 0.200000003
(gdb) p/x $r7
$17 = 0x20000200
(gdb) n
159         bx     lr
(gdb) p/f (float[8])float_array_2
$18 = {0.100000001, 0.200000003, 0.300000012, 0.400000006, 0, 0, 0, 0}
(gdb) p/x $r7
$19 = 0x20000220
``` 
