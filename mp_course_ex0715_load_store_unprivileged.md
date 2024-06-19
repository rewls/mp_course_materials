# mp_course_ex0715_load_store_unprivileged_netduinoplus2_baremetal_qemu

## Debug

```as
28          ldr     r0, =int_array
(gdb) p/x (int[2])int_array
$1 = {0x11111111, 0x22222222}
(gdb) n
29          ldr     r1, =0xe000ed00 @ SCB (chip ID)
(gdb) n
30          mov     r2, #0
```

```as
34          ldr    r2, [r0]
(gdb) n
35          ldr    r3, [r1] @ Read chip ID
(gdb) p/x $r2
$2 = 0x11111111
(gdb) x/x $r1
0xe000ed00:     0x410fc240
(gdb) n
38          mov     r2, #0
(gdb) p/x $r3
$3 = 0x410fc240
```

```as
42          ldrt    r2, [r0]
(gdb) p/x $r2
$4 = 0x0
(gdb) n
43          ldrt    r3, [r1] @ Read chip ID
(gdb) p/x $r2
$5 = 0x11111111
(gdb) p/x $r3
$6 = 0x0
(gdb) n
WWDG_IRQHandler () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/cortexm/stm32f405/gcc_startup_stm32f405.S:304
304         b       .
(gdb) p/x $r3
$7 = 0x0
```
