$(function(){
  $('#myCarousel').carousel();
});


// script pour le smooth scroll
$(document).ready(function(){
  $(function() {
    $('#carousel-example-generic a[href*=#]:not([href=#])').click(function() {
      event.preventDefault();
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        if (target.length) {
          $('html,body').animate({
            scrollTop: target.offset().top
          }, 1000);
          return false;
        }
      }
    });
  });
})
