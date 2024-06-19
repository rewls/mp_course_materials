# mp_course_ex0717_arithmetic_operation_netduinoplus_baremetal_qemu

## Source

```as
    @ adds    r0, r1, #0x0876         @ 32 bit instruction addw
```

- 주석 처리 제거하면 에러

```sh
$ make rebuildd
...
    @ adds    r0, r1, #0x0876         @ 32 bit instruction addw
make[1]: Entering directory '/home/rewls/git/ubiworks/output/mp_course_ex0717_arithmetic_operation_netduinoplus2_baremetal_qemu'
make[4]: *** No rule to make target 'app.elf', needed by 'CMakeFiles/reset'.  Stop.
...
```

## Debug

```as
29          msr     apsr_nzcvq, r3
(gdb) n
30          adds    r0, r1, r2              @ 16 bit instruction
(gdb) p/x $xpsr
$1 = 0x81000000
(gdb) x/2i $pc
=> 0x800025c <appmain+24>:      adds    r0, r1, r2
   0x800025e <appmain+26>:      msr     CPSR_f, r3
(gdb) n
31          msr     apsr_nzcvq, r3
(gdb) p/x $r0
$2 = 0x4
(gdb) p/x $xpsr
$3 = 0x1000000
(gdb) n
32          add     r0, r1, r2              @ 32 bit instruction
(gdb) x/2i $pc
=> 0x8000262 <appmain+30>:      add.w   r0, r1, r2
   0x8000266 <appmain+34>:      msr     CPSR_f, r3
(gdb) n
33          msr     apsr_nzcvq, r3
(gdb) p/x $r0
$4 = 0x4
(gdb) p/x $xpsr
$5 = 0x81000000
(gdb) n
34          adds    r0, r1, r9              @ 32 bit instruction
(gdb) x/2i $pc
=> 0x800026a <appmain+38>:      adds.w  r0, r1, r9
   0x800026e <appmain+42>:      msr     CPSR_f, r3
(gdb) n
35          msr     apsr_nzcvq, r3
(gdb) p/x $r0
$6 = 0x4
(gdb) p/x $xpsr
$7 = 0x1000000
(gdb) n
36          add     r0, r1, r9              @ 32 bit instruction
(gdb) x/2i $pc
=> 0x8000272 <appmain+46>:      add.w   r0, r1, r9
   0x8000276 <appmain+50>:      adds    r0, r1, r2
(gdb) n
39          adds    r0, r1, r2              @ 16 bit instruction
(gdb) p/x $xpsr
$8 = 0x81000000
(gdb) x/2i $pc
=> 0x8000276 <appmain+50>:      adds    r0, r1, r2
   0x8000278 <appmain+52>:      adds.w  r0, r1, r2
(gdb) n
40          adds.w  r0, r1, r2              @ 32 bit instruction
(gdb) x/2i $pc
=> 0x8000278 <appmain+52>:      adds.w  r0, r1, r2
   0x800027c <appmain+56>:      add.w   r0, r1, #2
(gdb) n
43          add     r0, r1, #0x0002         @ 32 bit instruction adds.w
(gdb) p/x $xpsr
$9 = 0x1000000
(gdb) x/2i $pc
=> 0x800027c <appmain+56>:      add.w   r0, r1, #2
   0x8000280 <appmain+60>:      addw    r0, r1, #2166   ; 0x876
(gdb) n
44          add     r0, r1, #0x0876         @ 32 bit instruction addw
(gdb) p/x $r0
$10 = 0x5
(gdb) p/x $xpsr
$11 = 0x1000000
(gdb) x/2i $pc
=> 0x8000280 <appmain+60>:      addw    r0, r1, #2166   ; 0x876
   0x8000284 <appmain+64>:      add.w   r0, r1, #4096   ; 0x1000
(gdb) n
46          add     r0, r1, #0x1000         @ 32 bit instruction adds.w
(gdb) p/x $r0
$12 = 0x879
(gdb) x/2i $pc
=> 0x8000284 <appmain+64>:      add.w   r0, r1, #4096   ; 0x1000
   0x8000288 <appmain+68>:      mov.w   r0, #0
(gdb) p/x $r1
$13 = 0x3
(gdb) n
49          mov     r0, #0
(gdb) p/x $r0
$14 = 0x1003
(gdb) p/x $xpsr
$15 = 0x1000000
```

