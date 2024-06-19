# mp_course_ex0713_stack_push_pop_netduinoplus2_baremetal_qemu

## Debug

```as
(gdb) n
23          mov     r1, #1
(gdb)
24          mov     r2, #2
(gdb)
25          mov     r3, #3
(gdb)
26          mov     r4, #4
(gdb)
27          mov     r5, #5
(gdb)
28          mov     r6, #6
(gdb)
29          mov     r7, #7
(gdb)
30          mov     r8, #8
(gdb)
33          push    {r1, r4-r7}     @ Decrese Before (Pre-indexing, High -> Low), Write Back
(gdb) x/x $sp
0x2001ffe8:     0x080001ad
(gdb) n
34          push    {r8}
(gdb) x/5x $sp
0x2001ffd4:     0x00000001      0x00000004      0x00000005      0x00000006
0x2001ffe4:     0x00000007
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0713_stack_push_pop/appmain.S:37
37          mov     r0, #0
(gdb) x/x $sp
0x2001ffd0:     0x00000008
```

```as
48          pop     {r8}            @ Increase After (Post-indexing, Low -> High), Write Back
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0713_stack_push_pop/appmain.S:49
49          pop     {r0, r1}
(gdb) p/x $r8
$1 = 0x8
(gdb) x/x $sp
0x2001ffd4:     0x00000001
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0713_stack_push_pop/appmain.S:50
50          pop     {r2-r4}
(gdb) p $r0
$2 = 1
(gdb) p $r1
$3 = 4
(gdb) x/x $sp
0x2001ffdc:     0x00000005
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0713_stack_push_pop/appmain.S:53
53          mov     r0, #0
(gdb) p $r2
$4 = 5
(gdb) p $r3
$5 = 6
(gdb) x/x $sp
0x2001ffe8:     0x080001ad
```

```as
59          push    {r0-r3, lr}
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0713_stack_push_pop/appmain.S:60
60          mov     r0, #1
(gdb) x/5x $sp
0x2001ffd4:     0x00000000      0x00000001      0x00000002      0x00000003
0x2001ffe4:     0x08000531
```

```as
66          pop     {r0-r3, pc}
(gdb)
main () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c:82
82          for (;;) {
(gdb) p $r0
$6 = 0
(gdb) p $r1
$7 = 1
(gdb) p $pc
$8 = (void (*)()) 0x8000530 <main+80>
```
