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
//console.log(longest(["long phrase","longest phrase","longer phrase"]));
//console.log(longest(["short","tiny","gigantic"]));

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
//console.log(share_a_pair({name: "Steven", age: 54},{name: "Tamir", age: 54}));
//console.log(share_a_pair({type: "car", make: "Honda"}, {type: "bicycle", brand: "Schwinn"}));

/*

random_words : int -> array of strings

-for the given integer,
	-initialize word_length (random # between 1 - 10)

	-for the given word_length,
		-generate a random letter of the alphabet
		-add random letter to a given string
	-push string to an array
-return array

*/

random_words = function(int){
	var alphabet = "abcdefghijklmnopqrstuvwxyz";
	var len = alphabet.length;

	var result = [];
	for(var i = 0; i < int; i++){
		word_length = Math.floor((Math.random()*10)+1);
		str = "";
		for(var j = 0; j < word_length; j++){
			letter = Math.floor(Math.random()*len);
			str += alphabet[letter];
		}
		result.push(str);
	}
	return result;
}

//examples
//console.log(random_words(3));
//console.log(random_words(5));

for(var i = 0; i < 10; i++){
	index = i + 1;
	console.log("Result " + index.toString()+ ":")
	console.log("");

	arr = random_words(3);

	console.log(arr);
	console.log(longest(arr));
	console.log("---------------------------");
}