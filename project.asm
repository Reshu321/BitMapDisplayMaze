#Reshma Muvvala 
#2348.0W4
#Bitmap project
# ping pong game 
# uses bit map 
#instructions 
#set unit width : 8 
#set unit height: 8 
#display Width: 512
#display Height: 256
#base Address: gp data 


# w,a,s,d are used to shift the main key up, down, left, and right
#the space bar is to end the program 
#once the key exits the maze the program will end with the final score
#in the upper right hand corner. 

.eqv 	WIDTH 	64	#x
.eqv 	HEIGHT	64	Y

.eqv	BLUE	0x000000FF	#blue color
.eqv	WHITE	0x00FFFFFF	#white color
.eqv	CYAN	0x0000FFFF	#cyans color
.eqv	RED 	0x00FF0000	#red color
.data


.text 

main: 
	li	$s6, 0			# location on the bit map where the first main key is draw 
	li	$s2, 13 
	li	$s3, 20 
	
	move	$a0, $s2 		#Draws the main key first
	move	$a1, $s3
	add	$a2, $a2, WHITE
	jal	draw_pixel 
	move	$a2, $0
	j	GenerateApple		#jumps to the generate apple function 
	
	
	
table: 					#this function uses various loops to create the base table and maze 
	move	$a2, $0				
	add	$a2, $a2, BLUE		#the maze color is blue 
	li	$t0, 0			# the t0 is the i =0 
	li	$t1, 28			# t1 = 28
	li	$a0, 0			# x= 0 
	li	$a1, 1			# y = 1
	jal 	loopRow			# prints horizontal line 		
	bne	$t0, $t1, loopRow	#i<28
	
	
	lw	$t7, 0xffff0000		#this function is added a couple times throughout table to allow for input to be found faster			
	bne	$t7, 0, loopkey	
	
	
	li	$t0, 0			#creates row
	li	$t1, 24
	li	$a0, 31
	li	$a1, 1
	jal 	loopRow					
	bne	$t0, $t1, loopRow
	
	
	li	$a0, 1
	li	$a1, 30
	li	$t0, 0 
	li	$t1, 32
	jal 	loopRow					
	bne	$t0, $t1, loopRow
	
	li	$a0, 35
	li	$a1, 30
	li	$t0, 0 
	li	$t1, 20
	jal 	loopRow					
	bne	$t0, $t1, loopRow
	
	
	li	$a0, 55
	li	$a1, 1
	li	$t0, 0 
	li	$t1, 28 
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$a0, 1				#created column
	li	$a1, 1
	li	$t0, 0 
	li	$t1, 11
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$a0, 1
	li	$a1, 14
	li	$t0, 0 
	li	$t1, 16
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	########creating the maze##########
	
	
	li	$t0, 0
	li	$t1, 5
	li	$a0, 5
	li	$a1, 5
	jal	loopRow
	bne	$t0, $t1, loopRow 
	
	
	li	$t0, 0 
	li	$t1, 5 
	li	$a0, 6
	li	$a1, 5
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	
	li	$t0, 0
	li	$t1, 10
	li	$a0, 5
	li	$a1, 10
	jal	loopRow
	bne	$t0, $t1, loopRow 
	
	li	$t0, 0
	li	$t1, 6
	li	$a0, 15
	li	$a1, 3
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 7
	li	$a0, 10
	li	$a1, 10
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 3
	li	$a0, 1
	li	$a1, 15
	jal	loopRow
	bne	$t0, $t1, loopRow 
	
	
	li	$t0, 0
	li	$t1, 10
	li	$a0, 10
	li	$a1, 14
	jal	loopRow
	bne	$t0, $t1, loopRow 
	
	li	$t0, 0
	li	$t1, 10
	li	$a0, 20
	li	$a1, 4
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 4
	li	$a0, 19
	li	$a1, 4
	jal	loopRow
	bne	$t0, $t1, loopRow 
	
	
	li	$t0, 0
	li	$t1, 4
	li	$a0, 4
	li	$a1, 17
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 15
	li	$a0, 3
	li	$a1, 22
	jal	loopRow
	bne	$t0, $t1, loopRow 
	
	li	$t0, 0
	li	$t1, 3
	li	$a0, 1
	li	$a1, 25
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0
	li	$t1, 9
	li	$a0, 14
	li	$a1, 17
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 5
	li	$a0, 8
	li	$a1, 26
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0
	li	$t1, 3
	li	$a0, 9
	li	$a1, 26
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 4
	li	$a0, 24
	li	$a1, 8
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0
	li	$t1, 4
	li	$a0, 28
	li	$a1, 8
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 10
	li	$a0, 28
	li	$a1, 12
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0
	li	$t1, 5
	li	$a0, 35
	li	$a1, 7
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 7
	li	$a0, 32
	li	$a1, 12
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 10
	li	$a0, 32
	li	$a1, 16
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0
	li	$t1, 9
	li	$a0, 42
	li	$a1, 6
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	
	li	$t0, 0
	li	$t1, 9
	li	$a0, 25
	li	$a1, 7
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 3
	li	$a0, 28
	li	$a1, 1
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 3
	li	$a0, 39
	li	$a1, 1
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 8
	li	$a0, 46
	li	$a1, 13
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0
	li	$t1, 4
	li	$a0, 47
	li	$a1, 13
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 3
	li	$a0, 47
	li	$a1, 17
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 8
	li	$a0, 37
	li	$a1, 16
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 10
	li	$a0, 27
	li	$a1, 25
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0
	li	$t1, 4
	li	$a0, 28
	li	$a1, 20
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	li	$t0, 0
	li	$t1, 11
	li	$a0, 22
	li	$a1, 18
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 

	li	$t0, 0
	li	$t1, 8
	li	$a0, 44
	li	$a1, 19
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	
	li	$t0, 0 
	li	$t1, 5 
	li	$a0, 46
	li	$a1, 1
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	
	li	$t0, 0 
	li	$t1, 4
	li	$a0, 46
	li	$a1, 6
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0 
	li	$t1, 4
	li	$a0, 50
	li	$a1, 6
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	
	li	$t0, 0 
	li	$t1, 4
	li	$a0, 50
	li	$a1, 6
	jal	loopColumn 
	bne	$t0, $t1, loopColumn 
	
	
	li	$t0, 0
	li	$t1, 3
	li	$a0, 47
	li	$a1, 17
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	
	li	$t0, 0
	li	$t1, 6
	li	$a0, 43
	li	$a1, 22
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	
	li	$t0, 0				#exit 1 on the bottom row 
	li	$t1, 2
	li	$a0, 33
	li	$a1, 27
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0
	li	$t1, 2
	li	$a0, 36
	li	$a1, 27
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	
	li	$t0, 0				#exit on the left column 
	li	$t1, 3
	li	$a0, 1
	li	$a1, 12
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0				#exit on the toprow
	li	$t1, 3
	li	$a0, 32
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	
	

	
	lw	$t7, 0xffff0000			#loads input value if there is any 
	bne	$t7, 0, loopkey			#jumps to the loop key if user enters any input
	
	j	table				#else jumps back to infite loop
	
	
