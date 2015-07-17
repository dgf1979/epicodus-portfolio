//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

var ready;
ready = function() {
  "use strict";

  $("#refs-show").click(function() {
    $(".references").slideDown( 450, function() {
      $("#refs-hide").show();
    });
    $(this).hide();
  });
  $("#refs-hide").click(function() {
    $(".references").slideUp( 350, function() {
      $("#refs-show").show();
    });
    $(this).hide();
  });

  // set bootstrap 'active' class on the nav link for the current route.
  routeParts = window.location.pathname.split('/');
  $('ul.nav li a[href="/' + routeParts[1] + '"]').parent("li").addClass("active");
};

$(document).ready(ready);
$(document).on('page:load', ready);
