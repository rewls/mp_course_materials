# mp_course_ex0607_ge_bits_netduinoplus2_baremetal_qemu

## Debug

```as
26          ssub16  r2, r0, r1      @ r2 = (-1,  1) (0x ffff 0001) ge = 00 11
(gdb) p/x $r0
$1 = 0x10004
(gdb) p/x $r1
$2 = 0x20003
(gdb) n
27          sel     r2, r1, r0      @ r2 = ( 1,  3) (0x 0001 0003) Min.
(gdb) p/x $r2
$3 = 0xffff0001
(gdb) p/x $xpsr
$4 = 0x1030000
(gdb) n
27          sel     r2, r1, r0      @ r2 = ( 1,  3) (0x 0001 0003) Min.
(gdb) p/x $r2
$5 = 0x10003
(gdb) n
31          bx      lr
(gdb) p/x $r2
$6 = 0x20004
```
