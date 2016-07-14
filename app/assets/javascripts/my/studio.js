$(document).ready(function(){
  $('.dropdown-toggle').dropdown()
});

function add_teacher(){
  teacher_name = $('#teacher_name').val();
  $.ajax({
    url: 'add_teacher',
    data: {name: teacher_name},
    success: function(result) {
      if (result.error) {
        error_text = $('.teachers-box .errors-text');
        error_text.empty();

        $.each(result.error, function(index, error){
          error_text.append('<p>' + error  + '</p>');
        });
      }
      else {
        $('.teachers-box').html(result)
      }
    },
  });
}

function add_teacher_click(){
  form = $('.teachers-box .form-teacher')
  if (form.css('display') == 'none') {
    form.css('display', 'block');
  }
  else {
    form.css('display', 'none');
  }
}
