var colors = ["blue","green","yellow","purple"];
var names = ["ed","bob","george","kevin"];

// adding values to the arrays
colors.push("orange");
names.push("margie");

// initializing an empty object
var horses = {}

// looping through the colors array and adding
// key-value pairs to the horses object
for(var i = 0; i < colors.length; i++){
	horses[names[i]] = colors[i];
}



// Cars constructor 
function Car(color, make, model){
	this.color = color;
	this.make = make;
	this.model = model;
	this.isDriving = false;
	this.drive = function(speed) {
		console.log ("The " + this.make + " is now driving at " + speed.toString() + " mph.");
		this.isDriving = true;
	};
	this.brake = function() {
		console.log("The " + this.make + " has stopped driving");
		this.isDriving = false;
	};

} 

//initializing instances of Car
var newCar = new Car("blue","BMW", "X5");
console.log(newCar.isDriving);
newCar.drive(50);
console.log(newCar.isDriving);

var newCar2 = new Car("red","Audi", "S4");
console.log(newCar2);
newCar2.drive(10);
newCar2.brake();

/*

This is one way to loop through key-value pairs in
an object:

for (var key in some_obj) {
  if (some_obj.hasOwnProperty(key)) {
    console.log(key + " -> " + some_obj[key]);
  }
}

an advantage to using constructor functions 
is that they can be used to create many objects
with the same properties.

*/