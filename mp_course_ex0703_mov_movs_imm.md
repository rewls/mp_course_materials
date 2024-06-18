# mp_course_ex0703_mov_movs_imm

## Debug

```as
26          mov     r3, #0x34
(gdb) n
28          mov     r3, #0
(gdb) p/x $xpsr
$1 = 0x1000000
(gdb) n
31          movs    r3, #0x34
(gdb) p/x $xpsr
$2 = 0x1000000
(gdb) n
33          movs    r3, #0x0
(gdb) p/x $xpsr
$3 = 0x1000000
(gdb) n
36          bx      lr
(gdb) p/x $xpsr
$4 = 0x41000000
```
