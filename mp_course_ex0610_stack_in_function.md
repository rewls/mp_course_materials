# mp_course_ex0610_stack_in_function_stm32vldisco_bareemetal_qemu

## Debug

```c
76          func01();
(gdb) x/6i func01
   0x80001e0 <func01>:  push    {r7}
   0x80001e2 <func01+2>:        add     r7, sp, #0
   0x80001e4 <func01+4>:        nop
   0x80001e6 <func01+6>:        mov     sp, r7
   0x80001e8 <func01+8>:        pop     {r7}
   0x80001ea <func01+10>:       bx      lr
(gdb) x/x $sp
0x20001fb8:     0x00000001
(gdb) p/x $r7
$1 = 0x20001fc0
(gdb) s
func01 () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:29
29      }
(gdb) x/2x $sp
0x20001fb4:     0x20001fc0      0x00000001
(gdb) n
appmain (argc=1, argv=0x20001fec) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:77
77          func02();
(gdb) x/x $sp
0x20001fb8:     0x00000001
(gdb) x/7i func02
   0x80001f0 <func02>:  push    {r7}
   0x80001f2 <func02+2>:        add     r7, sp, #0
   0x80001f4 <func02+4>:        movs    r3, #0
   0x80001f6 <func02+6>:        mov     r0, r3
   0x80001f8 <func02+8>:        mov     sp, r7
   0x80001fa <func02+10>:       pop     {r7}
   0x80001fc <func02+12>:       bx      lr
(gdb) s
func02 () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:33
33          return 0;
(gdb) x/x $sp
0x20001fb4:     0x20001fc0
(gdb) n
34      }
(gdb)
appmain (argc=1, argv=0x20001fec) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:79
79          r = func03(1);
(gdb) x/x $sp
0x20001fb8:     0x00000001
(gdb) x/10i func03
   0x8000200 <func03>:  push    {r7}
   0x8000202 <func03+2>:        sub     sp, #12
   0x8000204 <func03+4>:        add     r7, sp, #0
   0x8000206 <func03+6>:        str     r0, [r7, #4]
   0x8000208 <func03+8>:        ldr     r3, [r7, #4]
   0x800020a <func03+10>:       mov     r0, r3
   0x800020c <func03+12>:       adds    r7, #12
   0x800020e <func03+14>:       mov     sp, r7
   0x8000210 <func03+16>:       pop     {r7}
   0x8000212 <func03+18>:       bx      lr
(gdb) s
func03 (p1=1) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:38
38          return p1;
(gdb) x/i $pc
=> 0x8000208 <func03+8>:        ldr     r3, [r7, #4]
(gdb) p/x $r0
$2 = 0x1
(gdb) x/3x $sp
0x20001fa8:     0x00000000      0x00000001      0x20000188
(gdb) n
39      }
(gdb) x/i $pc
=> 0x800020a <func03+10>:       mov     r0, r3
(gdb) p/x $r3
$3 = 0x1
(gdb) n
appmain (argc=1, argv=0x20001fec) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:80
80          printf("result = %d\n", r);
(gdb) x/x $sp
0x20001fb8:     0x00000001
```

