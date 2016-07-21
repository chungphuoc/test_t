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

function add_option(){
  option_name = $('#option_name').val();
  option_price = $('#option_price').val();
  option_currency = $('#option_currency').val();
  $.ajax({
    url: 'add_payable_option',
    data: {option: { name: option_name, price: option_price, currency: option_currency } },
    success: function(result) {
      if (result.error) {
        error_text = $('.options-box .errors-text');
        error_text.empty();

        $.each(result.error, function(index, error){
          error_text.append('<p>' + error  + '</p>');
        });
      }
      else {
        var newOption = $("#option-template").clone().removeAttr('id');
        newOption.children('.name').text(result.name);
        newOption.children('.price').text(result.price + ' ' + result.currency);
        newOption.children('i').attr('onclick', 'remove_option(' + result.id + ',this)');
        $('.list-options').append(newOption.show());
        $('.form-option').hide();
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

function add_option_click(){
  form = $('.options-box .form-option');

  if (form.css('display') == 'none') {
    form.find('input').val('');
    form.css('display', 'block');
    error_text = $('.options-box .errors-text');
    error_text.empty();
  }
  else {
    form.css('display', 'none');
  }
}

function remove_option(option_id, child) {
  var parent = $(child).parents("li");
  $.ajax({
    url: 'remove_payable_option',
    data: {id: option_id},
    success: function(result) {
      parent.fadeOut(function() { $(this).remove(); });
    }
  });
}