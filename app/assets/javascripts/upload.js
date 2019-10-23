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
  $('input').on('focusin', function() {
    $(this).parent().find('label').addClass('active');
  });
  
  $('input').on('focusout', function() {
    if (!this.value) {
      $(this).parent().find('label').removeClass('active');
    }
  });
  $('textarea').on('focusin', function() {
    $(this).parent().find('label').addClass('active');
  });
  
  $('textarea').on('focusout', function() {
    if (!this.value) {
      $(this).parent().find('label').removeClass('active');
    }
  });
});