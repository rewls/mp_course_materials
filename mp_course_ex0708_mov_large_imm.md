# mp_course_ex0708_mov_large_imm_netduinoplus_baremetal_qemu

## Debug

- `output/mp_course_ex0708_mov_large_imm_netduinoplus2_baremetal_qemu/app.s`

    ```as
    ...

    08000244 <test1>:
    test1():
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0708_mov_large_imm/appmain.S:22
     8000244:	4b01      	ldr	r3, [pc, #4]	; (800024c <test1+0x8>)
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0708_mov_large_imm/appmain.S:23
     8000246:	4c02      	ldr	r4, [pc, #8]	; (8000250 <test1+0xc>)
    ...
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0708_mov_large_imm/appmain.S:22
     800024c:	34567890 	.word	0x34567890
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0708_mov_large_imm/appmain.S:23
     8000250:	45678901 	.word	0x45678901

    ...

    08000254 <appmain>:
    appmain():
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0708_mov_large_imm/appmain.S:37
     8000254:	4904      	ldr	r1, [pc, #16]	; (8000268 <appmain+0x14>)
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0708_mov_large_imm/appmain.S:38
     8000256:	4a05      	ldr	r2, [pc, #20]	; (800026c <appmain+0x18>)
    ...
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0708_mov_large_imm/appmain.S:37
     8000268:	12345678 	.word	0x12345678
    /home/rewls/git/ubiworks/library/mp_course_materials/app/mp_course_ex0708_mov_large_imm/appmain.S:38
     800026c:	23456789 	.word	0x23456789
    ```

```as
43          movw    r0, #0x789A @ Set R0 to 0x0000789A
(gdb) p/x $r0
$2 = 0x1
(gdb) n
44          movt    r0, #0x3456 @ Set upper 16-bit of R0 to 0x3456, now R0 = 0x3456789A
(gdb) p/x $r0
$3 = 0x789a
(gdb) n
47          bx      lr
(gdb) p/x $r0
$4 = 0x3456789a
```