change: 
	move	$a2, $0 
	move	$s2, $a0
	move	$s3, $a1
	jr	$ra
	
drawScore: 
	jal	change			# adds back the previous values from temp variables to main 
	add	$a2, $a2, WHITE		#draws the pixels in white 
	beq	$s6, 1, drawOne		#jumps to draw first score 
	beq	$s6, 2, clear		#jumps to clear function 
	beq	$s6, 3, clear		#
	beq	$s6, 4, clear		#
	beq	$s6, 5, clear		#
	beq	$s6, 6, clear		#
	beq	$s6, 7, clear		#
	beq	$s6, 8, clear 		#
	beq	$s6, 9, clear		#
	beq	$s6, 10,clear		#
	j	table			# else it will jump back to the main funciton 
	
clear: 					# clear function will black out the previous number pixels
	move	$a2, $0			#sets the color of the pixel to be black
	beq	$s6, 2, drawOne		#clears previous score first
	beq	$s6, 3, drawTwo		#
	beq	$s6, 4, drawThree	#
	beq	$s6, 5, drawFour 	#
	beq	$s6, 6, drawFive 	#
	beq	$s6, 7, drawSix 	#
	beq	$s6, 8, drawSeven	#
	beq	$s6, 9, drawEight 	#
	beq	$s6, 10, drawNine	#
	

	
	
