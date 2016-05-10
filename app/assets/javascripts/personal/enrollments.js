function cancel_class(enrollment_id){
  $.ajax({
    url: "/personal/enrollments/cancel",
    data: {enrollment_id: enrollment_id},
    success: function(result){
      $("#enrollment_" + enrollment_id).prop("disabled", true);
    }
  });
}