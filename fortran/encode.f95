program first
!comments

CHARACTER(LEN=20) :: testString="hello world"

INTEGER y

CHARACTER(LEN = 1) c

do n=1, 20, 1

c = testString(n:n+1)
y = iachar(c)
y = y - 32
c = achar(y)

print *,c

end do



end program first

subroutine upperCase(x)
   CHARACTER(LEN = *) x
   INTEGER charValue 
   
   
   do n=1, 20, 1

	!charValue = iachar(letter)
   
   end do

end subroutine

