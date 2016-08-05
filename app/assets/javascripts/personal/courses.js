function displaySearch(){
  var search_form = $('#search-form');
  if (search_form.hasClass('hidden')) {
    $('#show-search').text('Hide Search');
    search_form.removeClass('hidden');
    setTimeout(function () {
      search_form.removeClass('visuallyhidden');
    }, 50);
  } else {
    $('#show-search').text('Show Search');
    search_form.addClass('visuallyhidden');
    search_form.one('transitionend', function(e) {
      search_form.addClass('hidden');
    });
  }
};

$(document).ready(function(){
  $('#search-box #field-station .select-box').click(function(){
    content = $('#search-box #field-station .content');
    content.toggle();
  });

  $('#search-box #field-exercise .select-box').click(function(){
    content = $('#search-box #field-exercise .content');
    content.toggle();
  });

  $(document).click(function(e){
    if ($(e.target).is("#search-box #field-station *") === false){
      content = $('#search-box #field-station .content');
      content.css('display', 'none');
    }

    if ($(e.target).is("#search-box #field-exercise *") === false){
      content = $('#search-box #field-exercise .content');
      content.css('display', 'none');
    }
  });
});

function remove_favorite_studio(customer_id, course_id, close) {
  var parent = $(close).parents("li");
  $.ajax({
    url: "/my/favourite_courses/remove",
    beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]')
         .attr('content'))
    },
    data: { customer_id: customer_id, course_id: course_id },
    type: "POST",
    success: function(result){
      parent.fadeOut(function() { $(this).remove(); });
      console.log("remove favorite studio");
    }
  });
}
// get courses depend on url
function get_courses(url_data, callback) {
  $.ajax({
    url: url_data,
    type: "GET",
    success: function(result){
      $("#course-items").html(result);
      callback();
    }
  });
}

function get_featured_courses() {
  get_courses('/my/courses/featured_courses', function() {
    $(".btn-filter").removeClass("button-class-active");
    $("#featured").addClass("button-class-active");
  });
}

function get_event_courses() {
  get_courses('/my/courses/event_courses', function() {
    $(".btn-filter").removeClass("button-class-active");
    $("#event").addClass("button-class-active");
  });
}

function get_new_courses() {
  get_courses('/my/courses/new_courses', function() {
    $(".btn-filter").removeClass("button-class-active");
    $("#new").addClass("button-class-active");
  });
}

function search_checkbox_click(checkbox, type) {
  // get label associate with checkbox
  label = document.querySelector("label[for=\"" + checkbox.id + "\"]")
  // get input Element
  input = document.querySelector("#field-" + type + " .select-box input");
  array_value = input.value.split('/');
  // Find and Remove ""
  var i = array_value.indexOf("");
  if(i != -1) {
    array_value.splice(i, 1);
  }

  if (checkbox.checked == true) {
    array_value.push(label.textContent);
  }
  else {
    var i = array_value.indexOf(label.textContent);
    if(i != -1) {
      array_value.splice(i, 1);
    }
  }
  input.value = array_value.join('/');
}

function add_option_checkout(option_id, checkbox) {
  if ($(checkbox).is(':checked')) {
    var price = $("#option-price-" + option_id);
    var total = $("#total-cost");
    var cost = parseInt(total.attr('data-price')) + parseInt(price.attr('data-price'));
    total.text(cost + ' ' + total.attr('data-currency'));
    total.attr('data-price', cost);
    price.css('text-decoration', 'none');
    $("#checkout-form")
      .append($("<input name='payable_option[]' type='hidden'>")
                  .val(option_id)
                  .attr('id', 'payable_option_' + option_id));
  } else {
    var price = $("#option-price-" + option_id);
    var total = $("#total-cost");
    var cost = parseInt(total.attr('data-price')) - parseInt(price.attr('data-price'));
    total.text(cost + ' ' + total.attr('data-currency'));
    total.attr('data-price', cost);
    price.css('text-decoration', 'line-through');
    $('#payable_option_' + option_id).remove();
  }
}

function Minute2Text(m) {
  var minute = m % 60;
  var hour = Math.floor(m / 60);

  minute = (minute < 10 ? '0' : '') + minute;
  hour = (hour < 10 ? '0' : '') + hour;

  return hour + ":" + minute + ":00";
}

function slider_change(type) {
  var slider = document.getElementById(type + '-slider');
  var value = slider.getAttribute('data-value').split(',');
  var min = value[0];
  var max = value[1];

  if (type === 'time') {
    max = Minute2Text(max);
    min = Minute2Text(min);
  }
  document.getElementById('max_' + type).value = max;
  document.getElementById('min_' + type).value = min;
}
