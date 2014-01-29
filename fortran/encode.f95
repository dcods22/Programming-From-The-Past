program first
!Start of the Program
!By Daniel Cody

CHARACTER(LEN=40) :: testString="hal@"

!Convert to uppercase
CALL upperCase(testString)

!print encrypted string
CALL encrypt(testString,8)

!print decrypted string
CALL decrypt(testString, 8)

!show all cases of enctrypted string
CALL solve(testString, 26)

end program first

subroutine upperCase(x)
   !define variables
   CHARACTER(LEN=*) x
   CHARACTER(LEN=1) ch
   CHARACTER(LEN=40) :: dummyString="test"
   INTEGER charInt
   
   !loop through all letters
   do i=1, len(x), 1

		!get current letter
		ch = x(i:i+1)
		charInt = iachar(ch)

		!convert character
		IF (charInt > 90) THEN
		  charInt = charInt - 32
		END IF
		
		ch = achar(charInt)
		
		!reinsert letter
		x(i:i) = ch
   
   end do
			
end subroutine

subroutine encrypt(str, shiftAmount)
	!define variables
	CHARACTER(LEN=*) str
	CHARACTER(LEN=1) ch
	INTEGER charInt
	INTEGER shiftAmount
	
	!loop through letters
	do i=1, len(str), 1
	
		!get current letter
		ch = str(i:i+1)
		charInt = iachar(ch)
		
		!encrypt
		IF (charInt == 32) THEN
			newInt = charInt
		ELSE 
			newInt = charInt + shiftAmount
			
			IF (newInt > 90) THEN
				newInt = 64 + (newInt - 90)
			END IF
			
		END IF
	
		!reinsert letter
		ch = achar(newInt)
		str(i:i) = ch
	end do
	
	print *,str
end subroutine

subroutine decrypt(str, shiftAmount)
	!define variables
	CHARACTER(LEN=*) str
	CHARACTER(LEN=LEN(str)) printSTR
	CHARACTER(LEN=1) ch
	INTEGER charInt
	INTEGER shiftAmount
	
	!loop through letters
	do i=1, len(str), 1
		ch = str(i:i+1)
		charInt = iachar(ch)
		
		!decrypt
		IF (charInt == 32) THEN
			newInt = charInt
		ELSE 
			newInt = charInt - shiftAmount
			
			IF (newInt < 64) THEN
				newInt = 90 - (64 - newInt)
			END IF
		
		END IF
	
		!reinsert
		ch = achar(newInt)
		str(i:i) = ch
		
	end do
	
	print *,str
end subroutine

subroutine solve(str, maxShiftValue)
	!define variables
	CHARACTER(LEN=*) str
	CHARACTER(LEN=LEN(str)) printSTR
	CHARACTER(LEN=1) ch
	INTEGER charInt
	INTEGER maxShiftValue
	
	printSTR = str
	
	!double look for all cases
	do n=maxShiftValue, 0, -1
			
		!loop through letters
		do i=1, len(str), 1
			ch = str(i:i+1)
			charInt = iachar(ch)
			IF (charInt == 32) THEN
				newInt = charInt
			ELSE 
				newInt = charInt + n
			
				IF (newInt > 90) THEN
					newInt = 64 + (newInt - 90)
				END IF
			
			END IF
		
			ch = achar(newInt)
			
			!reinsert characters
			printSTR(i:i) = ch
		end do	
		print *,"Caesar ", n, ": ", printSTR
	end do
	
end subroutine
