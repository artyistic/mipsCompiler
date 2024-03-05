	.text
	.globl main
main:		# METHOD ENTRY
__start:    # add __start label for main only
	sw    $ra, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	sw    $fp, 0($sp)	#PUSH
	subu  $sp, $sp, 4
	addu  $fp, $sp, 8
	lw    $ra, 0($fp)
	move  $t0, $fp		#save control link
	lw    $fp, -4($fp)	#restore FP
	move  $sp, $t0		#restore SP
	li    $v0, 10     # load exit code for syscall
	syscall        # only do this for main