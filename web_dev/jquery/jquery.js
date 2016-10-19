

function addEventListeners(){
	$("#changeColor").click(changeColor);
	$("#animate").click(animate);
	$("#createBox").click(createBox);
	$("#removeBox").click(removeBox);
}

function changeColor(){
	var colors = ["coral","teal","gold","thistle","slateblue","darkseagreen","steelblue"];
	var color_idx = Math.floor(Math.random() * (colors.length+ 1));

	var boxes = $(".box");
	$.each(boxes,function(index,box){
		$(box).css({
			backgroundColor: colors[color_idx]
		});
		$("h1").css("color",colors[color_idx]);
	});
}

function animate(){
	var boxes = $(".box");
	$.each(boxes,function(index,box){
		$(box).slideUp(800);
		$(box).slideDown(800);
	});
}

function createBox(){
	$(".box:last").after($("<div class = 'box'></div>"));
}

function removeBox(){
	if($(".box").length>1){
		$(".box:last").remove();
	}
}

$(document).ready(function(){
	addEventListeners();
});
