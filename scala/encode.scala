object encode {
	def main(args: Array[String]) {
		//variables
		var Estr : String = "THIS IS A TEST STRING FROM1122@";
		var Dstr : String = "BPQA QA I BMAB ABZQVO NZWU1122@";
		var Sstr : String = "hal@";
		
		Estr = Estr.map(_.toUpper);
		Dstr = Dstr.map(_.toUpper);
		Sstr = Sstr.map(_.toUpper);
		//main 
		println(encode(Estr, 8));
		println(decode(Dstr, 8));
		solve(Sstr, 26);
	}
	
	def encode(str: String, moveAmt: Int) : String = {
		var newStr : String = "";
		var i : Int = 0;
		var charInt : Int = 0;
		var char : Char = 'a'; 
		for( i <- 0 to str.size - 1){
			char = str.charAt(i);
			charInt = char.toInt;
			if( charInt != 32 && charInt > 56 ){
				if( charInt > 64 ){
					charInt = charInt + moveAmt;
				}
				if( charInt > 90) {
					charInt = 64 + (charInt - 90);
				}
			}

			char = charInt.toChar;
			newStr = newStr + char;
		}	
	
		return newStr;
	}

	def decode(str: String, moveAmt: Int) : String = {
		var newStr : String = "";
		var i : Int = 0;
		var charInt : Int = 0;
		var char : Char = 'a'; 
		for( i <- 0 to str.size - 1){
			char = str.charAt(i);
			charInt = char.toInt;
			if( charInt != 32 && charInt > 56){
				if( charInt > 64 ){
					charInt = charInt - moveAmt;
				}
				if( charInt < 64 ) {
					charInt = 90 - (64 -charInt);
				}	
			}
			char = charInt.toChar;
			newStr = newStr + char;
		}	
	
		return newStr;
	}

	def solve(str: String, solves: Int) : String = {
		var newStr : String = "";
		var i : Int = 0;
		var n : Int = 0;
		var charInt : Int = 0;
		var char : Char = 'a'; 

		for( n <- 0 to solves ){
			newStr = "";
			for( i <- 0 to str.size - 1){
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

				char = charInt.toChar;
				newStr = newStr + char;
			}
			println("Ceaser " + n + ": " + newStr);
		}

		return newStr;
	}
}
