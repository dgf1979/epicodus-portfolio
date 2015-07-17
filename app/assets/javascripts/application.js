//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

var ready;
ready = function() {
  "use strict";

  var userSessionTZ = $("#client-timezone").attr("data-value");
  if (userSessionTZ === "") { setTZ(); }

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
  var routeParts = window.location.pathname.split('/');
  $('ul.nav li a[href="/' + routeParts[1] + '"]').parent("li").addClass("active");
};

function setTZ() {

  var tz = jstz.determine(); // Determines the time zone of the browser client
  var tzName = tz.name(); // Returns the name of the time zone eg "Europe/Berlin"

   var sendInfo = {
       timeZoneName: tzName
   };

   $.ajax({
       type: "POST",
       url: "/session",
       dataType: "json",
       success: function (msg) {
           if (msg) {
               console.log("posted client timezone: " + tzName);
           } else {
               console.log("timezone post failed!");
           }
       },
       data: sendInfo
   });
}

$(document).ready(ready);
$(document).on('page:load', ready);
