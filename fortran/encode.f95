program first
!Start of the Program
!By Daniel Cody

CHARACTER(LEN=20) :: testString="Hello World"
CHARACTER(LEN=0) dummyString

CALL upperCase(testString)

end program first

subroutine upperCase(x)
   CHARACTER(LEN=20) x
   CHARACTER(LEN=1) ch
   INTEGER charInt
   
   do i=1, 20, 1

	   ch = x(i:i+1)
	   charInt = iachar(ch)

	   IF (y > 90) THEN
		  charInt = y - 32
	   END IF

	   ch = achar(charInt)
   
		print *,ch
		
   end do

end subroutine

