# mp_course_ex0705_mvn_netduinoplus2_baremetal_qemu

## Debug

```as
25          mvn     r3, r7
(gdb) p/x $r7
$1 = 0xf0f0f0f0
(gdb) n
28          bx      lr
(gdb) p/x $r3
$2 = 0xf0f0f0f
```
