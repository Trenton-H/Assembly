################################################################################
# Name:    <your name>
# Class:   CS2318 - <your section>
# Subject: Assignment 3 Part 3
# Date:    <turn-in date> 
################################################################################
#void PopulateArray1(char reply, int a1[], int* used1Ptr, int cap);
#int  PopulateArray1223(int a1[], int a2[], int a3[], int used1, int* used2Ptr, int* used3Ptr);
#void PopulateArray1223AuxO(int a3[], int* used3Ptr, int target);
#void PopulateArray1223AuxE(int a2[], int* used2Ptr, int target);
#void ProcArrays(int mean, int a1[], int a2[], int a3[], int used1, int* used2Ptr, int* used3Ptr);
#void MergeCopy2321(int* used2Ptr, int a1[], int a2[], int a3[], int* used3Ptr);
#void LtMeanGtMeanCopy1223(int mean, int a1[], int a2[], int a3[],
#                          int used1, int* used2Ptr, int* used3Ptr);
#void CoutCstr(const char cstr[]);
#void CoutCstrNL(const char cstr[]);
#void CoutOneInt(int oneInt);
#void ShowArray(const int a[], int size);
#void ShowArrayLabeled(const int array[], int used, const char label[]);
#
					.text
					.globl main
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#int main()
#{
###############################################################################
main:
#################
# Register usage:
#################
# $t0: holder for a value/address
# $t4: reply
# $s0: mean
# (usual ones for syscall & function call)
#                   int a1[12],
#                       a2[12],
#                       a3[12];
#                   char reply;
#                   int used1,
#                       used2,
#                       used3,
#                       mean;
#                   char begA1Str[]  = "beginning a1: ";
#                   char procA1Str[] = "processed a1: ";
#                   char commA2Str[] = "          a2: ";
#                   char commA3Str[] = "          a3: ";
#                   char dacStr[]    = "Do another case? (n or N = no, others = yes) ";
#                   char dlStr[]     = "================================";
#                   char byeStr[]    = "bye...";

					# PROLOG:
					####################(5)####################
					addiu $sp, $sp, -344
					sw $ra, 340($sp)
					sw $fp, 336($sp)
					addiu $fp, $sp, 344
					sw $s0, 28($sp)
					
					j begDataInitM					# "clutter-reduction" jump
endDataInitM:

					# BODY:
#                   cout << endl;
					li $a0, '\n'
					li $v0, 11
					syscall
#                   reply = 'y';
					li $t4, 'y'					# $t4 is reply
#                   goto WTest_m;
					j WTest_m
begW_m:
#                      PopulateArray1(reply, a1, &used1, 12);
					move $a0, $t4
					addi $a1, $sp, 192
					addi $a2, $sp, 188
					li $a3, 12
					jal PopulateArray1
#                      if (used1 <= 0) goto endI_m;
					lw $t0, 188($sp)				# $t0 has used1
					blez $t0, endI_m
begI_m:
#                         cout << endl;
					li $a0, '\n'
					li $v0, 11
					syscall
#                         ShowArrayLabeled(a1, used1, begA1Str);
					addi $a0, $sp, 192
					lw $a1, 188($sp)
					addi $a2, $sp, 32
					jal ShowArrayLabeled
#                         mean = PopulateArray1223(a1, a2, a3, used1, &used2, &used3);
					####################(10)####################	
					addi $a0, $sp, 192
					addi $a1, $sp, 240
					addi $a2, $sp, 288
					lw $a3, 188($sp)
					lw $t0, 184($sp)
					sw $t0, 16($sp)
					lw $t0, 180($sp)
					sw $t0, 20($sp)		
					jal PopulateArray1223 								
					sw $v0, 28($sp)						
#                         ShowArrayLabeled(a2, used2, commA2Str);
					addi $a0, $sp, 240
					lw $a1, 184($sp)
					addi $a2, $sp, 62
					jal ShowArrayLabeled
#                         ShowArrayLabeled(a3, used3, commA3Str);
					addi $a0, $sp, 288
					lw $a1, 180($sp)
					addi $a2, $sp, 77
					jal ShowArrayLabeled
#                         ProcArrays(mean, a1, a2, a3, used1, &used2, &used3);
					####################(10)####################
					addi $a0, $sp, 28
					addi $a1, $sp, 192
					addi $a2, $sp, 240
					addi $a3, $sp, 288
					lw $t0, 188($sp)
					sw $t0, 16($sp)
					lw $t0, 184($sp)
					sw $t0, 20($sp)
					lw $t0, 180($sp)
					sw $t0, 24($sp)
															
					jal ProcArrays
#                         ShowArrayLabeled(a1, used1, procA1Str);
					addi $a0, $sp, 192
					lw $a1, 188($sp)
					addi $a2, $sp, 47
					jal ShowArrayLabeled
#                         ShowArrayLabeled(a2, used2, commA2Str);
					addi $a0, $sp, 240
					lw $a1, 184($sp)
					addi $a2, $sp, 62
					jal ShowArrayLabeled
