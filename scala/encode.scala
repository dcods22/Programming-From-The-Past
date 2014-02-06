object encode {
	var str : String = "this is a test string";
	def main(args: Array[String]) {
		var i = 0;
		str = str.map(_.toUpper);
		for( i <- 0 to 10 ){
			println(str.substring(i,i+1));	
		}	
	}
}
