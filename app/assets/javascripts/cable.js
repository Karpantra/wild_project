// Action Cable provides the framework to deal with WebSockets in Rails.
// You can generate new channels where WebSocket features live using the rails generate channel command.
//
//= require action_cable
//= require_self
//= require_tree ./channels

(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);


//smooth effect for homepage link image

$('a[href^="#carousel-example-generic"]').click(function(){
  var the_id = $(this).attr("href");
  var speed = 850;
  $('html, body').animate({
    scrollTop:$(the_id).offset().top
  }, speed);
  return false;
});

