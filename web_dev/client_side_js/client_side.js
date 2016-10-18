var ptags = document.getElementsByTagName("p");
ptag = ptags[0];

//add a border to the first paragraph element
ptag.style.border = "5px Solid Black";

//add mouseover/mouseleave event listeners to paragraph
ptag.addEventListener("mouseover",function(){
	event.target.style.border = "5px solid blue";
});
ptag.addEventListener("mouseleave",function(){
	event.target.style.border = "5px solid black";
});

//create button and text elements
var btnReveal = document.createElement("button");
var btnText = document.createTextNode("Reveal Dolphin!");
//append the text to the button
btnReveal.appendChild(btnText);

//append button to body
document.body.appendChild(btnReveal);

//reveal : sets an image's visibility property to "visible"
function reveal(img){
	img.style.visibility = "visible";
}

//when user clicks the button, reveal the image
btnReveal.onclick = function(){
	var img = document.getElementsByTagName("img")[0];
	reveal(img);
};


var btnHide = document.getElementById("btnHide");

//hide : sets an image's visiblity property to "hidden"
function hide(){
	var img = document.getElementsByTagName("img")[0];
	img.style.visibility="hidden";
}

//add event listener
//when user clicks the button, hide the image
btnHide.addEventListener("click",hide);

