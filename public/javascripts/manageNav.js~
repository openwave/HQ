//SETTING UP OUR POPUP  
//0 means disabled; 1 means enabled;  
var popupStatus = 0;

//loading popup with jQuery magic!  
function loadPopup(val){ 
	//loads popup only if it is disabled   
	//alert(popupStatus);
	if(popupStatus==0){ 
	
	//alert("LoadPopup");
		jQuery(val).fadeIn("slow");  
		popupStatus = 1;  
	}  
}

//disabling popup with jQuery magic!  
function disablePopup(val){  
	//disables popup only if it is enabled  
	//alert(popupStatus);
	if(popupStatus==1){
		//alert("DispPopup");
		//alert(val.attr('id'));
		jQuery(val).fadeOut("slow");
		popupStatus = 0; 
	}  
}

//centering popup  
function centerPopup(val){
	//request data for centering  
	//alert(val);
	var windowWidth = document.documentElement.clientWidth;  
	var windowHeight = document.documentElement.clientHeight;  
	var popupHeight = jQuery(val).height();  
	var popupWidth = jQuery(val).width();  
	//centering  
	jQuery(val).css({  
		"position": "absolute"
	});  
	//only need force for IE6   
}

jQuery(document).ready(function(){  
	//LOADING POPUP  
	//Click the button event!  
	jQuery('img.manage_btn').click(
		function(){  			
			//centering with css  
			centerPopup(jQuery(this).parent().parent().children().get(2));  
			//load popup  
			loadPopup(jQuery(this).parent().parent().children().get(2));  
		}
	);
	
	//Click out event!  
	jQuery("img.moveLeft").click(
		function(){  						  
			disablePopup(jQuery(this).parent().parent());  
		}
	);
	jQuery("img.moveRight").click(
		function(){  
			disablePopup(jQuery(this).parent().parent());  
		}
	);
	jQuery("img.deleteTab").click(
		function(){  
			disablePopup(jQuery(this).parent().parent());  
		}
	);
});
