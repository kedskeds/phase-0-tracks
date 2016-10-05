/*

longest : array -> string

-initialize a 'result' variable to store the longest word

-loop through the array
	- IF an array element is longer than the 'result'
		-set result equal to array element
-return result

*/

longest = function(arr){
	var result = "";

	for(var i = 0; i < arr.length; i++){
		if(arr[i].length > result.length){
			result = arr[i];
		}
	}

	return result;
}

//examples
console.log(longest(["long phrase","longest phrase","longer phrase"]));
console.log(longest(["short","tiny","gigantic"]));
