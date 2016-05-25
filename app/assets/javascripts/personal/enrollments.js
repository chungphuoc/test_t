function cancel_class(enrollment_id){
  $.ajax({
    url: "/personal/enrollments/cancel",
    data: {enrollment_id: enrollment_id},
    success: function(result){
      $("#enrollment_" + enrollment_id).prop("disabled", true);
    }
  });
}

function calories_burnt(type){
  frequency = $("#frequency_calories_burnt").find(":selected").val();
  $.ajax({
    url: "/personal/enrollments/calories_burnt",
    data: {frequency: frequency},
    success: function(result){
      $("#calories_burnt").text(result)
    }
  });
}