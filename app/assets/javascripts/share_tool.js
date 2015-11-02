  $(document).ready(function() {
      $('#shareMenu').click(function() {
          $('#shareTools').fadeToggle('medium');
          $('#shareMenu').fadeToggle('medium');
          });
      $('#shareTools').click(function() {
          $('#shareTools').fadeToggle('medium');
          $('#shareMenu').fadeToggle('medium');
          });

});