```as
59          adds    r5, r1, r3              @ carry
(gdb) p/x $r1
$16 = 0x80000000
(gdb) p/x $r3
$17 = 0x80000000
(gdb) n
60          adc     r6, r2, r4              @ r6:r5   0x 00000001 00000000
(gdb) p/x $r5
$18 = 0x0
(gdb) p/x $xpsr
$19 = 0x71000000
(gdb) p/x $r2
$20 = 0x0
(gdb) p/x $r4
$21 = 0x0
(gdb) n
63          mov     r0, #0
(gdb) p/x $r6
$22 = 0x1
```

```as
73          adds    r5, r1, r3              @ no carry
(gdb) p/x $r1
$23 = 0x80000000
(gdb) p/x $r3
$24 = 0x70000000
(gdb) n
74          adc     r6, r2, r4              @ r6:r5   0x 00000000 f0000000
(gdb) p/x $r5
$25 = 0xf0000000
(gdb) p/x $xpsr
$26 = 0x81000000
(gdb) n
77          mov     r0, #0
(gdb) p/x $r6
$27 = 0x0
```

```as
85          subs    r0, r1, r2              @ 16 bit instruction
(gdb) p/x $r1
$28 = 0x3
(gdb) p/x $r2
$29 = 0x1
(gdb) x/2i $pc
=> 0x80002ec <appmain+168>:     subs    r0, r1, r2
   0x80002ee <appmain+170>:     msr     CPSR_f, r3
(gdb) n
86          msr     apsr_nzcvq, r3
(gdb) p/x $r0
$30 = 0x2
(gdb) p/x $xpsr
$31 = 0x21000000
(gdb) n
87          sub     r0, r1, r2              @ 32 bit instruction
(gdb) x/2i $pc
=> 0x80002f2 <appmain+174>:     sub.w   r0, r1, r2
   0x80002f6 <appmain+178>:     msr     CPSR_f, r3
(gdb)
88          msr     apsr_nzcvq, r3
(gdb) p/x $xpsr
$32 = 0x81000000
(gdb)
89          subs    r0, r1, r9              @ 32 bit instruction
(gdb) p/x $r1
$33 = 0x3
(gdb) p/x $r9
$34 = 0x1
(gdb) x/2i $pc
=> 0x80002fa <appmain+182>:     subs.w  r0, r1, r9
   0x80002fe <appmain+186>:     msr     CPSR_f, r3
(gdb) n
90          msr     apsr_nzcvq, r3
(gdb) p/x $r0
$35 = 0x2
(gdb) p/x $xpsr
$36 = 0x21000000
(gdb) n
91          sub     r0, r1, r9              @ 32 bit instruction
(gdb) x/2i $pc
=> 0x8000302 <appmain+190>:     sub.w   r0, r1, r9
   0x8000306 <appmain+194>:     subs    r0, r1, r2
(gdb) p/x $xpsr
$37 = 0x81000000
(gdb) x/2i $pc
=> 0x8000306 <appmain+194>:     subs    r0, r1, r2
   0x8000308 <appmain+196>:     subs.w  r0, r1, r2
(gdb) n
95          subs.w  r0, r1, r2              @ 32 bit instruction
(gdb) x/2i $pc
=> 0x8000308 <appmain+196>:     subs.w  r0, r1, r2
   0x800030c <appmain+200>:     sub.w   r0, r1, #2
```

