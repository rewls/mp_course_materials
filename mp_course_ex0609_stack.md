# mp_course_ex0609_stack_stm32vldisco_baremetal_qemu

## Debug

```as
26          push    {r1}
(gdb) p $r1
$1 = 1
(gdb) x/x $sp
0x20001fe8:     0x08000145
(gdb) n
27          push    {r2}
(gdb) x/2x $sp
0x20001fe4:     0x00000001      0x08000145
(gdb) p $r2
$2 = 2
(gdb) n
28          mov     r1, #0
(gdb) x/2x $sp
0x20001fe0:     0x00000002      0x00000001
```

```as
30          pop     {r2}
(gdb) p $r2
$3 = 0
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0609_stack/appmain.S:31
31          pop     {r1}
(gdb) p $r2
$4 = 2
(gdb) x/x $sp
0x20001fe4:     0x00000001
(gdb) p $r1
$5 = 0
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0609_stack/appmain.S:33
33          mov     r1, #1
(gdb) p $r1
$6 = 1
(gdb) x/x $sp
0x20001fe8:     0x08000145
(gdb) n
34          mov     r2, #2
(gdb)
35          mov     r3, #3
(gdb)
36          push    {r1-r3}
(gdb)
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0609_stack/appmain.S:37
37          mov     r1, #0
(gdb) x/3x $sp
0x20001fdc:     0x00000001      0x00000002      0x00000003
(gdb) n
38          mov     r2, #0
(gdb)
39          mov     r3, #0
(gdb)
40          pop     {r1-r3}
(gdb)
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0609_stack/appmain.S:42
42          mov     r1, #1
(gdb) x/x $sp
0x20001fe8:     0x08000145
(gdb) p $r1
$7 = 1
(gdb) p $r2
$8 = 2
(gdb) p $r3
$9 = 3
```

```as
45          push    {r1, r3}
(gdb) p $r1
$10 = 1
(gdb) p $r3
$11 = 3
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0609_stack/appmain.S:46
46          mov     r1, #0
(gdb) x/2x $sp
0x20001fe0:     0x00000001      0x00000003
```

```as
49          pop     {r1, r3}
(gdb) p $r1
$12 = 0
(gdb) p $r3
$13 = 0
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0609_stack/appmain.S:51
51          mov     r1, #1
(gdb) x/x $sp
0x20001fe8:     0x08000145
(gdb) p $r1
$14 = 1
(gdb) p $r3
$15 = 3
(gdb) n
52          mov     r2, #2
(gdb)
53          mov     r3, #3
(gdb)
54          push    {r2, r1, r3}
(gdb)
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0609_stack/appmain.S:55
55          mov     r1, #0
(gdb) x/3x $sp
0x20001fdc:     0x00000001      0x00000002      0x00000003
(gdb) n
56          mov     r2, #0
(gdb)
57          mov     r3, #0
(gdb)
58          pop     {r3, r2, r1}
(gdb)
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0609_stack/appmain.S:60
60          mrs     r0, msp
(gdb) p $r1
$16 = 1
(gdb) p $r2
$17 = 2
(gdb) p $r3
$18 = 3
(gdb) p/x $msp
$19 = 0x20001fe8
```
