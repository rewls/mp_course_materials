# mp_course_ex0709_mem_imm_offset_netduinoplus_baremetal_qemu

## Debug

```as
49          ldr     r7, =byte_array
(gdb) p/x (char[8])byte_array
$1 = {0x1, 0x2, 0x3, 0x4, 0xff, 0xfe, 0xfd, 0xfc}
(gdb) n
51          ldrb    r0, [r7, #0x3]      @ Read a byte value from memory[r7 + 0x3], and store the value in r0.
(gdb) n
54          ldr     r7, =byte_array_2
(gdb) p/x $r0
$2 = 0x4
(gdb) p/x (char[8])byte_array_2
$3 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) n
56          strb    r0, [r7, #0x3]      @ Write a byte value in r0 to memory[r7 + 0x3].
(gdb) n
59          ldr     r7, =byte_array
(gdb) p/x (char[8])byte_array_2
$4 = {0x0, 0x0, 0x0, 0x4, 0x0, 0x0, 0x0, 0x0}
(gdb) n
61          ldrb    r2, [r7, #0x6]
(gdb) n
62          ldrsb   r3, [r7, #0x6]
(gdb) p/x $r2
$5 = 0xfd
(gdb) n
65          ldr     r7, =word_array
(gdb) p/x $r3
$6 = 0xfffffffd
(gdb) n
66          ldrd    r4,r5, [r7, #0x4]
(gdb) p/x (int[6])word_array
$7 = {0x3020100, 0x13121110, 0x23222120, 0x33323130, 0x43424140, 0x53525150}
(gdb) n
68          ldr     r7, =word_array_2
(gdb) p/x $r4
$8 = 0x13121110
(gdb) p/x $r5
$9 = 0x23222120
(gdb) p/x (int[6])word_array_2
$10 = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0}
(gdb) n
69          strd    r4,r5, [r7, #0x4]
(gdb) n
73          mov     r0, #0
(gdb) p/x (int[6])word_array_2
$11 = {0x0, 0x13121110, 0x23222120, 0x0, 0x0, 0x0}
```

```as
85          ldr     r7, =word_array
(gdb) n
87          ldr     r0, [r7, #0x4]!     @ After the access to memory[r7 + 0x4], r7 is updated to r7 + 0x4
(gdb) p/x $r7
$12 = 0x20000210
(gdb) n
88          ldr     r1, [r7, #0x4]!     @ After the access to memory[r7 + 0x4], r7 is updated to r7 + 0x4
(gdb) p/x $r0
$13 = 0x13121110
(gdb) p/x $r7
$14 = 0x20000214
(gdb) n
91          ldr     r7, =word_array_2
(gdb) p/x $r1
$15 = 0x23222120
(gdb) p/x $r7
$16 = 0x20000218
(gdb) n
93          str     r0, [r7, #0x4]!     @ After the access to memory[r7 + 0x4], r7 is updated to r7 + 0x4
(gdb) p/x $r7
$17 = 0x20000228
(gdb) n
94          str     r1, [r7, #0x4]!     @ After the access to memory[r7 + 0x4], r7 is updated to r7 + 0x4
(gdb) p/x (int[6])word_array_2
$18 = {0x0, 0x13121110, 0x0, 0x0, 0x0, 0x0}
(gdb) p/x $r7
$19 = 0x2000022c
(gdb) n
98          mov     r0, #0
(gdb) p/x (int[8])word_array_2
$20 = {0x0, 0x13121110, 0x23222120, 0x0, 0x0, 0x0, 0xf42400, 0x20000248}
```

```as
109         ldr     r0, [pc, #20]
(gdb) x/x (int)($pc + 4 + 20) & ~0x2
0x80002f0 <appmain+172>:        0x00050004
(gdb) n
110         ldr     r1, [pc, #20]
(gdb) p/x $r0
$21 = 0x50004
(gdb) x/x (int)($pc + 4 + 20) & ~0x2
0x80002f4 <appmain+176>:        0x00070006
(gdb) n
111         ldr.w   r2, [pc, #20]
(gdb) p/x $r1
$22 = 0x70006
(gdb) x/x (int)($pc + 4 + 20) & ~0x2
0x80002f4 <appmain+176>:        0x00070006
(gdb) n
112         ldr.w   r3, [pc, #20]
(gdb) p/x $r2
$23 = 0x70006
(gdb) x/x (int)($pc + 4 + 20) & ~0x2
0x80002f8 <appmain+180>:        0x00090008
(gdb) n
113         ldr     r4, [pc, #20]
(gdb) p/x $r3
$24 = 0x90008
(gdb) x/x (int)($pc + 4 + 20) & ~0x2
0x80002fc <appmain+184>:        0x000b000a
(gdb) n
116         bx      lr          @ 16 bit
(gdb) p/x $r4
$25 = 0xb000a
```

- Cortex-M4 Devices Generic User Guide > 3.3.6 PC-relative expressions

- `output/mp_course_ex0709_mem_imm_offset_netduinoplus2_baremetal_qemu/app.s`

    ```as
    ...

    08000244 <appmain>:
    appmain():
    ...
     80002e8:	4770      	bx	lr
     80002ea:	0001      	.short	0x0001
     80002ec:	00030002 	.word	0x00030002
     80002f0:	00050004 	.word	0x00050004
     80002f4:	00070006 	.word	0x00070006
     80002f8:	00090008 	.word	0x00090008
     80002fc:	000b000a 	.word	0x000b000a
     8000300:	000d000c 	.word	0x000d000c
     8000304:	000f000e 	.word	0x000f000e
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0709_mem_imm_offset/appmain.S:49
     8000308:	20000200 	.word	0x20000200
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0709_mem_imm_offset/appmain.S:54
     800030c:	20000208 	.word	0x20000208
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0709_mem_imm_offset/appmain.S:65
     8000310:	20000210 	.word	0x20000210
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0709_mem_imm_offset/appmain.S:68
     8000314:	20000228 	.word	0x20000228

    ...
    ```
