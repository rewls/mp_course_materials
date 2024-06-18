# mp_course_ex0706_vmov_netduinoplus2_baremetal_qemu

## Debug

```as
23          vmov.f32 s0, #2.25000000
(gdb) n
26          vmov    r0, s0
(gdb) p $s0
$1 = 2.25
(gdb) p/x $s0
$2 = 0x2
(gdb) info register s0
s0             2.25                (raw 0x40100000)
(gdb) n
29          vmov.f32 s0, #1.0
(gdb) p/x $r0
$3 = 0x40100000
(gdb) n
32          vmov    s0, r0
(gdb) p $s0
$4 = 1
(gdb) p/x $s0
$5 = 0x1
(gdb) info register s0
s0             1                   (raw 0x3f800000)
(gdb) n
35          bx      lr
(gdb) info register s0
s0             2.25                (raw 0x40100000)
```
