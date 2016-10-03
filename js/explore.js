/* 

reverse : str -> str 

initialize a new empty string

iterate over the given string 
	-FOR each letter in the string,
		-add it to the end of the new string

-return the new string


example:
reverse("hello") -> "olleh"

*/

function reverse(str){
	result = "";

	for(var i = 0; i < str.length; i++){
		result = str[i] + result;
	}
	return result;
}

//test 
console.log(reverse("hello") + " should equal 'olleh'");

var myName = reverse("kelsey");

if(true){
	console.log("This conditional should print " + myName);
}