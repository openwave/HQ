$(document).ready(function(){
    $('#createGallery').hide();
    $("#gallerySelect").click(function () {
        if (this.options[this.selectedIndex].id == 'newGallery') {
                $("#createGallery").show('slow');
        } else {
                $("#createGallery").hide('slow');
        }
    });
});
