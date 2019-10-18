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
});