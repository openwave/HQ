$(document).ready(function(){
    // Hide all large images except the first one
    $('#imageContainer img').hide().filter(':first').show();
    // Select all thumb links
    $('.thumbContainer').mouseover(function(event) {
            // Hide all large images except for the one with the same hash as our thumb link
            $('#imageContainer img').hide().filter("." + this.id).show();
        }
    );
});
