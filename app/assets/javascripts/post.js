$(function() {
  var form_num = $('.study-form-input').length;
  $('#add_item_button').on('click', function() {
    var input =
        '<div class="study-form-input">'
          +'<div class="form-group">'
            +'<div class="taskNew-title">'
              +'言語'
            +'</div>'
            +'<select name="post[task_attributes]['+form_num+'][language]" id="post_task_attributes_0_language">'
            +'<option value="">---</option>'
            +'<option value="html">html</option>'
            +'<option value="css">css</option>'
            +'<option value="javascript">javascript</option>'
            +'<option value="rails">rails</option>'
            +'</select>'
          +'</div>'
          +'<div class="form-group">'
            +'<div class="taskNew-title">'
              +'勉強時間'
            +'</div>'
             +'<select name="post[task_attributes]['+form_num+'][time]" id="post_task_attributes_0_time">'
             +'<option value="">---</option>'
             +'<option value="1時間">1時間</option>'
             +'<option value="2時間">2時間</option>'
             +'<option value="3時間">3時間</option>'
             +'<option value="4時間">4時間</option>'
             +'<option value="5時間">5時間</option>'
             +'<option value="6時間">6時間</option>'
             +'<option value="7時間">7時間</option>'
             +'<option value="8時間">8時間</option>'
             +'<option value="9時間">9時間</option>'
             +'<option value="10時間">10時間</option>'
             +'<option value="11時間">11時間</option>'
            +'<option value="12時間">12時間</option></select>'
          +'</div>'
        +'</div>'
    $('#input_box').append(input);
    console.log(input)
    form_num ++;
  });

  // $('#team_members_box').on('click', '.member_delete', function() {
  //   var inputId = $(this).data('id');
  //   var defaultData = $(this).data('default');
  //   if (defaultData == 'default') {
  //     $(this).prev().prop('checked', true);
  //     $('#add_member_' + inputId).hide();
  //   }else{
  //     $('#add_member_' + inputId).remove();
  //   }
  // });
});