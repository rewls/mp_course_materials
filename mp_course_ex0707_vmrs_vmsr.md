# mp_course_ex0707_vmrs_vmsr_netduinoplus2_baremetal_qemu

## Debug

```as
24          vmov.f32 s0, #1.00000000
(gdb) n
25          vmov.f32 s1, #2.25000000
(gdb)
26          vcmp.f32 s0, s1
(gdb) p/x $fpscr
$1 = 0x0
(gdb) n
29          vmrs    r0, FPSCR
(gdb) p/x $fpscr
$2 = 0x80000000
(gdb) n
32          vmrs    APSR_nzcv, FPSCR
(gdb) p/x $r0
$3 = 0x80000000
(gdb) p/x $xpsr
$4 = 0x1000000
(gdb) n
35          vmsr    FPSCR, r3
(gdb) p/x $xpsr
$5 = 0x81000000
(gdb) p/x $r3
$6 = 0x0
(gdb) n
38          bx      lr
(gdb) p/x $fpscr
$7 = 0x0
```
