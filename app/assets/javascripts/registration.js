function click_box_agree(checkbox){
  var button = document.querySelector('#button-submit .btn-register');
  if (checkbox.checked == true) {
    button.disabled = false;
  } else {
    button.disabled = true;
  }
}