```c
82          r = func04(1, 2);
(gdb) x/17i func04
   0x8000220 <func04>:  push    {r7}
   0x8000222 <func04+2>:        sub     sp, #20
   0x8000224 <func04+4>:        add     r7, sp, #0
   0x8000226 <func04+6>:        str     r0, [r7, #4]
   0x8000228 <func04+8>:        str     r1, [r7, #0]
   0x800022a <func04+10>:       mov.w   r3, #4294967295 ; 0xffffffff
   0x800022e <func04+14>:       str     r3, [r7, #12]
   0x8000230 <func04+16>:       ldr     r2, [r7, #4]
   0x8000232 <func04+18>:       ldr     r3, [r7, #0]
   0x8000234 <func04+20>:       add     r3, r2
   0x8000236 <func04+22>:       str     r3, [r7, #12]
   0x8000238 <func04+24>:       ldr     r3, [r7, #12]
   0x800023a <func04+26>:       mov     r0, r3
   0x800023c <func04+28>:       adds    r7, #20
   0x800023e <func04+30>:       mov     sp, r7
   0x8000240 <func04+32>:       pop     {r7}
   0x8000242 <func04+34>:       bx      lr
(gdb) s
func04 (p1=1, p2=2) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:43
43          int r = -1;
(gdb) x/i $pc
=> 0x800022a <func04+10>:       mov.w   r3, #4294967295 ; 0xffffffff
(gdb) p/x $r0
$4 = 0x1
(gdb) p/x $r1
$5 = 0x2
(gdb) x/5x $sp
0x20001fa0:     0x00000002      0x00000001      0x080066e0      0x00000001
0x20001fb0:     0x00000000
45          r = p1 + p2;
(gdb) x/i $pc
=> 0x8000230 <func04+16>:       ldr     r2, [r7, #4]
(gdb) p/x $r3
$6 = 0xffffffff
(gdb) x/5x $sp
0x20001fa0:     0x00000002      0x00000001      0x080066e0      0xffffffff
0x20001fb0:     0x00000000
(gdb) n
47          return r;
(gdb) x/i $pc
=> 0x8000238 <func04+24>:       ldr     r3, [r7, #12]
(gdb) p/x $r3
$7 = 0x3
(gdb) x/5x $sp
0x20001fa0:     0x00000002      0x00000001      0x080066e0      0x00000003
0x20001fb0:     0x00000000
(gdb) n
48      }
(gdb)
appmain (argc=1, argv=0x20001fec) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:83
83          printf("result = %d\n", r);
(gdb) x/x $sp
0x20001fb8:     0x00000001
```

```c
85          r = func05(1, 2, 3, 4, 5);
(gdb) x/25i func05
   0x8000250 <func05>:  push    {r7}
   0x8000252 <func05+2>:        sub     sp, #28
   0x8000254 <func05+4>:        add     r7, sp, #0
   0x8000256 <func05+6>:        str     r0, [r7, #12]
   0x8000258 <func05+8>:        str     r1, [r7, #8]
   0x800025a <func05+10>:       str     r2, [r7, #4]
   0x800025c <func05+12>:       str     r3, [r7, #0]
   0x800025e <func05+14>:       mov.w   r3, #4294967295 ; 0xffffffff
   0x8000262 <func05+18>:       str     r3, [r7, #20]
   0x8000264 <func05+20>:       ldr     r2, [r7, #12]
   0x8000266 <func05+22>:       ldr     r3, [r7, #8]
   0x8000268 <func05+24>:       add     r2, r3
   0x800026a <func05+26>:       ldr     r3, [r7, #4]
   0x800026c <func05+28>:       add     r2, r3
   0x800026e <func05+30>:       ldr     r3, [r7, #0]
   0x8000270 <func05+32>:       add     r3, r2
   0x8000272 <func05+34>:       ldr     r2, [r7, #32]
   0x8000274 <func05+36>:       add     r3, r2
   0x8000276 <func05+38>:       str     r3, [r7, #20]
   0x8000278 <func05+40>:       ldr     r3, [r7, #20]
   0x800027a <func05+42>:       mov     r0, r3
   0x800027c <func05+44>:       adds    r7, #28
   0x800027e <func05+46>:       mov     sp, r7
   0x8000280 <func05+48>:       pop     {r7}
   0x8000282 <func05+50>:       bx      lr
(gdb) x/7i $pc
=> 0x80002f8 <appmain+56>:      movs    r3, #5
   0x80002fa <appmain+58>:      str     r3, [sp, #0]
   0x80002fc <appmain+60>:      movs    r3, #4
   0x80002fe <appmain+62>:      movs    r2, #3
   0x8000300 <appmain+64>:      movs    r1, #2
   0x8000302 <appmain+66>:      movs    r0, #1
   0x8000304 <appmain+68>:      bl      0x8000250 <func05>
(gdb) s
func05 (p1=1, p2=2, p3=3, p4=4, p5=5) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:52
52          int r = -1;
(gdb) x/i $pc
=> 0x800025e <func05+14>:       mov.w   r3, #4294967295 ; 0xffffffff
(gdb) x/9x $sp
0x20001f98:     0x00000004      0x00000003      0x00000002      0x00000001
0x20001fa8:     0x080066e0      0x00000003      0x00000001      0x20001fc0
0x20001fb8:     0x00000005
(gdb) n
54          r = p1 + p2 + p3 + p4 + p5;
(gdb) x/i $pc
=> 0x8000264 <func05+20>:       ldr     r2, [r7, #12]
(gdb) x/7x $sp
0x20001f98:     0x00000004      0x00000003      0x00000002      0x00000001
0x20001fa8:     0x080066e0      0xffffffff      0x00000001
(gdb) n
56          return r;
(gdb) x/i $pc
=> 0x8000278 <func05+40>:       ldr     r3, [r7, #20]
(gdb) x/9x $sp
0x20001f98:     0x00000004      0x00000003      0x00000002      0x00000001
0x20001fa8:     0x080066e0      0x0000000f      0x00000001      0x20001fc0
0x20001fb8:     0x00000005
(gdb) n
57      }
(gdb)
appmain (argc=1, argv=0x20001fec) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:86
86          printf("result = %d\n", r);
(gdb) x/x $sp
0x20001fb8:     0x00000005
```

