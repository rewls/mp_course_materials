# mp_course_ex0714_stack_push_pop_fpu

## Debug

```as
32          vpush   {s0, s1-s7}
(gdb) x/x $sp
0x2001ffe8:     0x080001ad
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0714_stack_push_pop_fpu/appmain.S:35
35          vldr    s0, =0x00000000
(gdb) x/8x $sp
0x2001ffc8:     0x3dcccccd      0x3e4ccccd      0x3e99999a      0x3ecccccd
0x2001ffd8:     0x3f000000      0x3f19999a      0x3f333333      0x3f4ccccd
(gdb) x/8f $sp
0x2001ffc8:     0.100000001     0.200000003     0.300000012     0.400000006
0x2001ffd8:     0.5     0.600000024     0.699999988     0.800000012
```

```as
45          vpop    {s0, s1-s7}
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0714_stack_push_pop_fpu/appmain.S:48
48          bx     lr
(gdb) x/x $sp
0x2001ffe8:     0x080001ad
(gdb) p/f $s0
$1 = 0.100000001
(gdb) p/f $s1
$2 = 0.200000003
```
