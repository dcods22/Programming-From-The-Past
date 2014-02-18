object encode {
	def main(args: Array[String]) {
		//variables
		var Estr : String = "THIS IS A TEST STRING FROM1122@";
		var Dstr : String = "BPQA QA I BMAB ABZQVO NZWU1122@";
		var Sstr : String = "hal@";
		
		//making sure the strings are upper case
		Estr = Estr.map(_.toUpper);
		Dstr = Dstr.map(_.toUpper);
		Sstr = Sstr.map(_.toUpper);
		
		//main 
		println(encode(Estr, 8));
		println(decode(Dstr, 8));
		solve(Sstr, 26);
	}
	
	//method to encode a string by a move amount
	def encode(str: String, moveAmt: Int) : String = {
		//variables for the new string, a count, the char, and charInt
		var newStr : String = "";
		var i : Int = 0;
		var charInt : Int = 0;
		var char : Char = 'a'; 
		//loop through the string
		for( i <- 0 to str.size - 1){
			//get the current char to an int
			char = str.charAt(i);
			charInt = char.toInt;
			//encoding the char
			if( charInt != 32 && charInt > 56 ){
				if( charInt > 64 ){
					charInt = charInt + moveAmt;
				}
				if( charInt > 90) {
					charInt = 64 + (charInt - 90);
				}
			}
			//returning it and concating it to a string
			char = charInt.toChar;
			newStr = newStr + char;
		}	
	
		return newStr;
	}

	//method to decode a string by a move amount
	def decode(str: String, moveAmt: Int) : String = {
		//variables for new string, loop, char, and char to int
		var newStr : String = "";
		var i : Int = 0;
		var charInt : Int = 0;
		var char : Char = 'a'; 
		//loop through the string
		for( i <- 0 to str.size - 1){
			//getting the current char and making it an ascii int
			char = str.charAt(i);
			charInt = char.toInt;
			//decoding the current char
			if( charInt != 32 && charInt > 56){
				if( charInt > 64 ){
					charInt = charInt - moveAmt;
				}
				if( charInt < 64 ) {
					charInt = 90 - (64 -charInt);
				}	
			}
			//replacing it and filling out the new string
			char = charInt.toChar;
			newStr = newStr + char;
		}	
	
		return newStr;
	}

	//method to show decyption cases
	def solve(str: String, solves: Int) : String = {
		//variables for the loop, the second loop, the new string, the char, and char int
		var newStr : String = "";
		var i : Int = 0;
		var n : Int = 0;
		var charInt : Int = 0;
		var char : Char = 'a'; 

		//loop for the amount of solves
		for( n <- 0 to solves ){
			newStr = "";
			//loop for the string
			for( i <- 0 to str.size - 1){
				//converting current char to integer
				char = str.charAt(i);
				charInt = char.toInt;
				if( charInt != 32){
					if( charInt > 64 ){
						charInt = charInt + n;
					}
					if( charInt > 90) {
						charInt = 64 + (charInt - 90);
					}
				}
				//converting back to char and adding to string
				char = charInt.toChar;
				newStr = newStr + char;
			}
			//printing out the current string
			println("Ceaser " + n + ": " + newStr);
		}
		//returning the new string
		return newStr;
	}
}