drawOne: 					#draws number one
	li	$t0, 0			
	li	$t1, 4
	li	$a0, 59
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	add	$a2, $a2, WHITE			#sets the next number to be written to be white
	beq	$s6, 2, drawTwo			# this condition will mean that the pixel has been blacked 
	move	$a2, $0				# and it will jump to the number 2 to draw the score 
	j	table

drawTwo: 					#draws number2
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 1
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 3
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 5
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 2
	li	$a0, 59
	li	$a1, 3
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0			
	li	$t1, 2
	li	$a0, 61
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	add	$a2, $a2, WHITE			#sets the next number to be written to be white
	beq	$s6, 3, drawThree		# this condition will mean that the pixel has been blacked 
	move	$a2, $0				# and it will jump to the number 3 to draw the score 
	j	table
	
drawThree: 					#draws number 3 
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 1
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 3
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 5
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 4
	li	$a0, 61
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	add	$a2, $a2, WHITE
						#sets the next number to be written to be white
	beq	$s6, 4, drawFour		# this condition will mean that the pixel has been blacked 
	move	$a2, $0				# and it will jump to the number 3 to draw the score 
	j	table
	
	
drawFour: 					#draws number 4
	li	$t0, 0			
	li	$t1, 2
	li	$a0, 59
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
		
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 3
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 4
	li	$a0, 61
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	add	$a2, $a2, WHITE
						#sets the next number to be written to be white
	beq	$s6, 5, drawFive		# this condition will mean that the pixel has been blacked 
	move	$a2, $0				# and it will jump to the number 3 to draw the score 
	j	table
	
	
drawFive: 					#draws number 5
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 1
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 3
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 5
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 2
	li	$a0, 59
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0			
	li	$t1, 2
	li	$a0, 61
	li	$a1, 3
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	add	$a2, $a2, WHITE
						#sets the next number to be written to be white
	beq	$s6, 6, drawSix			# this condition will mean that the pixel has been blacked 
	move	$a2, $0				# and it will jump to the number 3 to draw the score 
	j	table
	
	
	
drawSix:					#draw 6	
	li	$t0, 0			
	li	$t1, 5
	li	$a0, 59
	li	$a1, 0
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 3
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 2
	li	$a0, 61
	li	$a1, 3
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 5
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	add	$a2, $a2, WHITE
						#sets the next number to be written to be white
	beq	$s6, 7, drawSeven		# this condition will mean that the pixel has been blacked 
	move	$a2, $0				# and it will jump to the number 3 to draw the score 
	j	table
	
	
drawSeven:					# draw seven
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 1
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 5
	li	$a0, 61
	li	$a1, 0
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	add	$a2, $a2, WHITE
						#sets the next number to be written to be white
	beq	$s6, 8, drawEight		# this condition will mean that the pixel has been blacked 
	move	$a2, $0				# and it will jump to the number 3 to draw the score 
	j	table
	
	
drawEight: 					#draw 8
	li	$t0, 0			
	li	$t1, 5
	li	$a0, 59
	li	$a1, 0
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0			
	li	$t1, 5
	li	$a0, 61
	li	$a1, 0
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 1
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0		
	li	$t1, 3
	li	$a0, 58
	li	$a1, 3
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 5
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	add	$a2, $a2, WHITE
						#sets the next number to be written to be white
	beq	$s6, 9, drawNine		# this condition will mean that the pixel has been blacked 
	move	$a2, $0				# and it will jump to the number 3 to draw the score 
	j	table
	


drawNine: 					#draw 9
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 1
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 58
	li	$a1, 3
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 2
	li	$a0, 59
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0			
	li	$t1, 5
	li	$a0, 61
	li	$a1, 0
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	add	$a2, $a2, WHITE			#sets the next number to be written to be white
	beq	$s6, 10, drawTen		# this condition will mean that the pixel has been blacked 
	move	$a2, $0				# and it will jump to the number 3 to draw the score 
	j	table
	
	

