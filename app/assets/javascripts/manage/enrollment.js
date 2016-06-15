function booked_class(){
  $.ajax({
    url: "/manage/enrollments/booked",
    data: {},
    success: function(result){
      $("#enrollment-table").html(result);
      $("#btn-passed").removeClass("button-class-active");
      $("#btn-booked").addClass("button-class-active");
    }
  });
};

function passed_class(){
  $.ajax({
    url: "/manage/enrollments/passed",
    data: {},
    success: function(result){
      $("#btn-booked").removeClass("button-class-active");
      $("#btn-passed").addClass("button-class-active");
      $("#enrollment-table").html(result);
    }
  });
};