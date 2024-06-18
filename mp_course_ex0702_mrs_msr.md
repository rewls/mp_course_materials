# mp_course_ex0702_mrs_msr_netduinoplus_baremetal_qemu

## Debug

```as
27          mrs     r7, PRIMASK
(gdb) n
30          msr     PRIMASK, r2
(gdb) p/x $primask
$1 = 0x0
(gdb) p/x $r7
$2 = 0x0
(gdb) p/x $r2
$3 = 0x1
(gdb) n
32          mrs     r7, PRIMASK
(gdb) p/x $primask
$4 = 0x1
(gdb) n
33          msr     PRIMASK, r0
(gdb) p/x $r7
$5 = 0x1
(gdb) p/x $r0
$6 = 0x0
(gdb) n
36          mov     r0, #0
(gdb) p/x $primask
$7 = 0x0
```

```as
41          mrs     r7, CONTROL
(gdb) n
44          msr     CONTROL, r2
(gdb) p/x $control
$8 = 0x0
(gdb) p/x $r7
$9 = 0x0
(gdb) p/x $r2
$10 = 0x2
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0702_mrs_msr/appmain.S:46
46          mrs     r7, CONTROL
(gdb) p/x $control
$11 = 0x2
(gdb) n
47          msr     CONTROL, r0
(gdb) p/x $r7
$12 = 0x2
(gdb) p/x $r0
$13 = 0x0
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0702_mrs_msr/appmain.S:50
50          bx      lr
(gdb) p/x $control
$14 = 0x0
```
