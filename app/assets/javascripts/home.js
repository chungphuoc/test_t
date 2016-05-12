$(document).ready(function(){
  $('.dropdown-toggle').dropdown()
  $(window).scroll(function(){      //Check to see if the window is top if not then display button
     var height_slider = $('.navbar-custom').height();
     if ($(this).scrollTop() > height_slider) {
       $('.navbar-custom').addClass('website-navbar-scroll');
     } else {
        $('.navbar-custom').removeClass('website-navbar-scroll');
     }
  });
});