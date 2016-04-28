
function initUserMap(){
// var position;
var x = document.getElementById("demo");
  // function getLocation() {
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(createMap);
      } else {
          x.innerHTML = "Geolocation is not supported by this browser.";
      }
  // }
  // getLocation();

  function createMap(position) {
    userMap = new google.maps.Map(document.getElementById('user-map'), {
      center: {lat: position.coords.latitude, lng: position.coords.longitude},
      zoom: 13
    });
    var lat = position.coords.latitude;
    var long = position.coords.longitude;

    var ajaxRequest = $.ajax({
      type: "GET",
      url: "/near/requests/?lat=" + lat + "&long="+long
    });

    ajaxRequest.done(function(response){
      var song_collection = response;
      var location_objects = [];
      for(var i=0; i < song_collection.length; i++){
        location_objects.push(song_collection[i].locations[0]);
      }
        var songCircles = [];
        for(var j=0; j < location_objects.length; j++){
       songCircles.push(new google.maps.Circle({
          fillColor: '#6ccbf7',
          fillOpacity: .6,
          strokeWeight: 1,
          clickable: true,
          editable: false,
          zIndex: 1,
          map: userMap,
          center: {lat: location_objects[j].lat, lng: location_objects[j].long},
          radius: location_objects[j].radius
        }));

      }

    });




  }
}
