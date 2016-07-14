function by_studio_name(locale){
  $.ajax({
    url: "/my/studios/by_name",
    data: {locale: locale},
    success: function(result){
      $("#studio-list").html(result);
      $("#btn-by-station").removeClass("button-class-active");
      $("#btn-by-favorite").removeClass("button-class-active");
      $("#btn-by-name").addClass("button-class-active");
    }
  });
}

function by_station(locale){
  $.ajax({
    url: "/my/studios/by_station",
    data: {locale: locale},
    success: function(result){
      $("#studio-list").html(result);
      $("#btn-by-name").removeClass("button-class-active");
      $("#btn-by-favorite").removeClass("button-class-active");
      $("#btn-by-station").addClass("button-class-active");
    }
  });
}

function by_studio_favorite(locale) {
  $.ajax({
    url: "/my/studios/by_favorite",
    data: {locale: locale},
    success: function(result){
      $("#studio-list").html(result);
      $("#btn-by-name").removeClass("button-class-active");
      $("#btn-by-station").removeClass("button-class-active");
      $("#btn-by-favorite").addClass("button-class-active");
    }
  });
}

function remove_studio_favorite(customer_id, course_id, button) {
  var parent = $(button).parents("tr");
  $.ajax({
    url: "/my/favourite_courses/remove",
    data: { customer_id: customer_id, course_id: course_id },
    type: "POST",
    success: function(result){
      parent.fadeOut(function() { $(this).remove(); });
    }
  });
}
