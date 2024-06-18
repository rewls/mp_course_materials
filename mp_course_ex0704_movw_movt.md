# mp_course_ex0704_movw_movt_netduinoplus2_baremetal_qemu

## Debug

```as
25          movw    r6, #0x1234
(gdb) n
27          movt    r6, #0x8765
(gdb) p/x $r6
$1 = 0x1234
(gdb) n
30          bx      lr
(gdb) p/x $r6
$2 = 0x87651234
```
