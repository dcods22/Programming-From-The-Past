object encode {
	def main(args: Array[String]) {
		var str : String = "this is a test string";
		var newStr : String = "";
		var Estr : String = null;
		var Dstr : String = null;
		var i : Int = 0;
		var moveAmt : Int = 1;
		var charInt : Int = 0;
		var char : Char = 'a'; 
		str = str.map(_.toUpper);
		for( i <- 0 to str.size - 1){
			char = str.charAt(i);
			charInt = char.toInt;
			if( charInt > 64 ){
				charInt = charInt + moveAmt;
			}
			if( charInt > 90) {
				charInt = 64 + (charInt - 90);
			}
			char = charInt.toChar;
			newStr = newStr + char;
		}	
		print(newStr);
	}
}