#                         ShowArrayLabeled(a3, used3, commA3Str);
					addi $a0, $sp, 288
					lw $a1, 180($sp)
					addi $a2, $sp, 77
					jal ShowArrayLabeled
endI_m:
#                      cout << endl;
					li $v0, 11
					li $a0, '\n'
					syscall
#                      cout << dacStr;
					addi $a0, $sp, 92
					jal CoutCstr
#                      cin >> reply;
					li $v0, 12
					syscall
					move $t4, $v0					# $t4 is reply					
#                      cout << endl;
					li $v0, 11
					li $a0, '\n'
					syscall
WTest_m:
#                   if (reply == 'n') goto xitW_m;
					li $t0, 'n'
					beq $t4, $t0, xitW_m
#                   if (reply != 'N') goto begW_m;
					li $t0, 'N'
					bne $t4, $t0, begW_m
xitW_m:
#                   CoutCstrNL(dlStr);
					addi $a0, $sp, 138
					jal CoutCstrNL					
#                   CoutCstrNL(byeStr);
					addi $a0, $sp, 171
					jal CoutCstrNL					
#                   CoutCstrNL(dlStr);
					addi $a0, $sp, 138
					jal CoutCstrNL					

					# EPILOG:
					####################(4)####################	
					lw $fp, 336($sp)
					lw $ra, 340($sp)
					addiu $sp, $sp, 344 
					lw $s0, 28($sp)				

#                   return 0;
#}
					li $v0, 10
					syscall

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void PopulateArray1(char reply, int a1[], int* used1Ptr, int cap)
#                         $a0        $a1        $a2           $a3
#{
###############################################################################
PopulateArray1:
#################
# Register usage:
#################
# $t0: holder for a value/address
# $t1: another holder for a value/address
# $t2: yet another holder for a value/address
# $a0: reply (initial value received as arg1)
# (usual ones for syscall & function call)
###############################################################################
#                   char einStr[] = "Enter integer #";
#                   char moStr[]  = "Max of ";
#                   char ieStr[]  = " ints entered...";
#                   char emiStr[] = "Enter more ints? (n or N = no, others = yes) ";
					# PROLOG:
					addiu $sp, $sp, -112
					sw $ra, 108($sp)
					sw $fp, 104($sp)
					addiu $fp, $sp, 112
					j begDataInitPA1				# "clutter-reduction" jump
endDataInitPA1:
					sw $a1, 4($fp)					# a1 as received saved in caller's frame
					sw $a2, 8($fp)					# used1Ptr as received saved in caller's frame
					sw $a3, 12($fp)					# cap as received saved in caller's frame
					# BODY:
#                   *used1Ptr = 0;
					sw $0, 0($a2)					# $a2 still has used1Ptr as received
#                   goto WTest_PA1;
					j WTest_PA1
begW_PA1:
#                      CoutCstr(einStr);
					addi $a0, $sp, 16
					jal CoutCstr
#                      CoutOneInt(*used1Ptr + 1);
					lw $a2, 8($fp)					# used1Ptr as received re-loaded into $a2
					 						# CoutCstr might have clobbered $a2
					lw $a0, 0($a2)					# $a0 has *used1Ptr
					addi $a0, $a0, 1				# *used1Ptr + 1 as arg1
					jal CoutOneInt
#                      cout << ':' << ' ';
					li $v0, 11
					li $a0, ':'
					syscall
					li $a0, ' '
					syscall
#                      cin >> a1[*used1Ptr];
					li $v0, 5					
					syscall						# $v0 has user-entered int
					lw $a1, 4($fp)					# a1 as received re-loaded into $a1
					lw $a2, 8($fp)					# used1Ptr as received re-loaded into $a2
					lw $a3, 12($fp)					# cap as received re-loaded into $a3
					 						# CoutOneInt might have clobbered $a1, $a2 & $a3
					lw $t1, 0($a2)					# $t1 has *used1Ptr
					sll $t2, $t1, 2					# $t2 has (*used1Ptr) * 4
					add $t2, $t2, $a1				# $t2 has &a1[*used1Ptr]
					sw $v0, 0($t2)
#                      ++(*used1Ptr);
					addi $t1, $t1, 1				# $t1 has *used1Ptr + 1
					sw $t1, 0($a2)
#                      if (*used1Ptr != cap) goto else_PA1;
					bne $t1, $a3, else_PA1				# $t1 still has up-to-date *used1Ptr
begI_PA1:
#                         CoutCstr(moStr);
					addi $a0, $sp, 32
					jal CoutCstr
#                         CoutOneInt(cap);
					lw $a0, 12($fp)					# cap as received loaded into $a0
											# not using $a3 as CoutCstr might have clobbered it
					jal CoutOneInt
#                         CoutCstr(ieStr);
					addi $a0, $sp, 86
					jal CoutCstr
#                         cout << endl;
					li $v0, 11
					li $a0, '\n'
					syscall
