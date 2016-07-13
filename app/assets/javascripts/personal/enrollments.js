function cancel_class(enrollment_id){
  $.ajax({
    url: "/my/enrollments/cancel",
    data: {enrollment_id: enrollment_id},
    success: function(result){
      $("#enrollment_" + enrollment_id).prop("disabled", true);
      $("#status_" + enrollment_id).text("paid");
    }
  });
}

function calories_burnt(type){
  frequency = $("#frequency_calories_burnt").find(":selected").val();
  $.ajax({
    url: "/my/enrollments/calories_burnt",
    data: {frequency: frequency},
    success: function(result){
      $("#calories_burnt").text(result + ' Calories Burnt')
    }
  });
}

function booked_classes() {
  $.ajax({
    url: "/my/enrollments/classes",
    success: function(result) {
      $("#class-list").html(result);
      $("#btn-by-booked").addClass("button-class-active");
      $("#btn-by-passed").removeClass("button-class-active");
    }
  });
}

function passed_classes() {
  $.ajax({
    url: "/my/enrollments/classes",
    data: { statuses: [2] },
    success: function(result) {
      $("#class-list").html(result);
      $("#btn-by-booked").removeClass("button-class-active");
      $("#btn-by-passed").addClass("button-class-active");
    }
  });
}
