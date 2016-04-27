$(document).ready(function() {
    $(".all-songs-tab").on("click", function(event) {
      event.preventDefault();

      if ($('.all-songs-wrapper').html().length === 0) {
      var location;
        if (navigator.geolocation) {
         location = navigator.geolocation.getCurrentPosition(returnLocation);
        } else {
            alert("YO bro no work fo sho");
        }

        function returnLocation(position) {
          console.log(position.coords.latitude);

          var ajaxRequest = $.ajax({
            url: '/songs/available',
            data: {
              longitude: position.coords.longitude,
              latitude: position.coords.latitude
            },
            type: 'post'
          });

          ajaxRequest.done(function (availableSongs) {
            console.log(availableSongs);
            $('.all-songs-wrapper').html(availableSongs);
          });
        }
      } else { console.log("no ajax for you...");} // end check for made ajax already

    });
});
