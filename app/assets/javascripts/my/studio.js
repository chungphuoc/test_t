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
        $('.teachers-box .errors-text').html(result.error)
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
