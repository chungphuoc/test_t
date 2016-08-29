function click_box_agree(checkbox, user_type){
  var button = document.querySelector('#submit_' + user_type  + ' .btn-register');
  if (checkbox.checked == true) {
    button.disabled = false;
  } else {
    button.disabled = true;
  }
}

function open_modal(button) {
  var select_tag = document.getElementById('user_type');
  var select_value = select_tag.options[select_tag.selectedIndex].value
  var form = $('#new_user');

  if (form[0].checkValidity() == false){
    $('<input type="submit">').hide().appendTo(form).click().remove();
  } else {
    var modal = $('#termconditionModal_' + select_value);
    modal.modal();
  }
}