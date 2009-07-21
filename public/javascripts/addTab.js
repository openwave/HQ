


function addTab(eleId){
      
        if(eleId=="templateChoose")     {
            document.getElementById('templateChoose').innerHTML="";
            document.getElementById('templateChoose').style.display="block";
            document.getElementById('viewer').style.display="none";
            document.getElementById('templateChoose').appendChild(iFrame)
        }
        else {
            window.parent.document.getElementById('templateChoose').style.display="none";
            window.parent.document.getElementById('viewer').style.display="block";
        }
}

function chooseLabel(closeTab) {
	
	
    if(closeTab=="open") 
	{
		
          window.parent.document.getElementById('viewer').style.display="none";
          window.parent.document.getElementById('templateChoose').style.display="none";
          window.parent.document.getElementById('addNameBtn').style.display="block";
		  
      }
      else {
          window.parent.document.getElementById('viewer').style.display="block";
          window.parent.document.getElementById('templateChoose').style.display="none";
          window.parent.document.getElementById('addNameBtn').style.display="none";
      }
}
function addMenu() {
    
	
	/*
	var newText                                        =   document.createTextNode(document.getElementById('menuName').value);
    var newMenu                                        =   document.createElement('li');
    newMenu.id                                         =   document.getElementById('menuName').value;
    var newAnchorMenu                                  =   document.createElement('a');
    newAnchorMenu.href                                 =   '#';
	
    newAnchorMenu.appendChild(newText);
    newMenu.appendChild(newAnchorMenu);
    
    var DivMenuArrow					=	document.createElement('div');
   
    DivMenuArrow.className				=	'blueArrow';

    var DivMenuArrowImage				=	document.createElement('img');
    DivMenuArrowImage.className                         =	'manage_btn';
    DivMenuArrowImage.width				=	'25';
    DivMenuArrowImage.style.cursor                      =	'pointer'
    DivMenuArrowImage.src				=	'/images/blueArrow.jpg';
    DivMenuArrowImage.alt				=	'Options';

    DivMenuArrow.appendChild(DivMenuArrowImage);


    var DivMenuPosistions				=	document.createElement('div');
    DivMenuPosistions.className                         =	'manageNav';
    DivMenuPosistions.style.position                    =	'absolute';
    DivMenuPosistions.style.display			=	'none';

    var InDivMenuPosistions				=	document.createElement('div');
    InDivMenuPosistions.className			=	'grid_2';

    var InDivMenuLeftArrowImage				=	document.createElement('img');
    InDivMenuLeftArrowImage.className                   =	'moveLeft';
    InDivMenuLeftArrowImage.width			=	'25';
    InDivMenuLeftArrowImage.src				=	'/images/leftArrow.jpg';

    var InDivMenuRightArrowImage			=	document.createElement('img');
    InDivMenuRightArrowImage.className                  =	'moveRight';
    InDivMenuRightArrowImage.width			=	'25';
    InDivMenuRightArrowImage.src			=	'/images/rightArrow.jpg';

    var InDivMenuDeleteTabImage				=	document.createElement('img');
    InDivMenuDeleteTabImage.className                   =	'deleteTab';
    InDivMenuDeleteTabImage.width			=	'25';
    InDivMenuDeleteTabImage.src				=	'/images/removeBtnBlue.jpg';

    var InDivBrake					=	document.createElement('br');
    var InDivText         				=   document.createTextNode('move  delete');


    InDivMenuPosistions.appendChild(InDivMenuLeftArrowImage);
    InDivMenuPosistions.appendChild(InDivMenuRightArrowImage);
    InDivMenuPosistions.appendChild(InDivMenuDeleteTabImage);
    InDivMenuPosistions.appendChild(InDivBrake);
    InDivMenuPosistions.appendChild(InDivText);

    DivMenuPosistions.appendChild(InDivMenuPosistions);


    newMenu.appendChild(DivMenuArrow);
    newMenu.appendChild(DivMenuPosistions);

    var parentDiv = document.getElementById('Examp').parentNode;
    parentDiv.insertBefore(newMenu,document.getElementById('Examp'));
	
	*/
	
	jQuery('img.manage_btn').click(
		function(){ // manage_btn
                     
                     
                    // var curChildIndex = $(this).parent().prevAll().length + 1;

                     
             // alert("manage_btn");	   
			//centering with css  
			centerPopup(jQuery(this).parent().parent().children().get(2));  
			//load popup  
			loadPopup(jQuery(this).parent().parent().children().get(2)); 
			 // alert("skashdjkas d asd");
			 RepeatFunction();	
		}
	);
         
         
         //Click out event!  
	jQuery("img.moveLeft").click(
		function(){  
                     
                        var curChildIndex = jQuery(this).parent().parent().parent().prevAll().length + 1;
                     
                        var oPrevTab        =    jQuery(this).parent().parent().parent().prev();
                        var oNextTab        =    jQuery(this).parent().parent().parent().next();
                        var oCurrentTab     =    jQuery(this).parent().parent().parent();
						
						var CurrentTabId   	=    jQuery(this).parent().parent().parent().attr('id');
						var NextTabId   	=    jQuery(this).parent().parent().parent().next().attr('id');
						var PrevTabId   	=    jQuery(this).parent().parent().parent().prev().attr('id');  
                    
					
					
					
						var CurrentTabHtml;
                        CurrentTabHtml     = 	jQuery(this).parent().parent().parent().html();
						CurrentTabHtml	   =	CurrentTabHtml.replace(/block/, "none");
						
						var PreviousTabHtml;
                        PreviousTabHtml     = jQuery(this).parent().parent().parent().prev().html();
						
						var NextTabHtml;
                        NextTabHtml    = jQuery(this).parent().parent().parent().next().html();
					  if (PrevTabId != 'userReviews') {
					  
					  	jQuery(this).parent().parent().parent().prev().html(CurrentTabHtml);
					  	jQuery(this).parent().parent().parent().prev().attr('id', CurrentTabId);
					  	jQuery(this).parent().parent().parent().attr('id', PrevTabId);
					  	jQuery(this).parent().parent().parent().html(PreviousTabHtml);
					  	popupStatus = 0;
					  	RepeatFunction();
					  }
					  else {
					 		jQuery(this).parent().parent().parent().html(CurrentTabHtml);
							popupStatus = 0;
							RepeatFunction();
							
						}
					 
	
	
	//RepeatFunction();
	
	
	}
	
	);
	jQuery("img.moveRight").click(
		function(){  
			
						var oPrevTab        =    jQuery(this).parent().parent().parent().prev();
						var oNextTab        =    jQuery(this).parent().parent().parent().next();
						var oCurrentTab     =    jQuery(this).parent().parent().parent();
						var CurrentTabId   	=    jQuery(this).parent().parent().parent().attr('id');
						var NextTabId   	=    jQuery(this).parent().parent().parent().next().attr('id');
						var PrevTabId   	=    jQuery(this).parent().parent().parent().prev().attr('id');  
						
						var CurrentTabHtml;
						CurrentTabHtml     	= 	jQuery(this).parent().parent().parent().html();
						CurrentTabHtml	    =	CurrentTabHtml.replace(/block/, "none");
						
						
						var PreviousTabHtml;
						PreviousTabHtml     = jQuery(this).parent().parent().parent().prev().html();
						
						
						
						var NextTabHtml;
						NextTabHtml     = jQuery(this).parent().parent().parent().next().html();
						
						if (NextTabId != 'Examp') {
							jQuery(this).parent().parent().parent().next().attr('id', CurrentTabId);
							jQuery(this).parent().parent().parent().next().html(CurrentTabHtml);
							
							jQuery(this).parent().parent().parent().attr('id', NextTabId);
							jQuery(this).parent().parent().parent().html(NextTabHtml);
							
							jQuery(this).parent().parent().next().css('display:none');
							popupStatus = 0;
							RepeatFunction();
						}
						else {
							jQuery(this).parent().parent().parent().html(CurrentTabHtml);
							popupStatus = 0;
							RepeatFunction();
						}
						
					  
						
						
						

	
		}
		
		
	);
	jQuery("img.deleteTab").click(
		function(){  
                     
                       // alert(jQuery(this).parent().parent().parent().next());
					   jQuery(this).parent().parent().parent().remove();
					    popupStatus=0;
					   RepeatFunction();
					//disablePopup(jQuery(this).parent().parent().parent());   
			
		}
	);

}



	jQuery('img.manage_btn').click(
		function(){ // manage_btn
                     
                     
                    // var curChildIndex = $(this).parent().prevAll().length + 1;

                     
             // alert("manage_btn");	   
			//centering with css  
			centerPopup(jQuery(this).parent().parent().children().get(2));  
			//load popup  
			loadPopup(jQuery(this).parent().parent().children().get(2)); 
			 // alert("skashdjkas d asd");
			 RepeatFunction();	
		}
	);
         
         
         //Click out event!  
	jQuery("img.moveLeft").click(
		function(){  
                     
                        var curChildIndex = jQuery(this).parent().parent().parent().prevAll().length + 1;
                     
                        var oPrevTab        =    jQuery(this).parent().parent().parent().prev();
                        var oNextTab        =    jQuery(this).parent().parent().parent().next();
                        var oCurrentTab     =    jQuery(this).parent().parent().parent();
						
						var CurrentTabId   	=    jQuery(this).parent().parent().parent().attr('id');
						var NextTabId   	=    jQuery(this).parent().parent().parent().next().attr('id');
						var PrevTabId   	=    jQuery(this).parent().parent().parent().prev().attr('id');  
                    
					
					
					
						var CurrentTabHtml;
                        CurrentTabHtml     = 	jQuery(this).parent().parent().parent().html();
						CurrentTabHtml	   =	CurrentTabHtml.replace(/block/, "none");
						
						var PreviousTabHtml;
                        PreviousTabHtml     = jQuery(this).parent().parent().parent().prev().html();
						
						var NextTabHtml;
                        NextTabHtml    = jQuery(this).parent().parent().parent().next().html();
					  if (PrevTabId != 'userReviews') {
					  
					  	jQuery(this).parent().parent().parent().prev().html(CurrentTabHtml);
					  	jQuery(this).parent().parent().parent().prev().attr('id', CurrentTabId);
					  	jQuery(this).parent().parent().parent().attr('id', PrevTabId);
					  	jQuery(this).parent().parent().parent().html(PreviousTabHtml);
					  	popupStatus = 0;
					  	RepeatFunction();
					  }
					  else {
					 		jQuery(this).parent().parent().parent().html(CurrentTabHtml);
							popupStatus = 0;
							RepeatFunction();
							
						}
					 
	
	
	//RepeatFunction();
	
	
	}
	
	);
	jQuery("img.moveRight").click(
		function(){  
			
						var oPrevTab        =    jQuery(this).parent().parent().parent().prev();
						var oNextTab        =    jQuery(this).parent().parent().parent().next();
						var oCurrentTab     =    jQuery(this).parent().parent().parent();
						var CurrentTabId   	=    jQuery(this).parent().parent().parent().attr('id');
						var NextTabId   	=    jQuery(this).parent().parent().parent().next().attr('id');
						var PrevTabId   	=    jQuery(this).parent().parent().parent().prev().attr('id');  
						
						var CurrentTabHtml;
						CurrentTabHtml     	= 	jQuery(this).parent().parent().parent().html();
						CurrentTabHtml	    =	CurrentTabHtml.replace(/block/, "none");
						
						
						var PreviousTabHtml;
						PreviousTabHtml     = jQuery(this).parent().parent().parent().prev().html();
						
						
						
						var NextTabHtml;
						NextTabHtml     = jQuery(this).parent().parent().parent().next().html();
						
						if (NextTabId != 'Examp') {
							jQuery(this).parent().parent().parent().next().attr('id', CurrentTabId);
							jQuery(this).parent().parent().parent().next().html(CurrentTabHtml);
							
							jQuery(this).parent().parent().parent().attr('id', NextTabId);
							jQuery(this).parent().parent().parent().html(NextTabHtml);
							
							jQuery(this).parent().parent().next().css('display:none');
							popupStatus = 0;
							RepeatFunction();
						}
						else {
							jQuery(this).parent().parent().parent().html(CurrentTabHtml);
							popupStatus = 0;
							RepeatFunction();
						}
						
					  
						
						
						

	
		}
		
		
	);
	jQuery("img.deleteTab").click(
		function(){  
                     
                       // alert(jQuery(this).parent().parent().parent().next());
					   jQuery(this).parent().parent().parent().remove();
					    popupStatus=0;
					   RepeatFunction();
					//disablePopup(jQuery(this).parent().parent().parent());   
			
		}
	);