#                         reply = 'n';
					li $a0, 'n'					# $a0 is reply
#                      goto endI_PA1;
					j endI_PA1
 else_PA1:
#                         CoutCstr(emiStr);
					addi $a0, $sp, 40
					jal CoutCstr
#                         cin >> reply;
					li $v0, 12
					syscall
#					move $a0, $v0					# $a0 is reply
					sw $v0, 0($fp)					# reply saved in caller's frame
					# newline to offset shortcoming of syscall #12
					li $v0, 11
					li $a0, '\n'
					syscall
					lw $a0, 0($fp)					# retrieve reply saved previously
endI_PA1:
WTest_PA1:
#                   if (reply == 'n') goto xitW_PA1;
					li $t0, 'n'
					beq $a0, $t0, xitW_PA1
#                   if (reply != 'N') goto begW_PA1;
					li $t0, 'N'
					bne $a0, $t0, begW_PA1
xitW_PA1:
					# EPILOG:
					lw $fp, 104($sp)
					lw $ra, 108($sp)
					addiu $sp, $sp, 112  
#                   return;
#}
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
					jr $ra

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#int PopulateArray1223(int a1[], int a2[], int a3[], int used1, int* used2Ptr, int* used3Ptr)
#{
###############################################################################
PopulateArray1223:
#################
# Register usage:
#################
# $s0: total
# $t0: target
# $t1: hopPtr1
# $t9: endPtr1
# $v1: holder for a value/address
# (usual ones for function call)
###############################################################################
					####################(47)####################					
#                   int target,
#                       total,
#                       *hopPtr1,
#                       *endPtr1;
					# PROLOG:
					addiu $sp, $sp, -40
					sw $ra, 36($sp)
					sw $fp, 32($sp)
					addiu $fp, $sp, 40
					sw $s0, 16($sp)
					# BODY:
					sw $a0, 40($sp)				# save $a0 (= &a1[0]) in caller's frame
					sw $a1, 44($sp)				# save $a1 (= size1) in caller's frame
					sw $a2, 48($sp)				# save $a2 (= &a2[0]) in caller's frame
					sw $a3, 52($sp)
#                   *used2Ptr = 0;
					sw $0, 0($a2)
#                   *used3Ptr = 0;
					sw $0, 0($a2)
#                   total = 0;
					li $s0, 0
#                   hopPtr1 = a1;
					lw $t1, 40($sp)
					
#                   endPtr1 = a1 + used1;
					lw $v1, 40($sp)
					add $t9, $t9, $v1
					lw $v1, 52($sp)
					add $t9, $t9, $v1
#                   goto FTest_PA1223;
					j FTest_PA1223
begF_PA1223:
#                      target = *hopPtr1;
					lw $t0, 0($t1)
#                      total += target;
					add $s0, $s0, $t0
#                      if (target % 2 == 0) goto else_PA1223;
					
begI_PA1223:
#                         PopulateArray1223AuxO(a3, used3Ptr, target);
#                      goto endI_PA1223;
else_PA1223:
#                         PopulateArray1223AuxE(a2, used2Ptr, target);
endI_PA1223:
#                   ++hopPtr1;
FTest_PA1223:
#                   if (hopPtr1 < endPtr1) goto begF_PA1223;
#                   return total/used1;
					# EPILOG:
					lw $ra, 36($sp)
					lw $fp, 32($sp)
					addiu $fp, $sp, 40
					lw $s0, 16($sp)
#}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void PopulateArray1223AuxO(int a3[], int* used3Ptr, int target)
#{
###############################################################################
PopulateArray1223AuxO:
#################
# Register usage:
#################
# $t1: hopPtr3
# $t9: endPtr3
# $v1: holder for a value/address
###############################################################################
					####################(18)####################					
#                   int *hopPtr3,
#                       *endPtr3;
					# PROLOG:
					 						# no stack frame needed
					# BODY:
#                   hopPtr3 = a3 + *used3Ptr - 1;
#                   endPtr3 = a3;
#                   goto WTest_PA1223AO;
begW_PA1223AO:
#                      if (*hopPtr3 <= target) goto else_PA1223AO;
begI_PA1223AO:
#                         *(hopPtr3 + 1) = *hopPtr3;
#                         --hopPtr3;
#                      goto endI_PA1223AO;
else_PA1223AO:
#                         goto brkW_PA1223AO;
endI_PA1223AO:
WTest_PA1223AO:
#                   if (hopPtr3 >= endPtr3) goto begW_PA1223AO;
brkW_PA1223AO:
#                   *(hopPtr3 + 1) = target;
#                   ++(*used3Ptr);
					# EPILOG:
#}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void PopulateArray1223AuxE(int a2[], int* used2Ptr, int target)
#{
###############################################################################
PopulateArray1223AuxE:
#################
# Register usage:
#################
# $s0: hopPtr21
# $t1: hopPtr2
# $t9: endPtr2
# $v1: holder for a value/address
###############################################################################
					####################(30)####################					
