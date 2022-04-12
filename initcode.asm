
initcode.o:     file format elf32-i386


Disassembly of section .text:

00000000 <start>:


# exec(init, argv)
.globl start
start:
  pushl $argv
   0:	68 28 00 00 00       	push   $0x28
  pushl $init
   5:	68 1f 00 00 00       	push   $0x1f
  pushl $0x1000  // where caller pc would be
   a:	68 00 10 00 00       	push   $0x1000
  movl $SYS_exec, %eax
   f:	b8 07 00 00 00       	mov    $0x7,%eax
  int $T_SYSCALL
  14:	cd 40                	int    $0x40

00000016 <exit>:

# for(;;) exit();
exit:
  movl $SYS_exit, %eax
  16:	b8 02 00 00 00       	mov    $0x2,%eax
  int $T_SYSCALL
  1b:	cd 40                	int    $0x40
  jmp exit
  1d:	eb f7                	jmp    16 <exit>

0000001f <init>:
  1f:	2f                   	das    
  20:	69 6e 69 74 00 00 66 	imul   $0x66000074,0x69(%esi),%ebp
  27:	90                   	nop

00000028 <argv>:
  28:	1f                   	pop    %ds
  29:	00 00                	add    %al,(%eax)
  2b:	00 00                	add    %al,(%eax)
  2d:	00 00                	add    %al,(%eax)
	...
