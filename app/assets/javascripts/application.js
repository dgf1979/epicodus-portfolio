//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function() {
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
});
