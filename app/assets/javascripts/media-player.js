$( document ).ready(function() {
  $('.media-play-btn').on('click', function(event) {
    event.preventDefault();
    var $playBtn = $(this);
    $songClicked = document.getElementById("song"+ $(this).attr("song"));

    if ($songClicked.paused == true) {
      $songClicked.play();
    } else { $songClicked.pause();}
  })
});
