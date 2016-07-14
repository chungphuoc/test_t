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
  $('#search-box #field-station button').click(function(){
    content = $('#search-box #field-station .content');
    content.css('display', 'block');
  });

  $('#search-box #field-exercise button').click(function(){
    content = $('#search-box #field-exercise .content');
    content.css('display', 'block');
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