#                   int *hopPtr2,
#                       *hopPtr21,
#                       *endPtr2;
					# PROLOG:
					
					# BODY:
#                   hopPtr2 = a2;
#                   endPtr2 = a2 + *used2Ptr;
#                   goto WTest1_PA1223AE;
begW1_PA1223AE:
#                      if (*hopPtr2 < target) goto else_PA1223AE;
begI_PA1223AE:
#                         hopPtr21 = endPtr2;
#                         goto WTest2_PA1223AE;
begW2_PA1223AE:
#                            *hopPtr21 = *(hopPtr21 - 1);
#                            --hopPtr21;
WTest2_PA1223AE:
#                         if (hopPtr21 > hopPtr2) goto begW2_PA1223AE;
					
#                         goto brkW1_PA1223AE;
else_PA1223AE:
#                         ++hopPtr2;
endI_PA1223AE:
WTest1_PA1223AE:
#                   if (hopPtr2 < endPtr2) goto begW1_PA1223AE;
brkW1_PA1223AE:
#                   *hopPtr2 = target;
#                   ++(*used2Ptr);
					# EPILOG:
#}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void ProcArrays(int mean, int a1[], int a2[], int a3[], int used1, int* used2Ptr, int* used3Ptr)
#{
###############################################################################
ProcArrays:
#################
# Register usage:
#################
# $v1: holder for a value/address
# (usual ones for function call)
###############################################################################
					# PROLOG:
					addiu $sp, $sp, -40
					sw $ra, 36($sp)
					sw $fp, 32($sp)
					addiu $fp, $sp, 40
					
					####################(4)####################					
					
					# BODY:
#                   MergeCopy2321(used2Ptr, a1, a2, a3, used3Ptr);
					####################(3)####################					
					jal MergeCopy2321
#                   LtMeanGtMeanCopy1223(mean, a1, a2, a3, used1, used2Ptr, used3Ptr);
					####################(10)####################					
					jal LtMeanGtMeanCopy1223
					# EPILOG:
					lw $fp, 32($sp)				
					lw $ra, 36($sp)
					addiu $sp, $sp, 40  
#}
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
					jr $ra

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void MergeCopy2321(int* used2Ptr, int a1[], int a2[], int a3[], int* used3Ptr)
#                        $a0           $a1       $a2       $a3        16($sp)
#{
###############################################################################
MergeCopy2321:
#################
# Register usage:
#################
# $t0: holder for a value/address
# $t1: hopPtr1
# $t2: hopPtr2
# $t3: hopPtr3
# $t8: endPtr2
# $t9: endPtr3
# $v1: another holder for a value/address
###############################################################################
					####################(35)####################					
#                   int *hopPtr1,
#                       *hopPtr2,
#                       *hopPtr3,
#                       *endPtr2,
#                       *endPtr3;
					# PROLOG:
					 						# no stack frame needed
					# BODY:
#                   hopPtr1 = a1;
#                   hopPtr2 = a2;
#                   hopPtr3 = a3;
#                   endPtr2 = a2 + *used2Ptr;
#                   endPtr3 = a3 + *used3Ptr;
#                   goto WTest1_MC2321;
begW1_MC2321:
#                      if (*hopPtr2 >= *hopPtr3) goto else_MC2321;
begI_MC2321:
#                         *hopPtr1 = *hopPtr2;
#                         ++hopPtr2;
#                      goto endI_MC2321;
else_MC2321:
#                         *hopPtr1 = *hopPtr3;
#                         ++hopPtr3;
endI_MC2321:
#                      ++hopPtr1;
WTest1_MC2321:
#                   if (hopPtr2 >= endPtr2) goto xitW1_MC2321;
#                   if (hopPtr3 < endPtr3) goto begW1_MC2321;
xitW1_MC2321:

#                   goto WTest2_MC2321;
begW2_MC2321:
#                      *hopPtr1 = *hopPtr2;
#                      ++hopPtr2;
#                      ++hopPtr1;
WTest2_MC2321:
#                   if (hopPtr2 < endPtr2) goto begW2_MC2321;

#                   goto WTest3_MC2321;
begW3_MC2321:
#                      *hopPtr1 = *hopPtr3;
#                      ++hopPtr3;
#                      ++hopPtr1;
WTest3_MC2321:
#                   if (hopPtr3 < endPtr3) goto begW3_MC2321;
#}


#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void LtMeanGtMeanCopy1223(int mean, int a1[], int a2[], int a3[], 
#                          int used1, int* used2Ptr, int* used3Ptr)
#{
###############################################################################
LtMeanGtMeanCopy1223:
#################
# Register usage:
#################
# $t0: holder for a value/address
# $t1: hopPtr1
# $t2: hopPtr2
# $t3: hopPtr3
# $t5: target
# $t9: endPtr1
# $v1: holder for a value/address
###############################################################################
					####################(30)####################					
#                   int *hopPtr1,
#                       *hopPtr2,
#                       *hopPtr3,
#                       *endPtr1;
#                   int target;
					# PROLOG:
					 						# no stack frame needed
					# BODY:
