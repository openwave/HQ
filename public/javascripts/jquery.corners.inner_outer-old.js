// test auto-ready logic - call corner before DOM is ready


$(function(){
	/* Light Green */
    $('div.inner').wrap('<div class="outer"></div>');
	$('.inner').corner("round 8px").parent().css('padding', '2px').corner("round 10px")

	/* Light Green Thumb Viewer for myHQpage Admin */
    $('div.innerThumb').wrap('<div class="outerThumb"></div>');
	$('.innerThumb').corner("round 8px").parent().css('padding', '2px').corner("round 10px")
	
	/* Light Grey */
	$('div.innerGrey').wrap('<div class="outerGrey"></div>');
	$('.innerGrey').corner("round 8px").parent().css('padding', '2px').corner("round 10px")
	
	/* Light Blue */
	
	$('div.innerBlue').wrap('<div class="outerBlue"></div>');
	$('.innerBlue').corner("round 8px").parent().css('padding', '2px').corner("round 10px")

});

$(document).ready(function(){ 
       	$('#contactDisclaimer').hide();
	   $('#addContactBtn').click(function () {
	   $('#contactDisclaimer').show("slow");
	});
	 $('#acceptDisclaimer').click(function () {
         $('img#addContactBtn').attr("src","/images/addWhite.jpg"); 
	 $('#contactDisclaimer').hide("slow");
          
	});
	$('#rejectDisclaimer').click(function () {
             
         $('img#addContactBtn').attr("src","/images/removeWhite.jpg"); 
		$('#contactDisclaimer').hide("slow");
	});
	$("#calendarContent li:even").addClass("zebraStripes");
	});
        