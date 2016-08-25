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

function remove_favorite_studios() {
  var studio_ids = [];
  $(".favorite-studio input[type=checkbox]:checked").each(function() {
    studio_ids.push($(this).val());
  });
  $.ajax({
    url: '/my/favourite_studios/remove_more',
    method: 'POST',
    beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]')
         .attr('content'))
    },
    data: { studio_ids: studio_ids }
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
// calculate total cost
function change_price() {
  var total = parseInt($("#course_tuition").attr('value'));
  // add options
  $('.option-price').each(function() {
    if ($(this).attr('data-selected') == "1") {
      total += parseInt($(this).attr('data-price'));
    }
  });
  // pay by points
  var point = $("#points");
  var minus_points = point.val() ? parseInt(point.val()) : 0;
  total -= minus_points;
  // change text total
  var total_tag = $("#total-cost, .course-tuition");
  total_tag.attr('data-price', total);
  total_tag.text(total + ' ' + total_tag.attr('data-currency'));
}

function add_option_checkout(option_id, checkbox) {
  var checkboxes = document.getElementsByClassName("payable_options_" + option_id);
  if ($(checkbox).is(':checked')) {
    var price = $("#option-price-" + option_id);
    price.css('text-decoration', 'none');
    price.attr('data-selected', 1);
    change_price();
    $("#checkout-form")
      .append($("<input name='payable_option[]' type='hidden'>")
                  .val(option_id)
                  .attr('id', 'payable_option_' + option_id));
    for (var i = 0; i < checkboxes.length; i++){
      checkboxes[i].checked = true;
    }
  } else {
    var price = $("#option-price-" + option_id);
    price.css('text-decoration', 'line-through');
    price.attr('data-selected', 0);
    change_price();
    $('#payable_option_' + option_id).remove();
    for (var i = 0; i < checkboxes.length; i++){
      checkboxes[i].checked = false;
    }
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

function check_valid_point(input_num) {
  var input = $(input_num);
  var min = parseInt(input.attr('min'));
  var max = parseInt(input.attr('max'));
  var old_val = input.val() ? parseInt(input.val()) : 0;

  if (old_val > max) {
    input.val(max);
  } else if (old_val < min) {
    input.val(min);
  }
  change_price();
}