```as
98          sub     r0, r1, #2              @ 32 bit instruction subs.w
(gdb) p/x $xpsr
$38 = 0x21000000
(gdb) x/2i $pc
=> 0x800030c <appmain+200>:     sub.w   r0, r1, #2
   0x8000310 <appmain+204>:     subw    r0, r1, #2166   ; 0x876
(gdb) n
99          sub     r0, r1, #0x876          @ 32 bit instruction subw
(gdb) p/x $r0
$39 = 0x1
(gdb) p/x $xpsr
$40 = 0x21000000
(gdb) x/2i $pc
=> 0x8000310 <appmain+204>:     subw    r0, r1, #2166   ; 0x876
   0x8000314 <appmain+208>:     sub.w   r0, r1, #4096   ; 0x1000
(gdb) p/x $r0
$41 = 0xfffff78d
(gdb) x/2i $pc
=> 0x8000314 <appmain+208>:     sub.w   r0, r1, #4096   ; 0x1000
   0x8000318 <appmain+212>:     sub.w   r0, r2, #2
   0x8000318 <appmain+212>:     sub.w   r0, r2, #2
(gdb) n
103         sub     r0, r2, #2
(gdb) p/x $r0
$42 = 0xfffff003
(gdb) p/x $xpsr
$43 = 0x21000000
```

```as
104         rsb     r0, r2, #2
(gdb) p $r2
$44 = 1
(gdb) n
105         sub     r0, r2, r1
(gdb) p $r0
$45 = 1
```

```as
106         rsb     r0, r2, r1
(gdb) p $r2
$46 = 1
(gdb) p $r1
$47 = 3
(gdb) n
109         mov     r0, #0
(gdb) p $r0
$48 = 2
```

```as
119         subs    r5, r1, r3              @ borrow (no carry)
(gdb) p/x $r1
$49 = 0x1
(gdb) p/x $r3
$50 = 0x2
(gdb) n
120         sbc     r6, r2, r4              @ r6:r5   0x 00000000 ffffffff
(gdb) p/x $r5
$51 = 0xffffffff
(gdb) p/x $xpsr
$52 = 0x81000000
(gdb) p/x $r2
$53 = 0x1
(gdb) p/x $r4
$54 = 0x0
(gdb) n
123         mov     r0, #0
(gdb) p/x $r6
$55 = 0x0
```

```as
133         subs    r5, r1, r3              @ not borrow (carry)
(gdb) p/x $r1
$56 = 0x1
(gdb) p/x $r3
$57 = 0x1
(gdb) n
134         sbc     r6, r2, r4              @ r6:r5   0x 00000001 00000000
(gdb) p/x $r5
$58 = 0x0
(gdb) p/x $xpsr
$59 = 0x61000000
(gdb) n
137         mov     r0, #0
(gdb) p/x $r6
$60 = 0x1
```

```as
145         mul     r0, r1, r2              @ 0x 0000 0006 * 0x 0000 0002 (          2): 6 *           2 =           12 (0x 0000 0000 0000 000c) ==         12 (0x 0000 000c) (Valid  )
(gdb) n
146         mul     r0, r1, r3              @ 0x 0000 0006 * 0x ffff fffe (         -2): 6 *          -2 =          -12 (0x ffff ffff ffff fff4) ==        -12 (0x ffff fff4) (Valid  )
(gdb) p/x $r0
$61 = 0xc
(gdb) n
147         mul     r0, r1, r4              @ 0x 0000 0006 * 0x 8000 0000 (-2147483648): 6 * -2147483648 = -12884901888 (0x ffff fffd 0000 0000) !=          0 (0x 0000 0000) (Invalid)
(gdb) p/x $r0
$62 = 0xfffffff4
(gdb) n
151         udiv    r0, r1, r2
(gdb) p/x $r0
$63 = 0x0
(gdb) n
152         udiv    r0, r1, r3
(gdb) p/x $r0
$64 = 0x3
(gdb) n
153         sdiv    r0, r1, r3
(gdb) p/x $r0
$65 = 0x0
(gdb) n
156         udiv    r0, r1, r5
(gdb) p $r0
$66 = -3
(gdb) p/x $r5
$67 = 0x0
(gdb) n
159         ldr     r7, =0xe000ed14 @ SCB->CCR
(gdb) p/x $r0
$68 = 0x0
```

```as
    @@@@    Enable divided by zero trap
    ldr     r7, =0xe000ed14 @ SCB->CCR
    ldr     r6, [r7]
    orr     r6, 0x10 @ DIV_0_TRP bit[4]
    str     r6, [r7]

    @@@@    Enable usage failt
    ldr     r7, =0xe000ed24 @ SCB->SHCSR
    ldr     r6, [r7]
    orr     r6, 0x40000 @ USGFAULTENA bit[18]
    str     r6, [r7]
```

