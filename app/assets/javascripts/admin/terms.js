CKEDITOR.editorConfig = function (config) {
  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];
  config.toolbar = "simple";
}

const CUSTOMER = 'customer';
const STUDIO = 'studio';

function clear_active_button() {
  var button = document.querySelector('#admin_term_index .list-button .active');
  button.classList.remove('active');
}

function show_term(user_type = CUSTOMER){
  var customer = document.getElementById('term_customer');
  var studio = document.getElementById('term_studio');
  var button = document.getElementById('button_term_' + user_type);
  clear_active_button();
  button.classList.add('active');
  if (user_type === CUSTOMER) {
    toggle_term_condition(customer, studio);
  } else {
    toggle_term_condition(studio, customer);
  }
}

function toggle_term_condition(term_show, term_hide) {
  term_show.style.display = 'block';
  term_hide.style.display = 'none';
}