# mp_course_ex0710_register_offset_netduinoplus2_baremetal_qemu

## Debug

```as
42          ldr     r7, =int_array
(gdb) p/x (int[8])int_array
$1 = {0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7}
(gdb) n
44          ldr     r0, [r7, r6]
(gdb) p/x $r6
$2 = 0x4
(gdb) n
45          ldr     r1, [r7, r6, lsl #1]
(gdb) p/x $r0
$3 = 0x1
(gdb) n
48          mov     r6, #4
(gdb) p/x $r1
$4 = 0x2
```

```as
49          ldr     r7, =int_array_2
(gdb) p/x (int[8])int_array_2
$5 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) n
51          str     r0, [r7, r6]
(gdb) p/x $r6
$6 = 0x4
(gdb) n
52          str     r1, [r7, r6, lsl #1]
(gdb) p/x (int[8])int_array_2
$7 = {0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) n
56          mov     r0, #0
(gdb) p/x (int[8])int_array_2
$8 = {0x0, 0x1, 0x2, 0x0, 0x0, 0x0, 0x0, 0x0}
```

```as
63          ldr     r7, =int_array_2
(gdb) n
64          stmia   r7, {r0-r3}
(gdb) n
65          mov     r7, #0
(gdb) p/x (int[8])int_array_2
$9 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
```

```as
68          ldr     r7, =int_array
(gdb) n
70          ldr     r0, [r7], #4
(gdb) p/x $r7
$10 = 0x20000200
(gdb) n
71          ldr     r1, [r7], #4
(gdb) p/x $r0
$11 = 0x0
(gdb) p/x $r7
$12 = 0x20000204
(gdb) n
72          ldr     r2, [r7], #4
(gdb) p/x $r1
$13 = 0x1
(gdb) p/x $r7
$14 = 0x20000208
```

```as
76          ldr     r7, =int_array_2
(gdb) n
78          str     r0, [r7], #4
(gdb) p/x $r7
$15 = 0x20000220
(gdb) n
79          str     r1, [r7], #4
(gdb) p/x (int[8])int_array_2
$16 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) p/x $r7
$17 = 0x20000224
(gdb) n
80          str     r2, [r7], #4
(gdb) p/x (int[8])int_array_2
$18 = {0x0, 0x1, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) p/x $r7
$19 = 0x20000228
```