function RepeatFunction(){
	//Click the button event!  
	jQuery('img.manage_btn').click(function(){
	
	
		//centering with css  
		centerPopup(jQuery(this).parent().parent().children().get(2));
		//load popup  
		loadPopup(jQuery(this).parent().parent().children().get(2));
	});
	
	//Click out event!  
	jQuery("img.moveLeft").click(function(){
		//disablePopup(jQuery(this).parent().parent());  
		var curChildIndex = jQuery(this).parent().parent().parent().prevAll().length + 1;
		
		var oPrevTab = jQuery(this).parent().parent().parent().prev();
		var oNextTab = jQuery(this).parent().parent().parent().next();
		var oCurrentTab = jQuery(this).parent().parent().parent();
		
		var CurrentTabId = jQuery(this).parent().parent().parent().attr('id');
		var NextTabId = jQuery(this).parent().parent().parent().next().attr('id');
		var PrevTabId = jQuery(this).parent().parent().parent().prev().attr('id');
		
		
		
		
		var CurrentTabHtml;
		CurrentTabHtml = jQuery(this).parent().parent().parent().html();
		CurrentTabHtml = CurrentTabHtml.replace(/block/, "none");
		
		var PreviousTabHtml;
		PreviousTabHtml = jQuery(this).parent().parent().parent().prev().html();
		
		var NextTabHtml;
		NextTabHtml = jQuery(this).parent().parent().parent().next().html();
		if (PrevTabId != 'userReviews') {
		
			jQuery(this).parent().parent().parent().prev().html(CurrentTabHtml);
			jQuery(this).parent().parent().parent().prev().attr('id', CurrentTabId);
			jQuery(this).parent().parent().parent().attr('id', PrevTabId);
			jQuery(this).parent().parent().parent().html(PreviousTabHtml);
			
			popupStatus = 0;
			RepeatFunction();
		}
		else {
			jQuery(this).parent().parent().parent().html(CurrentTabHtml);
			popupStatus = 0;
			RepeatFunction();
		}
	});
	jQuery("img.moveRight").click(function(){
		//disablePopup(jQuery(this).parent().parent());  
		var oPrevTab = jQuery(this).parent().parent().parent().prev();
		var oNextTab = jQuery(this).parent().parent().parent().next();
		var oCurrentTab = jQuery(this).parent().parent().parent();
		var CurrentTabId = jQuery(this).parent().parent().parent().attr('id');
		var NextTabId = jQuery(this).parent().parent().parent().next().attr('id');
		var PrevTabId = jQuery(this).parent().parent().parent().prev().attr('id');
		
		var CurrentTabHtml;
		CurrentTabHtml = jQuery(this).parent().parent().parent().html();
		CurrentTabHtml = CurrentTabHtml.replace(/block/, "none");
		
		
		var PreviousTabHtml;
		PreviousTabHtml = jQuery(this).parent().parent().parent().prev().html();
		
		
		
		var NextTabHtml;
		
		NextTabHtml = jQuery(this).parent().parent().parent().next().html();
		
		if (NextTabId != 'Examp') {
			jQuery(this).parent().parent().parent().next().attr('id', CurrentTabId);
			jQuery(this).parent().parent().parent().next().html(CurrentTabHtml);
			
			jQuery(this).parent().parent().parent().attr('id', NextTabId);
			jQuery(this).parent().parent().parent().html(NextTabHtml);
			
			
			jQuery(this).parent().parent().next().css('display:none');
			popupStatus = 0;
			RepeatFunction();
		}
		else {
			jQuery(this).parent().parent().parent().html(CurrentTabHtml);
			popupStatus = 0;
			RepeatFunction();
		}
		
	});
	jQuery("img.deleteTab").click(function(){
		//disablePopup(jQuery(this).parent().parent()); 
		
		jQuery(this).parent().parent().parent().remove();
		popupStatus = 0;
		RepeatFunction();
	});
	
	
	//alert(jQuery("ul #nav").html());
}