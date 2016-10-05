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

/*

share_a_pair : obj obj -> boolean

-iterate through the first object's keys
	-IF a key from the 1st obj is contained in the 2nd obj,
		-IF the 1st key value = 2nd key value
			-return true

*/

share_a_pair = function(obj1, obj2){
	keys = Object.keys(obj1);
	result = false;

	for(var i = 0; i < keys.length; i++){
		if(obj2.hasOwnProperty(keys[i])){
			if(obj1[keys[i]] === obj2[keys[i]]){
			 	result = true;
			}
		}
	}
	return result;
}

//examples
console.log(share_a_pair({name: "Steven", age: 54},{name: "Tamir", age: 54}));
