

function initMap(){
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
    map = new google.maps.Map(document.getElementById('user-map'), {
      center: {lat: position.coords.latitude, lng: position.coords.longitude},
      zoom: 13
    });

    var ajaxRequest =


  }
}
