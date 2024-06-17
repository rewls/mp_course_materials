# mp_course_ex0604_accessing_control-_2

## mp_course_ex0604_accessing_control_stm32vldisco_baremetal_qemu

### Source

```as
    ldr     r1, =0xe000ed00 @ SCB
    mov     r2, #0
    ldr     r2, [r1] @ Read chip ID
```

- Cortex-M3 Devices Generic User Guide > 4.3 System control block

### Debug

```as
28          msr     control, r0
(gdb) p/x $control
$1 = 0x0
(gdb) p/x $r0
$2 = 0x2
(gdb) p/x $sp
$3 = 0x20001fe8
(gdb) p/x $msp
$4 = 0x20001fe8
(gdb) p/x $psp
$5 = 0x0
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0604_accessing_control/appmain.S:30
30          add     sp, #0x20
(gdb) p/x $control
$6 = 0x2
(gdb) p/x $sp
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0604_accessing_control/appmain.S:32
32          mrs     r0, control
(gdb) p/x $sp
$8 = 0x20
```

```as
34          msr     control, r0
(gdb) p/x $r0
$9 = 0x0
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0604_accessing_control/appmain.S:36
36          mrs     r0, control
(gdb) p/x $control
$10 = 0x0
(gdb) p/x $sp
$11 = 0x20001fe8
```

```as
38          msr     control, r0
(gdb) p/x $r0
$1 = 0x2
(gdb) n
appmain () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0604_accessing_control/appmain.S:40
40          mov     r0, #0
(gdb) p/x $control
$2 = 0x2
(gdb) p/x $sp
$3 = 0x20
```

```as
47          ldr     r1, =0xe000ed00 @ SCB
(gdb) n
48          mov     r2, #0
(gdb) p/x $r1
$4 = 0xe000ed00
```

```as
49          ldr     r2, [r1] @ Read chip ID
(gdb) n
51          mrs     r0, control
(gdb) p/x $r2
$5 = 0x410fc231
```

```as
53          msr     control, r0
(gdb) p/x $r0
$6 = 0x3
(gdb) n
55          mov     r0, #0
(gdb) p/x $control
$7 = 0x3
```

```as
58          ldr     r1, =0xe000ed00 @ SCB
(gdb) n
59          mov     r2, #0
(gdb)
60          ldr     r2, [r1] @ Read chip ID
(gdb)
WWDG_IRQHandler () at /home/rewls/git/ubiworks/library/ubinos/source/ubinos/bsp/arch/arm/cortexm/stm32f100/gcc_startup_stm32f100.S:278
278         b       .
(gdb) p/x $r2
$8 = 0x0
```

## mp_course_ex0604_accessing_control_2_stm32vldisco_baremetal_qemu

### Debug

```as
22          svc     #0x0
(gdb) n
SVC_Handler () at /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0604_accessing_control_2/appmain.S:30
30          mrs     r0, control
```

```as
32          msr     control, r0
(gdb) p/x $control
$1 = 0x0
(gdb) p/x $r0
$2 = 0x2
(gdb) p/x $sp
$3 = 0x20001fc8
(gdb) p/x $msp
$4 = 0x20001fc8
(gdb) p/x $psp
$5 = 0x0
(gdb) n
34          mrs     r0, control
(gdb) p/x $control
$6 = 0x0
(gdb) p/x $sp
$7 = 0x20001fc8
```

```as
43          msr     control, r0
(gdb) p/x $r0
$8 = 0x1
(gdb) p/x $control
$9 = 0x1
```

```as
50          ldr     r2, [r1] @ Read chip ID
(gdb) n
52          bx      lr
(gdb) p/x $r2
$13 = 0x410fc231
```
