/*
 * b11.S
 *
 *  Created on: Aug 28, 2018
 *      Author: Alexa
 */
.text
.global main
.set MYLED_BASEADDR, 0x4BB00000
.set MY_SW_BTNS_BASEADDR, 0x4BB02000
main:
 /* First two lines are known as Pseudo Instructions (loading a constant
value) */
 LDR r0, =MYLED_BASEADDR @ Load MYLED enable baseaddress into r0
 LDR r1, =MY_SW_BTNS_BASEADDR @ Load Switches and Buttons baseaddress into r1
enable_LEDs:
 MOV r2, #0x0F @ Let r2 = 0x0F
 STR r2, [r0] @ Store r2 in mem32[r0] (enable all LEDs)
always_loop:
 LDR r3, [r1] @ Load the values of switches (mem32[r1]) to r3
 STR r3, [r0, #0x4] @ Store the values in r3 to mem32[r0+0x4] (the LEDs)
 b always_loop @ Branch back to always_loop:
.end





