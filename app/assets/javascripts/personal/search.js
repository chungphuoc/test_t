function change_view_mode(mode = 'day') {
  var mode_view = document.getElementById('mode_view');
  mode_view.value = mode;
}

function search_remove_element(element_id) {
  var checkbox = document.getElementById(element_id);
  var form_search = document.getElementById('search_class');
  if (checkbox.checked) {
    checkbox.checked = false;
  }
  form_search.submit();
}