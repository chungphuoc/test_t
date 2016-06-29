function by_studio_name(locale){
  $.ajax({
    url: "/my/studios/by_name",
    data: {locale: locale},
    success: function(result){
      $("#studio-list").html(result);
      $("#btn-by-station").removeClass("button-class-active");
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
      $("#btn-by-station").addClass("button-class-active");
    }
  });
}