#                   hopPtr2 = a2;
#                   hopPtr3 = a3;
#                   *used2Ptr = 0;
#                   *used3Ptr = 0;
#                   hopPtr1 = a1;
#                   endPtr1 = a1 + used1;
#                   goto FTest_LMGMC1223;
begF_LMGMC1223:
#                      target = *hopPtr1;
#                      if (target >= mean) goto else1_LMGMC1223;
begI1_LMGMC1223:
#                         *hopPtr2 = target;
#                         ++(*used2Ptr);
#                         ++hopPtr2;
#                      goto endI1_LMGMC1223;
else1_LMGMC1223:
#                         if (target <= mean) goto endI2_LMGMC1223;
begI2_LMGMC1223:
#                            *hopPtr3 = target;
#                            ++(*used3Ptr);
#                            ++hopPtr3;
endI2_LMGMC1223:
endI1_LMGMC1223:
#                      ++hopPtr1;
FTest_LMGMC1223:
#                   if (hopPtr1 < endPtr1) goto begF_LMGMC1223;
#}

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void CoutCstr(const char cstr[])
#{
###############################################################################
CoutCstr:
#################
# Register usage:
#################
# (usual ones for syscall)
###############################################################################
					# PROLOG:
					 						# no stack frame needed
#   cout << cstr;
					li $v0, 4
					syscall
#}
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
					jr $ra

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void CoutCstrNL(const char cstr[])
#{
###############################################################################
CoutCstrNL:
#################
# Register usage:
#################
# (usual ones for syscall & function call)
###############################################################################
					# PROLOG:
					addiu $sp, $sp, -32
					sw $ra, 28($sp)
					sw $fp, 24($sp)
					addiu $fp, $sp, 32

					# BODY:
#   CoutCstr(cstr);
					jal CoutCstr
#   cout << '\n';
					li $a0, '\n'
					li $v0, 11
					syscall
					
					# EPILOG:
					lw $fp, 24($sp)
					lw $ra, 28($sp)
					addiu $sp, $sp, 32
#}
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
					jr $ra

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void CoutOneInt(int oneInt)
#{
###############################################################################
CoutOneInt:
#################
# Register usage:
#################
# (usual ones for syscall)
###############################################################################
					# PROLOG:
					 						# no stack frame needed
					# BODY:
#   cout << oneInt;
					li $v0, 1
					syscall
					# EPILOG:
#}
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
					jr $ra

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void ShowArray(const int array[], int used)
#{
###############################################################################
ShowArray:
#################
# Register usage:
#################
# $t1: i
# $v1: holder for a value/address
# $a1: used (as received)
# (usual ones for syscall)
###############################################################################
#                   int i;
					# PROLOG:
					 						# no stack frame needed
					sw $a0, 0($sp)					# array as received saved in caller's frame
					# BODY:
#                   i = 0;
					li $t1, 0					# $t1 is i
#                   goto FTest_SA;
					j FTest_SA
begF_SA:
#                      cout << array[i] << ' ' << ' ';
					li $v0, 1
					sll $v1, $t1, 2					# $v1 has i*4
					lw $a0, 0($sp)					# array as received re-loaded into $a0
					add $a0, $a0, $v1				# $a0 has &array[i]
					lw $a0, 0($a0)					# $a0 has array[i]
					syscall
					li $v0, 11
					li $a0, ' '
					syscall
					syscall
#                   ++i;
					addi $t1, $t1, 1
FTest_SA:
#                   if (i < used) goto begF_SA;
					blt $t1, $a1, begF_SA

#                   cout << endl;
					li $v0, 11
					li $a0, '\n'
					syscall
					# EPILOG:
#}
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
					jr $ra

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#void ShowArrayLabeled(const int array[], int used, const char label[])
#{
###############################################################################
ShowArrayLabeled:
#################
# Register usage:
#################
# (usual ones for function call)
###############################################################################
					# PROLOG:
					addiu $sp, $sp, -32
					sw $ra, 28($sp)
					sw $fp, 24($sp)
					addiu $fp, $sp, 32
					
					sw $a0, 0($fp)					# array as received saved in caller's frame
					sw $a1, 4($fp)					# used as received saved in caller's frame
					# BODY:
#                   CoutCstr(label);
					move $a0, $a2
					jal CoutCstr
#                   ShowArray(array, used);
					lw $a0, 0($fp)					# array as received re-loaded into $a0
					lw $a1, 4($fp)					# used as received re-loaded into $a1
											# CoutCstr might have clobbered $a0 & $a1
					jal ShowArray					
					# EPILOG:
					lw $fp, 24($sp)
					lw $ra, 28($sp)
					addiu $sp, $sp, 32  
