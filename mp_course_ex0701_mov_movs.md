# mp_course_ex0701_mov_movs_netduinoplus2_baremetal_qemu

## Debug

```as
30          mov     r4, r1
(gdb) p $r1
$1 = -1
(gdb) p/x $xpsr
$3 = 0x1000000
(gdb) p $r2
$4 = 0
(gdb) n
32          mov     r4, r3
(gdb) p/x $xpsr
$5 = 0x1000000
(gdb) p/x $r3
$6 = 0x1
(gdb) n
35          mov     r0, #0
(gdb) p/x $xpsr
$7 = 0x1000000
```

```as
43          movs    r4, r1
(gdb) p $r1
$8 = -1
(gdb) n
44          movs    r4, r2
(gdb) p/x $xpsr
$10 = 0x81000000
(gdb) p $r2
$11 = 0
(gdb) n
45          movs    r4, r3
(gdb) p/x $xpsr
$12 = 0x41000000
(gdb) p $r3
$13 = 1
(gdb) n
48          bx      lr
(gdb) p/x $xpsr
$14 = 0x1000000
```
