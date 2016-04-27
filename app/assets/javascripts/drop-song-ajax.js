$( document ).ready(function() {
 $('.drop-song-btn').on('click', function(event) {
  event.preventDefault();
  $('#drop-song-form').toggle();
 })
});