drawTen: 					#draw 10
	li	$t0, 0			
	li	$t1, 4
	li	$a0, 57
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	 
	li	$t0, 0			
	li	$t1, 4
	li	$a0, 60
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0			
	li	$t1, 4
	li	$a0, 63
	li	$a1, 1
	jal	loopColumn
	bne	$t0, $t1, loopColumn
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 59
	li	$a1, 2
	jal	loopRow
	bne	$t0, $t1, loopRow
	
	li	$t0, 0			
	li	$t1, 3
	li	$a0, 59
	li	$a1, 5
	jal	loopRow
	bne	$t0, $t1, loopRow 
	move	$a2, $0
	j	table
			
	
	
loopkey: 

	move	$a0, $s2 					#stores orignal input in temp variables 
	move	$a1, $s3
	lw	$s3, 0xffff0004					#loads input in s3			
	beq	$s3, 32, exit					# input space
	beq	$s3, 119, up 					# input w
	beq	$s3, 115, down 					# input s
	beq	$s3, 97, left  					# input a
	beq	$s3, 100, right					# input d
	
	up:							#moves the pixel up one 
	li	$a2, 0						# black out the pixel
	jal	draw_pixel
	addi	$a1, $a1, -1					#decrement y value
	addi 	$a2, $0, WHITE					#draws the main pixel in white again
	jal	draw_pixel					#jumps to draw the updated pixel 
	jal	checkApple					#checks to see if an apple was consumed
	jal	checkExit_1					#checks to see if the main key entered any exits
	jal	checkExit_2					#
	jal	checkExit_3					#
	j	drawScore					#jumps to draw score to see if any apples were eaten 

down:	
	li	$a2, 0						# black out the pixel
	jal	draw_pixel					#jumps to draw black pixel
	addi	$a1, $a1, 1					#increments y valye
	addi 	$a2, $0, WHITE					#draws the main pixel in white again
	jal	draw_pixel					#jumps to draw the updated pixel 
	jal	checkApple					#checks to see if an apple was consumed
	jal	checkExit_1					#checks to see if the main key entered any exits
	jal	checkExit_2					#
	jal	checkExit_3					#
	j	drawScore					#jumps to draw score to see if any apples were eaten 

	
	
left:	
	
	li	$a2, 0						# black out the pixel
	jal 	draw_pixel					#draws black pixel 
	addi	$a0, $a0, -1					#decrements x value
	addi 	$a2, $0, WHITE					#makes the main key white 
	jal	draw_pixel					#jumps to draw the updated pixel 
	jal	checkApple					#checks to see if an apple was consumed
	jal	checkExit_1					#checks to see if the main key entered any exits
	jal	checkExit_2					#
	jal	checkExit_3					#
	j	drawScore					#jumps to draw score to see if any apples were eaten 
	

	
	
right:	
	li	$a2, 0						# black out the pixel
	jal	draw_pixel					# draws the black pixel
	addi	$a0, $a0, 1					#increments x value
	addi 	$a2, $0, WHITE					#draws the main key again in white
	jal	draw_pixel					#jumps to draw the updated pixel 
	jal	checkApple					#checks to see if an apple was consumed
	jal	checkExit_1					#checks to see if the main key entered any exits
	jal	checkExit_2					#
	jal	checkExit_3					#
	j	drawScore					#jumps to draw score to see if any apples were eaten 
		

checkApple: 							#this function first checks the x cordinates of the apple 
	beq	$a0, 33, checkApple1				#if they match the x coordinate then it jumps to the second function 
	beq	$a0, 39, checkApple2				# to check if the y coordinates are correct 
	beq	$a0, 49, checkApple3_8
	beq	$a0, 10, checkApple4
	beq	$a0, 5,  checkApple5
	beq	$a0, 17, checkApple6
	beq	$a0, 32, checkApple7
	beq	$a0, 52, checkApple9
	beq	$a0, 22, checkApple10

	
	jr	$ra				#returns to the main function 
	
checkApple1: 					#all these checkApple functions check for the y cooirdinate for the apple
	beq	$a1, 22, score 			#
	jr	$ra				#
checkApple2:					#
	beq	$a1, 18, score 			#
	jr	$ra				#
checkApple3_8:					#
	beq	$a1, 15, score 			#
	beq	$a1, 4, score			#
	jr	$ra				#
checkApple4: 					#
	beq	$a1, 8,  score			#
	jr	$ra				#
checkApple5: 					#
	beq	$a1, 27, score			#
	jr	$ra				#
checkApple6: 					#
	beq	$a1, 24, score			#
	jr	$ra				#
