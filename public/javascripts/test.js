$(document).ready(function(){
	
	$("#yahDudes").prepend('<div class="caption"></div>');
	var words = $(".caption").text("Future Var")
		.append('<img src="/images/removeWhite.jpg" alt="remove" height="40" style="" />');
		
	$("div.caption").hide();
	
	var i=document.getElementById("div.caption");
	
	$("#yahDudes").mouseover(function(){
		$("div.caption").show();
	}).mouseout(function(){
		$("div.caption").hide();
	})
	


});