#}
#########################################
# deliberate clobbering of caller-saved
# (meant to catch improper presumptions -
# no effect if no such presumptions made)
#########################################
			li $a0, 999999999
			li $a1, 999999999
			li $a2, 999999999
			li $a3, 999999999
			li $t0, 999999999
			li $t1, 999999999
			li $t2, 999999999
			li $t3, 999999999
			li $t4, 999999999
			li $t5, 999999999
			li $t6, 999999999
			li $t7, 999999999
			li $t8, 999999999
			li $t9, 999999999
			li $v0, 999999999
			li $v1, 999999999
#########################################
					jr $ra

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# main's string initialization code moved out of the way to reduce clutter
###############################################################################
begDataInitM:
					li $t0, 'b'
					sb $t0, 32($sp)
					li $t0, 'e'
					sb $t0, 33($sp)
					li $t0, 'g'
					sb $t0, 34($sp)
					li $t0, 'i'
					sb $t0, 35($sp)
					li $t0, 'n'
					sb $t0, 36($sp)
					li $t0, 'n'
					sb $t0, 37($sp)
					li $t0, 'i'
					sb $t0, 38($sp)
					li $t0, 'n'
					sb $t0, 39($sp)
					li $t0, 'g'
					sb $t0, 40($sp)
					li $t0, ' '
					sb $t0, 41($sp)
					li $t0, 'a'
					sb $t0, 42($sp)
					li $t0, '1'
					sb $t0, 43($sp)
					li $t0, ':'
					sb $t0, 44($sp)
					li $t0, ' '
					sb $t0, 45($sp)
					li $t0, '\0'
					sb $t0, 46($sp)
					li $t0, 'p'
					sb $t0, 47($sp)
					li $t0, 'r'
					sb $t0, 48($sp)
					li $t0, 'o'
					sb $t0, 49($sp)
					li $t0, 'c'
					sb $t0, 50($sp)
					li $t0, 'e'
					sb $t0, 51($sp)
					li $t0, 's'
					sb $t0, 52($sp)
					li $t0, 's'
					sb $t0, 53($sp)
					li $t0, 'e'
					sb $t0, 54($sp)
					li $t0, 'd'
					sb $t0, 55($sp)
					li $t0, ' '
					sb $t0, 56($sp)
					li $t0, 'a'
					sb $t0, 57($sp)
					li $t0, '1'
					sb $t0, 58($sp)
					li $t0, ':'
					sb $t0, 59($sp)
					li $t0, ' '
					sb $t0, 60($sp)
					li $t0, '\0'
					sb $t0, 61($sp)
					li $t0, ' '
					sb $t0, 62($sp)
					li $t0, ' '
					sb $t0, 63($sp)
					li $t0, ' '
					sb $t0, 64($sp)
					li $t0, ' '
					sb $t0, 65($sp)
					li $t0, ' '
					sb $t0, 66($sp)
					li $t0, ' '
					sb $t0, 67($sp)
					li $t0, ' '
					sb $t0, 68($sp)
					li $t0, ' '
					sb $t0, 69($sp)
					li $t0, ' '
					sb $t0, 70($sp)
					li $t0, ' '
					sb $t0, 71($sp)
					li $t0, 'a'
					sb $t0, 72($sp)
					li $t0, '2'
					sb $t0, 73($sp)
					li $t0, ':'
					sb $t0, 74($sp)
					li $t0, ' '
					sb $t0, 75($sp)
					li $t0, '\0'
					sb $t0, 76($sp)
					li $t0, ' '
					sb $t0, 77($sp)
					li $t0, ' '
					sb $t0, 78($sp)
					li $t0, ' '
					sb $t0, 79($sp)
					li $t0, ' '
					sb $t0, 80($sp)
					li $t0, ' '
					sb $t0, 81($sp)
					li $t0, ' '
					sb $t0, 82($sp)
					li $t0, ' '
					sb $t0, 83($sp)
					li $t0, ' '
					sb $t0, 84($sp)
					li $t0, ' '
					sb $t0, 85($sp)
					li $t0, ' '
					sb $t0, 86($sp)
					li $t0, 'a'
					sb $t0, 87($sp)
					li $t0, '3'
					sb $t0, 88($sp)
					li $t0, ':'
					sb $t0, 89($sp)
					li $t0, ' '
					sb $t0, 90($sp)
					li $t0, '\0'
					sb $t0, 91($sp)
					li $t0, 'D'
					sb $t0, 92($sp)
					li $t0, 'o'
					sb $t0, 93($sp)
					li $t0, ' '
					sb $t0, 94($sp)
					li $t0, 'a'
					sb $t0, 95($sp)
					li $t0, 'n'
					sb $t0, 96($sp)
					li $t0, 'o'
					sb $t0, 97($sp)
					li $t0, 't'
					sb $t0, 98($sp)
					li $t0, 'h'
					sb $t0, 99($sp)
					li $t0, 'e'
					sb $t0, 100($sp)
					li $t0, 'r'
					sb $t0, 101($sp)
					li $t0, ' '
					sb $t0, 102($sp)
					li $t0, 'c'
					sb $t0, 103($sp)
					li $t0, 'a'
					sb $t0, 104($sp)
					li $t0, 's'
					sb $t0, 105($sp)
					li $t0, 'e'
					sb $t0, 106($sp)
					li $t0, '?'
					sb $t0, 107($sp)
					li $t0, ' '
					sb $t0, 108($sp)
					li $t0, '('
					sb $t0, 109($sp)
					li $t0, 'n'
					sb $t0, 110($sp)
					li $t0, ' '
					sb $t0, 111($sp)
					li $t0, 'o'
					sb $t0, 112($sp)
					li $t0, 'r'
					sb $t0, 113($sp)
					li $t0, ' '
					sb $t0, 114($sp)
					li $t0, 'N'
					sb $t0, 115($sp)
					li $t0, ' '
					sb $t0, 116($sp)
					li $t0, '='
					sb $t0, 117($sp)
					li $t0, ' '
					sb $t0, 118($sp)
					li $t0, 'n'
					sb $t0, 119($sp)
					li $t0, 'o'
					sb $t0, 120($sp)
					li $t0, ','
					sb $t0, 121($sp)
					li $t0, ' '
					sb $t0, 122($sp)
					li $t0, 'o'
					sb $t0, 123($sp)
					li $t0, 't'
					sb $t0, 124($sp)
					li $t0, 'h'
					sb $t0, 125($sp)
					li $t0, 'e'
					sb $t0, 126($sp)
					li $t0, 'r'
					sb $t0, 127($sp)
					li $t0, 's'
					sb $t0, 128($sp)
					li $t0, ' '
					sb $t0, 129($sp)
					li $t0, '='
					sb $t0, 130($sp)
					li $t0, ' '
					sb $t0, 131($sp)
					li $t0, 'y'
					sb $t0, 132($sp)
					li $t0, 'e'
					sb $t0, 133($sp)
					li $t0, 's'
					sb $t0, 134($sp)
					li $t0, ')'
					sb $t0, 135($sp)
					li $t0, ' '
					sb $t0, 136($sp)
					li $t0, '\0'
					sb $t0, 137($sp)
					li $t0, '='
					sb $t0, 138($sp)
					li $t0, '='
					sb $t0, 139($sp)
					li $t0, '='
					sb $t0, 140($sp)
					li $t0, '='
					sb $t0, 141($sp)
					li $t0, '='
					sb $t0, 142($sp)
					li $t0, '='
					sb $t0, 143($sp)
					li $t0, '='
					sb $t0, 144($sp)
					li $t0, '='
					sb $t0, 145($sp)
					li $t0, '='
					sb $t0, 146($sp)
					li $t0, '='
					sb $t0, 147($sp)
					li $t0, '='
					sb $t0, 148($sp)
					li $t0, '='
					sb $t0, 149($sp)
					li $t0, '='
					sb $t0, 150($sp)
					li $t0, '='
					sb $t0, 151($sp)
					li $t0, '='
					sb $t0, 152($sp)
					li $t0, '='
					sb $t0, 153($sp)
					li $t0, '='
					sb $t0, 154($sp)
					li $t0, '='
					sb $t0, 155($sp)
					li $t0, '='
					sb $t0, 156($sp)
					li $t0, '='
					sb $t0, 157($sp)
					li $t0, '='
					sb $t0, 158($sp)
					li $t0, '='
					sb $t0, 159($sp)
					li $t0, '='
					sb $t0, 160($sp)
					li $t0, '='
					sb $t0, 161($sp)
					li $t0, '='
					sb $t0, 162($sp)
					li $t0, '='
					sb $t0, 163($sp)
					li $t0, '='
					sb $t0, 164($sp)
					li $t0, '='
					sb $t0, 165($sp)
					li $t0, '='
					sb $t0, 166($sp)
					li $t0, '='
					sb $t0, 167($sp)
					li $t0, '='
					sb $t0, 168($sp)
					li $t0, '='
					sb $t0, 169($sp)
					li $t0, '\0'
					sb $t0, 170($sp)
					li $t0, 'b'
					sb $t0, 171($sp)
					li $t0, 'y'
					sb $t0, 172($sp)
					li $t0, 'e'
					sb $t0, 173($sp)
					li $t0, '.'
					sb $t0, 174($sp)
					li $t0, '.'
					sb $t0, 175($sp)
					li $t0, '.'
					sb $t0, 176($sp)
					li $t0, '\0'
					sb $t0, 177($sp)
					j endDataInitM				# back to main

