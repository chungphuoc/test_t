function change_year_payment(){
  year = $('#date_year').find(':selected').val();
  $.ajax({
    url: "/manage/payment/year_filter",
    data: {year: year},
    success: function(result){
      $("#payment-table").html(result);
    }
  });
};

function change_month_payment(month){
  year = $('#date_year').find(':selected').val();
  $.ajax({
    url: "/manage/payment/month_filter",
    data: {month: month, year: year},
    success: function(result){
      $("#payment-table").html(result);
    }
  });
};