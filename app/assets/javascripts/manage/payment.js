function change_year_payment(){
  deactive_all_buttons();
  button_all = document.querySelector('.paymet-section .time-section button');
  button_all.classList.add('btn-active');
  year = $('#date_year').find(':selected').val();
  $.ajax({
    url: "/manage/payment/year_filter",
    data: {year: year},
    success: function(result){
      $("#payment-table").html(result);
    }
  });
};

function change_month_payment(month, button){
  deactive_all_buttons();
  button.classList.add('btn-active');
  year = $('#date_year').find(':selected').val();
  $.ajax({
    url: "/manage/payment/month_filter",
    data: {month: month, year: year},
    success: function(result){
      $("#payment-table").html(result);
    }
  });
};

function deactive_all_buttons() {
  document.querySelector('.paymet-section .time-section .btn-active').classList.remove('btn-active');
}
