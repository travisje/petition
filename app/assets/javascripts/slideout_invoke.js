$(document).ready(function() {
  
  var threshold = 840;
  var currentWindowSize = $(window).width();
  var currentLoadState = desktopOrMobile(currentWindowSize);

  function show_desktop() {
      $('#bignav').show();
      $('#menu').hide();
      $('#smallnav').hide();
  }

  function show_mobile() {
    $('#bignav').hide();
    $('#menu').show().css("display","");
    $('#smallnav').show();
    var slideout = new Slideout({
      'panel': document.getElementById('panel'),
      'menu': document.getElementById('menu'),
      'padding': 256,
      'side': 'right',
      'tolerance': 70
    });
    // Toggle button
    document.querySelector('.toggle-button').addEventListener('click', function() {
      slideout.toggle();
    });
  }

  function desktopOrMobile (size) {
    if (size > threshold) {
      return "desktop";
    }
    else {return "mobile";}
  }

  if ( $(window).width() > threshold) {
    show_desktop();
  }
  else {
    show_mobile();
  }

  $(window).on('resize',function(e){
    var current_width = $(window).width();
    if (currentLoadState === "desktop" && current_width <= threshold) {
      show_mobile();
      currentLoadState = "mobile";
    }
    if (currentLoadState === "mobile" && current_width > threshold) {
      show_desktop();
      currentLoadState = "desktop";
    }
  });
});