```as
170         udiv    r0, r1, r5
(gdb) p/x $pc
$69 = 0x80003bc
(gdb) n
UsageFault_Handler () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0717_arithmetic_operation/appmain.S:225
225         ldr     r1, [sp, #24]
(gdb) n
226         add     r1, #4
(gdb) p/x $r1
$70 = 0x80003bc
(gdb) n
227         str     r1, [sp, #24]
(gdb) n
228         bx      lr
(gdb)
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0717_arithmetic_operation/appmain.S:173
173         mov     r0, #0
(gdb) p/x $pc
$71 = 0x80003c0
(gdb) n
174         mov     r1, #1
(gdb)
175         mov     r2, #2
(gdb)
176         mov     r3, #3
(gdb)
178         mla     r0, r1, r2, r3 @ r0 = r3 + r1 * r2
(gdb) n
179         mls     r0, r1, r2, r3 @ r0 = r3 - r1 * r2
(gdb) p $r0
$72 = 5
(gdb) n
182         mov     r0, #0
(gdb) p $r0
$73 = 1
(gdb) n
183         mov     r1, #1
(gdb)
184         mov     r2, #2
(gdb)
185         ldr     r3, =#0x12345678
(gdb)
186         mov     r4, #0x10
(gdb)
189         umull   r1, r2, r3, r4 @ r2:r1 = r3 * r4
(gdb)
192         mov     r1, #1
(gdb) p/x $r1
$74 = 0x23456780
(gdb) p/x $r2
$75 = 0x1
(gdb) n
193         mov     r2, #2
(gdb)
195         umlal   r1, r2, r3, r4 @ r2:r1 = r2:r1 + r3 * r4
(gdb)
198         mov     r0, #0x0 @ r1:r2 = 0x 0000 0000 0000 0000
(gdb) p/x $r1
$76 = 0x23456781
(gdb) p/x $r2
$77 = 0x3
(gdb) n
199         mov     r1, #0x0
(gdb)
200         mov     r2, #6
(gdb)
201         mov     r3, #2
(gdb)
202         mov     r4, #-2 @ 0x ffff fffe
(gdb)
205         smull r0, r1, r2, r3 @ r1:r0 = r2 * r3 = 0x 0000 0006 * 0x 0000 0002 (         2) = 0x 0000 0000 0000 000c (         12)
(gdb) n
206         smull r0, r1, r2, r4 @ r1:r0 = r2 * r3 = 0x 0000 0006 * 0x ffff fffe (        -2) = 0x ffff ffff ffff fff4 (        -12)
(gdb) p/x $r0
$78 = 0xc
(gdb) p/x $r1
$79 = 0x0
(gdb) n
208         umull r0, r1, r2, r3 @ r1:r0 = r2 * r3 = 0x 0000 0006 * 0x 0000 0002 (         2) = 0x 0000 0000 0000 000c (         12)
(gdb) p/x $r0
$80 = 0xfffffff4
(gdb) p/x $r1
$81 = 0xffffffff
(gdb) n
209         umull r0, r1, r2, r4 @ r1:r0 = r2 * r3 = 0x 0000 0006 * 0x ffff fffe (4294967294) = 0x 0000 0005 ffff fff4 (25769803764)
(gdb) p/x $r0
$82 = 0xc
(gdb) p/x $r1
$83 = 0x0
(gdb) n
212         mov     r1, #0xfffffffe @ r2:r1 = -2
(gdb) p/x $r0
$84 = 0xfffffff4
(gdb) p/x $r1
$85 = 0x5
(gdb) n
213         mov     r2, #0xffffffff
(gdb)
215         smlal   r1, r2, r3, r4 @  r2:r1 = r2:r1 + (r3 * r4) = -2 + (2 * -2) = -6
(gdb)
218         bx      lr
(gdb) p/x $r1
$86 = 0xfffffffa
(gdb) p/x $r2
$87 = 0xffffffff
```
