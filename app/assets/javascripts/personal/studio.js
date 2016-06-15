function by_studio_name(){
  $.ajax({
    url: "/my/studios/by_name",
    data: {},
    success: function(result){
      $("#studio-list").html(result);
      $("#btn-by-name").removeClass("button-class-active");
      $("#btn-by-station").addClass("button-class-active");
    }
  });
}

function by_station(){
  $.ajax({
    url: "/my/studios/by_station",
    data: {},
    success: function(result){
      $("#studio-list").html(result);
      $("#btn-by-station").removeClass("button-class-active");
      $("#btn-by-name").addClass("button-class-active");
    }
  });
}