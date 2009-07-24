function load_corners()
{
   
      // var wndo2 = new dw_scrollObj('searchWindow', 'searchContent');
       //wndo2.setUpScrollControls('motion_scrollbar');
       var wndo = new dw_scrollObj('searchWindow', 'searchContent');
       wndo.setUpScrollControls('motion_scrollbar');
}

 // Instantiate the uploader and write it to its placeholder div.
	var fileID, uploader;
         
         function upload_file()
         {
      
	YAHOO.widget.Uploader.SWFURL = "/images/uploader.swf";
	
	 uploader = new YAHOO.widget.Uploader( "uploaderUI", "/images/selectFileButton.jpg" );
	
	// Add event listeners to various events on the uploader.
	// Methods on the uploader should only be called once the 
	// contentReady event has fired.
	uploader.addListener('contentReady', handleContentReady);
	uploader.addListener('fileSelect',onFileSelect)
	uploader.addListener('uploadStart',onUploadStart);
	uploader.addListener('uploadProgress',onUploadProgress);
	uploader.addListener('uploadCancel',onUploadCancel);
	uploader.addListener('uploadComplete',onUploadComplete);
	uploader.addListener('uploadCompleteData',onUploadResponse);
	uploader.addListener('uploadError', onUploadError);
    	
    // Variable for holding the selected file ID.

	}
	function handleClearFiles() {
	uploader.clearFileList();
	uploader.enable();
	fileID = null;
	
	var filename = document.getElementById("fileName");
	filename.innerHTML = "";
	
	var progressbar = document.getElementById("progressBar");
	progressbar.innerHTML = "";
	}
		
	// When contentReady event is fired, you can call methods on the uploader.
	function handleContentReady () {
	    // Allows the uploader to send log messages to trace, as well as to YAHOO.log
		uploader.setAllowLogging(true);
		
		// Restrict selection to a single file (that's what it is by default,
		// just demonstrating how).
		uploader.setAllowMultipleFiles(false);
		
		// New set of file filters.
		var ff = new Array({description:"Images", extensions:"*.jpg;*.png;*.gif"},
		                   {description:"Videos", extensions:"*.avi;*.mov;*.mpg"});
		                   
		// Apply new set of file filters to the uploader.
		uploader.setFileFilters(ff);
	}

	// Initiate the file upload. Since there's only one file, 
	// we can use either upload() or uploadAll() call. fileList 
	// needs to have been populated by the user.
	function upload(orgid,tabid,authenticitytoken,deal_flag) {
             if(deal_flag==1){
	if (fileID != null) {
        
          
                      
             var params = {
                 orgid:orgid,
             
                 authenticity_token:authenticitytoken
             }
               var url="http://localhost:3000/haml/update_deal_image/"+orgid;
              
		uploader.upload(fileID, url, "POST",params, "photo");
		fileID = null;
	}
         }
         else
             {
	if (fileID != null) {
             var params = {
                 org_id:orgid,
                 main_tab:tabid,
                 authenticity_token:authenticitytoken,
                 item:document.getElementById('item').value,
                 tab_id:document.getElementById('price_tab').value,
                 description:document.getElementById('description').value,
                 price:document.getElementById('price').value
             }
             
             var url="http://localhost:3000/prices/new_image/"+orgid;
            
		uploader.upload(fileID, url, "POST",params, "photo");
		fileID = null;
	}
             }
	}
	
	// Fired when the user selects files in the "Browse" dialog
	// and clicks "Ok".
	function onFileSelect(event) {
		for (var item in event.fileList) {
		    if(YAHOO.lang.hasOwnProperty(event.fileList, item)) {
				YAHOO.log(event.fileList[item].id);
				fileID = event.fileList[item].id;
			}
		}
		uploader.disable();
		
		var filename = document.getElementById("fileName");
		filename.innerHTML = event.fileList[fileID].name;
		
		var progressbar = document.getElementById("progressBar");
		progressbar.innerHTML = "";
	}

    // Do something on each file's upload start.
	function onUploadStart(event) {
	
	}
	
	// Do something on each file's upload progress event.
	function onUploadProgress(event) {
		prog = Math.round(300*(event["bytesLoaded"]/event["bytesTotal"]));
	  	progbar = "<div style=\"background-color: #f00; height: 5px; width: " + prog + "px\"/>";

		var progressbar = document.getElementById("progressBar");
		progressbar.innerHTML = progbar;
	}
	
	// Do something when each file's upload is complete.
	function onUploadComplete(event) {
		uploader.clearFileList();
		uploader.enable();
		
		progbar = "<div style=\"background-color: #f00; height: 5px; width: 300px\"/>";
		var progressbar = document.getElementById("progressBar");
		progressbar.innerHTML = progbar;
	}
	
	// Do something if a file upload throws an error.
	// (When uploadAll() is used, the Uploader will
	// attempt to continue uploading.
	function onUploadError(event) {

	}
	
	// Do something if an upload is cancelled.
	function onUploadCancel(event) {

	}
	
	// Do something when data is received back from the server.
	function onUploadResponse(event) {
		//alert(event.data);
		YAHOO.log("Server response received.");
	}