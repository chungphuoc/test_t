CKEDITOR.editorConfig = function (config) {
  config.toolbar_mini = [
    ["Bold",  "Italic",  "Underline",  "Strike",  "-",  "Subscript",  "Superscript"],
  ];
  config.toolbar = "simple";
}

function show_term_customer(button){
  var customer = document.getElementById('term_customer');
  var studio = document.getElementById('term_studio');
  customer.style.display = 'block';
  studio.style.display = 'none';
}

function show_term_studio() {
  var customer = document.getElementById('term_customer');
  var studio = document.getElementById('term_studio');
  customer.style.display = 'none';
  studio.style.display = 'block';
}