checkApple7: 					#
	beq	$a1, 10, score 			#
	jr	$ra				#
						#
checkApple9: 					#
	beq	$a1, 26, score 			#
	jr	$ra				#
checkApple10: 					#
	beq	$a1, 16, score 			#
	jr	$ra 				#
		
	
	
score: 						#if the x,y coordinates matched then it will increment score 
	addi	$s6, $s6, 1			
						
	move	$t2, $a0			#save original values in temp variables
	move	$t3, $a1
	move	$t4, $a2
	

	li $v0, 31				# play sound to signify score update
	li $a0, 79				#pitch of the sound
	li $a1, 300				#length sound is played
	li $a2, 45				#instrument
	li $a3, 127				# volume
	syscall	
	

	li $a0, 79				#this is the same as the code above i repeated it to extend the sound
	li $a1, 300
	li $a2, 45
	li $a3, 127
	syscall	
	
	move	$a0, $t2			#moves orginal values back into them from temp
	move	$a1, $t3
	move	$a2, $t4
	
	j	draw_pixel			#jumps to draw pixel then to main funcition 
	
	
	
checkExit_1: 					#first exit checks the x coordinates 

	beq	$a0, 34, continue1		#then checks the y cooridnates 
	beq	$a0, 35, continue1
	jr	$ra
	
		
continue1: 
	beq	$a1, 31, finishGame
	jr	$ra
	
checkExit_2:					#second exit checks the x coordinates
	beq	$a0, 0, continue2		#then the y coordinates
	jr	$ra
	
continue2: 
		
	beq	$a1, 13, finishGame
	beq	$a1, 14, finishGame 
	jr	$ra
	
checkExit_3:					#third exit function checks x coordinates
	beq	$a0, 29, continue3		#then the y coordinates
	beq	$a0, 30, continue3
	beq	$a0, 31, continue3
	jr	$ra
	
continue3: 
	beq	$a1, 0, finishGame		
	jr	$ra
	
finishGame: 
	j	exit				#user entered one of the three exits in the maze
				
GenerateApple: 					#function creates the apples in red 
	 # apple1 
	li	$a0, 49
	li	$a1, 15
	  
	move	$a2, $0
	add 	$a2, $a2, RED
	jal	draw_pixel 
	
	#apple2
	li	$a0, 33
	li	$a1, 22 
	jal	draw_pixel 
	
	#apple3

	li	$a0, 39
	li	$a1, 18
	jal	draw_pixel 
	
	
	#apple4 
	
	li	$a0, 10
	li	$a1, 8
	jal	draw_pixel 
	#move	$a2, $0
	
	#apple5 
	li	$a0, 5
	li	$a1, 27
	jal	draw_pixel 
	
	#apple6 

	li	$a0, 17
	li	$a1, 24
	jal	draw_pixel 

	#apple7 
	
	li	$a0, 32
	li	$a1, 10
	jal	draw_pixel 
	
	#apple8 
	li	$a0, 49
	li	$a1, 4
	jal	draw_pixel 
	
	#apple9 
	li	$a0, 52
	li	$a1, 26
	jal	draw_pixel 
	
	#apple10
	li	$a0, 22
	li	$a1, 16
	jal	draw_pixel 

	j	table
							
							
							
loopRow: 					#the loopRow and loopColumn function are the main functions that are used throughout the 
	addi	$a0, $a0, 1			#entire program. It created columns and rows for the maze
	addi	$t0, $t0, 1			# The a0 will be incremented 
	j	draw_pixel			# the t0 is the value that will keep track how many times the pixel needs to be printed 
						#and incremented 
loopColumn: 
	addi	$a1, $a1, 1			#increments y value
	addi	$t0, $t0, 1			#counter to see how many time y value needs to be printed 
	j	draw_pixel 


draw_pixel: 					#draws the pixel in the bitMap		
	mul	$s1, $a1, WIDTH   		# y * WIDTH	
	add	$s1, $s1, $a0	  		# add X
	mul	$s1, $s1, 4	  		# multiply by 4 to get word offset
	add	$s1, $s1, $gp			# add to base address
	sw	$a2, ($s1)			# store color at memory location
	jr	$ra
																	
exit:						#exit function 
	li	$v0, 10 
	syscall
	
	
	