#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
#+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
# PopulateArray1's string initialization code moved out of the way to reduce clutter
###############################################################################
begDataInitPA1:
					li $t0, 'E'
					sb $t0, 16($sp)
					li $t0, 'n'
					sb $t0, 17($sp)
					li $t0, 't'
					sb $t0, 18($sp)
					li $t0, 'e'
					sb $t0, 19($sp)
					li $t0, 'r'
					sb $t0, 20($sp)
					li $t0, ' '
					sb $t0, 21($sp)
					li $t0, 'i'
					sb $t0, 22($sp)
					li $t0, 'n'
					sb $t0, 23($sp)
					li $t0, 't'
					sb $t0, 24($sp)
					li $t0, 'e'
					sb $t0, 25($sp)
					li $t0, 'g'
					sb $t0, 26($sp)
					li $t0, 'e'
					sb $t0, 27($sp)
					li $t0, 'r'
					sb $t0, 28($sp)
					li $t0, ' '
					sb $t0, 29($sp)
					li $t0, '#'
					sb $t0, 30($sp)
					li $t0, '\0'
					sb $t0, 31($sp)
					li $t0, 'M'
					sb $t0, 32($sp)
					li $t0, 'a'
					sb $t0, 33($sp)
					li $t0, 'x'
					sb $t0, 34($sp)
					li $t0, ' '
					sb $t0, 35($sp)
					li $t0, 'o'
					sb $t0, 36($sp)
					li $t0, 'f'
					sb $t0, 37($sp)
					li $t0, ' '
					sb $t0, 38($sp)
					li $t0, '\0'
					sb $t0, 39($sp)
					li $t0, 'E'
					sb $t0, 40($sp)
					li $t0, 'n'
					sb $t0, 41($sp)
					li $t0, 't'
					sb $t0, 42($sp)
					li $t0, 'e'
					sb $t0, 43($sp)
					li $t0, 'r'
					sb $t0, 44($sp)
					li $t0, ' '
					sb $t0, 45($sp)
					li $t0, 'm'
					sb $t0, 46($sp)
					li $t0, 'o'
					sb $t0, 47($sp)
					li $t0, 'r'
					sb $t0, 48($sp)
					li $t0, 'e'
					sb $t0, 49($sp)
					li $t0, ' '
					sb $t0, 50($sp)
					li $t0, 'i'
					sb $t0, 51($sp)
					li $t0, 'n'
					sb $t0, 52($sp)
					li $t0, 't'
					sb $t0, 53($sp)
					li $t0, 's'
					sb $t0, 54($sp)
					li $t0, '?'
					sb $t0, 55($sp)
					li $t0, ' '
					sb $t0, 56($sp)
					li $t0, '('
					sb $t0, 57($sp)
					li $t0, 'n'
					sb $t0, 58($sp)
					li $t0, ' '
					sb $t0, 59($sp)
					li $t0, 'o'
					sb $t0, 60($sp)
					li $t0, 'r'
					sb $t0, 61($sp)
					li $t0, ' '
					sb $t0, 62($sp)
					li $t0, 'N'
					sb $t0, 63($sp)
					li $t0, ' '
					sb $t0, 64($sp)
					li $t0, '='
					sb $t0, 65($sp)
					li $t0, ' '
					sb $t0, 66($sp)
					li $t0, 'n'
					sb $t0, 67($sp)
					li $t0, 'o'
					sb $t0, 68($sp)
					li $t0, ','
					sb $t0, 69($sp)
					li $t0, ' '
					sb $t0, 70($sp)
					li $t0, 'o'
					sb $t0, 71($sp)
					li $t0, 't'
					sb $t0, 72($sp)
					li $t0, 'h'
					sb $t0, 73($sp)
					li $t0, 'e'
					sb $t0, 74($sp)
					li $t0, 'r'
					sb $t0, 75($sp)
					li $t0, 's'
					sb $t0, 76($sp)
					li $t0, ' '
					sb $t0, 77($sp)
					li $t0, '='
					sb $t0, 78($sp)
					li $t0, ' '
					sb $t0, 79($sp)
					li $t0, 'y'
					sb $t0, 80($sp)
					li $t0, 'e'
					sb $t0, 81($sp)
					li $t0, 's'
					sb $t0, 82($sp)
					li $t0, ')'
					sb $t0, 83($sp)
					li $t0, ' '
					sb $t0, 84($sp)
					li $t0, '\0'
					sb $t0, 85($sp)
					li $t0, ' '
					sb $t0, 86($sp)
					li $t0, 'i'
					sb $t0, 87($sp)
					li $t0, 'n'
					sb $t0, 88($sp)
					li $t0, 't'
					sb $t0, 89($sp)
					li $t0, 's'
					sb $t0, 90($sp)
					li $t0, ' '
					sb $t0, 91($sp)
					li $t0, 'e'
					sb $t0, 92($sp)
					li $t0, 'n'
					sb $t0, 93($sp)
					li $t0, 't'
					sb $t0, 94($sp)
					li $t0, 'e'
					sb $t0, 95($sp)
					li $t0, 'r'
					sb $t0, 96($sp)
					li $t0, 'e'
					sb $t0, 97($sp)
					li $t0, 'd'
					sb $t0, 98($sp)
					li $t0, '.'
					sb $t0, 99($sp)
					li $t0, '.'
					sb $t0, 100($sp)
					li $t0, '.'
					sb $t0, 101($sp)
					li $t0, '\0'
					sb $t0, 102($sp)
					j endDataInitPA1				# back to PopulateArray1
