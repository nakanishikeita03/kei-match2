$(function(){
  function buildHTML(message){
    var imagehtml = message.image == null ? "" : `<img src="${message.image}">`;
     var html = `<div class='message d-flex' data-message-id='${message.id}'>
     <div class='left-message'>
     <div class='left-message__img'>
     ${imagehtml}
     </div>
     </div>
     <div class='right-message'>
     <div class='upper-message'>
     <div class='upper-message__name'>
     ${ message.name }
     </div>
     <div class='upper-message__date'>
     ${ message.date }
     </div>
     </div>
     <div class='lower-message'>
     <p class='lower-message__contents'>
     ${ message.content }
     </p>
     </div>
     </div>
     </div> `
    return html;
  }

  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.messages').append(html);
      $( ".form__submit").prop( "disabled", false );
      $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight}, 'fast');
      $('#new_message')[0].reset();
    })
    .fail(function(){
      alert('error');
    })
  })
  var reloadMessages = function () {
    if (window.location.href.match(/\/groups\/\d+\/messages/)){
      var last_message_id = $(".message:last").data("message-id");
    $.ajax({
      url: `api/messages`,
      type: 'get',
      dataType: 'json',
      data: {id: last_message_id}
    })
    .done(function (messages) {
      var insertHTML ='';
      messages.forEach(function (message) {
        insertHTML = buildHTML(message);
        $('.messages').append(insertHTML);
        $('.messages').animate({scrollTop: $('.messages')[0].scrollHeight},'fast');
    });
  })
    .fail(function () {
      alert('自動更新に失敗しました');

    });
  }
};
setInterval(reloadMessages, 5000);

});