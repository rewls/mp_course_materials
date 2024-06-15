# mp_course_ex0503_main_3

## Debug

```as
20          movs    r0, #0
(gdb) p/x $r0
$1 = 0x1
(gdb) n
22          bx      lr
(gdb) p/x $r0
$2 = 0x0
(gdb) p/x $lr
$3 = 0x80005d1
(gdb) n
main () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/init.c:82
82          for (;;) {
(gdb) p/x $pc
$4 = 0x80005d0
(gdb)
```
