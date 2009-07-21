
	function more_facts(value){
		if (value == "Remove Quick Fact"){
			document.getElementById('more_facts').className = "showDiv";
			document.getElementById('custom_facts_dropdownelse').className = "showDiv";
			document.getElementById('custom_facts_bothelse').className = "showDiv";
         }
		 else {
		 	document.getElementById('more_facts').className = "hideDiv";
		 	document.getElementById('custom_facts_dropdownelse').className = "hideDiv";
//		 	document.getElementById('custom_facts_dropdownelsein').className = "showDiv";
		 	document.getElementById('custom_facts_bothelse').className = "showDiv";
		 }
		}
 
 
	function more_facts1(value){
		if (value == "Remove Quick Fact"){
			document.getElementById('custom_more_facts').className = "showDiv";
         }
		 else if (value == "Custom") {
		 	document.getElementById('custom_facts_dropdown').className = "showDiv";
		 	document.getElementById('custom_facts_textfield').className = "hideDiv";			
		 }
		 else {
		 	document.getElementById('custom_more_facts').className = "hideDiv";
		 }
		}
	function revert_more_fact(){
		 	document.getElementById('custom_facts_dropdown').className = "hideDiv";
		 	document.getElementById('custom_facts_textfield').className = "showDiv";			
      	}

	function revert_more_ifelse(){
		 	document.getElementById('custom_facts_bothelse').className = "showDiv";
		 	document.getElementById('custom_facts_dropdownelse').className = "hideDiv";
		 	document.getElementById('custom_facts_dropdownelsein').className = "hideDiv";
      	}
		
	function revert_more_elseif(value){
		if (value == "Remove Quick Fact"){
			document.getElementById('custom_facts_dropdownelsein').className = "showDiv";
			document.getElementById('custom_facts_bothelse').className = "showDiv";
         }
		 else if (value == "Custom") {
		 	document.getElementById('custom_facts_dropdownelse').className = "showDiv";
		 	document.getElementById('custom_facts_bothelse').className = "hideDiv";			
		 }
		 else {
		 	document.getElementById('custom_facts_dropdownelse').className = "hideDiv";
		 	document.getElementById('custom_facts_dropdownelsein').className = "hideDiv";
		 	document.getElementById('custom_facts_bothelse').className = "showDiv";
		 }
		}

