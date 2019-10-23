$(document).on("change", "#file_photo", function(e) {
  var reader;
  if (e.target.files.length) {
    reader = new FileReader;
    reader.onload = function(e) {
      var userThumbnail;
      userThumbnail = document.getElementById('thumbnail');
      $("#userImgPreview").addClass("is-active");
      userThumbnail.setAttribute('src', e.target.result);
    };
    return reader.readAsDataURL(e.target.files[0]);
  }
});

$(function() {
  $('.form-control').on('focusin', function() {
    $(this).parent().find('label').addClass('active-label');
  });
  
  $('.form-control').on('focusout', function() {
    if (!this.value) {
      $(this).parent().find('label').removeClass('active-label');
    }
  });
});