$(function() {
  $('.snsIcon').on('mouseover', function() {
    $(this).parent().find('.snsIcon-text').addClass("text-changed");
    $(this).parent().find('i').addClass("font-size");
    $(this).addClass("opacity");
  });
  
  $('.snsIcon').on('mouseout', function() {
    $(this).parent().find('.snsIcon-text').removeClass("text-changed");
    $(this).parent().find('i').removeClass("font-size");
    $(this).removeClass("opacity");
  });
  $('#post-image').on('mouseover', function() {
    $(this).addClass("post-image-gif");
    $(this).removeClass("post-image-mp4");
  });
  $('#post-image').on('mouseout', function() {
    $(this).addClass("post-image-mp4");
    $(this).removeClass("post-image-gif");
  });
  $('#message-image').on('mouseover', function() {
    $(this).addClass("message-image-gif");
    $(this).removeClass("message-image-mp4");
  });
  $('#message-image').on('mouseout', function() {
    $(this).addClass("message-image-mp4");
    $(this).removeClass("message-image-gif");
  });
  $('#post-index-image').on('mouseover', function() {
    $(this).addClass("post-index-image-gif");
    $(this).removeClass("post-index-image-mp4");
  });
  $('#post-index-image').on('mouseout', function() {
    $(this).addClass("post-index-image-mp4");
    $(this).removeClass("post-index-image-gif");
  });
});