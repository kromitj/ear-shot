var userMap;
var circle;

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

    // var ajaxRequest = $.ajax({
    //   type: "GET",
    //   url: '/requests'
    // });





  }
}
