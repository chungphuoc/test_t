function click_box_agree(checkbox){
  var button = document.querySelector('#button-submit .btn-register');
  if (checkbox.checked == true) {
    button.disabled = false;
  } else {
    button.disabled = true;
  }
}

function select_change(select) {
  var button = document.querySelector('#new_user .form-group #button-register');
  var select_value = select.options[select.selectedIndex].value
  button.setAttribute('data-target', '#termconditionModal_' + select_value);
}