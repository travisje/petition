$(document).ready(function() {
  
  var slideout = new Slideout({
    'panel': document.getElementById('panel'),
    'menu': document.getElementById('menu'),
    'padding': 180,
    'side': 'right',
    'tolerance': 70,
    'touch': false
  });

  // Toggle button
  document.querySelector('.toggle-button').addEventListener('click', function() {
    slideout.toggle();
    this.blur();
  });
  
});
