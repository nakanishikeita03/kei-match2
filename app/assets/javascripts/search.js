$(function(){
  function appendUser(user){
    var html =
      `<div class="VR5_Q">
        <div class="VR6_Q"></div>
        <div class="fuzzysearch d-flex ">
          <div class="fuzzysearch-user p-2">
          <a href="/users/${user.id}">
            <img src="${user.img_name}" width="50px" height="40px" class="lower-message__image">
            ${ user.name }
          </a>
          </div>
        </div>
      </div>`
    $("#fuzzy_search__result").append(html);
  };

  function appendNoUser(user){
    var html =
      `<div class="VR5_Q">
      <div class="VR6_Q"></div>
      <div class="fuzzysearch d-flex ">
        <div class="fuzzysearch-user p-2">
          ${ user }
        </div>
      </div>
    </div>`
    $("#fuzzy_search__result").append(html);
  }

  $("#fuzzy_search__field").on("keyup", function(){
    var input = $(this).val();
    $.ajax({
    	type: "GET",
    	url:"/users",
    	data: {keyword:input},
    	dataType: "json"
    }) 
    .done(function(users){
    	$("#fuzzy_search__result").empty();
      if (users.length !==0){
        users.forEach(function(user){
          appendUser(user);
        });
      }
      else{
        appendNoUser("一致するユーザーはいません")
      }
    })
    .fail(function(){
      alert("ユーザー検索に失敗しました");
    })
  });


});