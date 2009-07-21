// test auto-ready logic - call corner before DOM is ready
jQuery.noConflict();

jQuery(function(){
	/* Light Green */
    jQuery('div.inner').wrap('<div class="outer"></div>');
	jQuery('.inner').corner("round 8px").parent().css('padding', '2px').corner("round 10px")

	/* Light Green Thumb Viewer for myHQpage Admin */
    jQuery('div.innerThumb').wrap('<div class="outerThumb"></div>');
	jQuery('.innerThumb').corner("round 8px").parent().css('padding', '2px').corner("round 10px")
	
	/* Light Grey */
	jQuery('div.innerGrey').wrap('<div class="outerGrey"></div>');
	jQuery('.innerGrey').corner("round 8px").parent().css('padding', '2px').corner("round 10px")
	
	/* Light Blue */
	
	jQuery('div.innerBlue').wrap('<div class="outerBlue"></div>');
	jQuery('.innerBlue').corner("round 8px").parent().css('padding', '2px').corner("round 10px")

});

jQuery(document).ready(function(){  
	jQuery('#contactDisclaimer').hide();
	
	jQuery('#addContactBtn').click(function () {
		jQuery('#contactDisclaimer').show("slow");
	});
	jQuery('#acceptDisclaimer, #rejectDisclaimer').click(function () {
		jQuery('#contactDisclaimer').hide("slow");
	});
	
	jQuery("#calendarContent li:even").addClass("zebraStripes");
	
});