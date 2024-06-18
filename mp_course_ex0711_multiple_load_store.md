# mp_course_ex0711_multiple_load_store_netduinoplus2_baremetal_qemu

## Debug

```as
41          ldr     r7, =int_array      @ Set r7 to int_array (address)
(gdb) p/x (int[8])int_array
$1 = {0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8}
(gdb) n
43          ldmia   r7, {r0-r3}         @ Read 4 words and store them to r0 - r3
(gdb) n
46          ldr     r7, =int_array_2    @ Set r7 to int_array_2 (address)
(gdb) p/x $r0
$2 = 0x1
(gdb) p/x $r1
$3 = 0x2
(gdb) p/x (int[8])int_array_2
$4 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) n
48          stmia   r7, {r0-r3}         @ Write 4 words stored in r0 - r3 to memory location specified by r7
(gdb) n
52          mov     r0, #0
(gdb) p/x (int[8])int_array_2
$5 = {0x1, 0x2, 0x3, 0x4, 0x0, 0x0, 0x0, 0x0}
```

```as
64          ldr     r7, =int_array      @ Set r7 to int_array (address)
(gdb) n
66          ldmia   r7!, {r0-r3}        @ Change r7 to int_array (address) + 0x10 after the load
(gdb) p/x $r7
$6 = 0x20000200
(gdb) n
69          ldr     r7, =int_array_2    @ Set r7 to int_array_2 (address)
(gdb) p/x $r0
$7 = 0x1
(gdb) p/x $r1
$8 = 0x2
(gdb) p/x $r7
$9 = 0x20000210
(gdb) p/x (int[8])int_array_2
$10 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) n
71          stmia   r7!, {r0-r3}        @ Change r7 to int_array_2 (address) + 0x10 after the store
(gdb) p/x $r7
$11 = 0x20000220
(gdb) n
75          mov     r0, #0
(gdb) p/x (int[8])int_array_2
$12 = {0x1, 0x2, 0x3, 0x4, 0x0, 0x0, 0x0, 0x0}
(gdb) p/x $r7
$13 = 0x20000230
```

```as
87          ldr     r7, =int_array      @ Set r7 to int_array (address)
(gdb) n
88          add     r7, r7, #16
(gdb)
90          ldmdb   r7, {r0-r3}         @ Read 4 words and store them to r0 - r3
(gdb)
93          ldr     r7, =int_array_2    @ Set r7 to int_array_2 (address)
(gdb) p/x $r0
$14 = 0x1
(gdb) p/x $r1
$15 = 0x2
(gdb) p/x (int[8])int_array_2
$16 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) n
94          add     r7, r7, #16
(gdb)
96          stmdb   r7, {r0-r3}         @ Write 4 words stored in r0 - r3 to memory location specified by r7
(gdb)
100         mov     r0, #0
(gdb) p/x (int[8])int_array_2
$17 = {0x1, 0x2, 0x3, 0x4, 0x0, 0x0, 0x0, 0x0}
```

```as
112         ldr     r7, =int_array      @ Set r7 to int_array (address)
(gdb) n
113         add     r7, r7, #16
(gdb)
115         ldmdb   r7, {r3, r0, r1-r2} @ Read 4 words and store them to r0 - r3
(gdb)
118         ldr     r7, =int_array_2    @ Set r7 to int_array_2 (address)
(gdb) p/x $r0
$18 = 0x1
(gdb) p/x $r1
$19 = 0x2
(gdb) p/x (int[8])int_array_2
$20 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) n
119         add     r7, r7, #16
(gdb)
121         stmdb   r7, {r1, r0, r2-r3} @ Write 4 words stored in r0 - r3 to memory location specified by r7
(gdb)
125         mov     r0, #0
(gdb) p/x (int[8])int_array_2
$21 = {0x1, 0x2, 0x3, 0x4, 0x0, 0x0, 0x0, 0x0}
```

```as
137         ldr     r7, =int_array      @ Set r7 to int_array (address)
(gdb) n
138         add     r7, r7, #16
(gdb)
140         ldmdb   r7, {r3, r0-r1}     @
(gdb)
143         ldr     r7, =int_array_2    @ Set r7 to int_array_2 (address)
(gdb) p/x $r0
$22 = 0x2
(gdb) p/x $r1
$23 = 0x3
(gdb) p/x (int[8])int_array_2
$24 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) n
144         add     r7, r7, #16
(gdb)
146         stmdb   r7, {r1, r0, r3}    @
(gdb)
149         bx     lr
(gdb) p/x (int[8])int_array_2
$25 = {0x0, 0x2, 0x3, 0x4, 0x0, 0x0, 0x0, 0x0}
```