```c
88          data = func06();
(gdb) x/3i $pc
=> 0x8000312 <appmain+82>:      add.w   r3, r7, #12
   0x8000316 <appmain+86>:      mov     r0, r3
   0x8000318 <appmain+88>:      bl      0x8000290 <func06>
(gdb) p/x &data
$8 = 0x20001fcc
(gdb) x/22i func06
   0x8000290 <func06>:  push    {r4, r7}
   0x8000292 <func06+2>:        sub     sp, #24
   0x8000294 <func06+4>:        add     r7, sp, #0
   0x8000296 <func06+6>:        str     r0, [r7, #4]
   0x8000298 <func06+8>:        movs    r3, #1
   0x800029a <func06+10>:       str     r3, [r7, #8]
   0x800029c <func06+12>:       movs    r3, #2
   0x800029e <func06+14>:       str     r3, [r7, #12]
   0x80002a0 <func06+16>:       movs    r3, #3
   0x80002a2 <func06+18>:       str     r3, [r7, #16]
   0x80002a4 <func06+20>:       movs    r3, #4
   0x80002a6 <func06+22>:       str     r3, [r7, #20]
   0x80002a8 <func06+24>:       ldr     r3, [r7, #4]
   0x80002aa <func06+26>:       mov     r4, r3
   0x80002ac <func06+28>:       add.w   r3, r7, #8
   0x80002b0 <func06+32>:       ldmia   r3, {r0, r1, r2, r3}
   0x80002b2 <func06+34>:       stmia.w r4, {r0, r1, r2, r3}
   0x80002b6 <func06+38>:       ldr     r0, [r7, #4]
   0x80002b8 <func06+40>:       adds    r7, #24
   0x80002ba <func06+42>:       mov     sp, r7
   0x80002bc <func06+44>:       pop     {r4, r7}
   0x80002be <func06+46>:       bx      lr
(gdb) s
func06 () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:63
63          data.a = 1;
(gdb) x/i $pc
=> 0x8000298 <func06+8>:        movs    r3, #1
(gdb) x/6x $sp
0x20001f98:     0x080066e0      0x20001fcc      0x00000000      0x08000313
0x20001fa8:     0x080066e0      0x0000000f
(gdb) n
64          data.b = 2;
(gdb) n
65          data.c = 3;
(gdb)
66          data.d = 4;
(gdb)
68          return data;
(gdb) x/i $pc
=> 0x80002a8 <func06+24>:       ldr     r3, [r7, #4]
(gdb) x/6x $sp
0x20001f98:     0x080066e0      0x20001fcc      0x00000001      0x00000002
0x20001fa8:     0x00000003      0x00000004
(gdb) n
69      }
(gdb) x/i $pc
=> 0x80002b6 <func06+38>:       ldr     r0, [r7, #4]
(gdb) x/4x $r4
0x20001fcc:     0x00000001      0x00000002      0x00000003      0x00000004
(gdb) n
appmain (argc=1, argv=0x20001fec) at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0610_stack_in_function/appmain.c:89
89          printf("result = %d, %d, %d, %d\n", data.a, data.b, data.c, data.d);
(gdb) x/x $sp
0x20001fb8:     0x00000005
```
