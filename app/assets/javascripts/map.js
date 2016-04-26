// $(document).ready(function(){
var map;
var circle;

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
    map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: position.coords.latitude, lng: position.coords.longitude},
      zoom: 13
    });

  var input = document.getElementById('pac-input');
  var searchBox = new google.maps.places.SearchBox(input);
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(input)

   map.addListener('bounds_changed', function() {
    searchBox.setBounds(map.getBounds());
  });

  var markers = [];
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
  }

  markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

  var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };
  markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        position: place.geometry.location
      }));

  if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
    });
    map.fitBounds(bounds);
  });

  var drawingManager = new google.maps.drawing.DrawingManager({
    drawingMode: google.maps.drawing.OverlayType.MARKER,
    drawingControl: true,
    drawingControlOptions: {
      position: google.maps.ControlPosition.TOP_RIGHT,
      drawingModes: [
      // google.maps.drawing.OverlayType.MARKER,
      google.maps.drawing.OverlayType.CIRCLE,
      // google.maps.drawing.OverlayType.POLYGON,
      // google.maps.drawing.OverlayType.POLYLINE,
      // google.maps.drawing.OverlayType.RECTANGLE
      ]
    },
    markerOptions: {icon: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'},
    circleOptions: {
      fillColor: '#6ccbf7',
      fillOpacity: .6,
      strokeWeight: 1,
      clickable: true,
      editable: false,
      zIndex: 1
    }
  });
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input)

  drawingManager.setMap(map);
  var all_overlays = [];
  google.maps.event.addListener(drawingManager, 'overlaycomplete', function(e) {
  all_overlays.push(e);
  var circle = e.overlay;

  var lat = circle.getCenter().lat();
  var lng = circle.getCenter().lng();
  // set location parameters to hidden field values

  var radius = circle.getRadius();
  var maxRadius = 5000;
  var checkRadius = function(radius){
    if( radius > maxRadius){
      circle.setRadius(maxRadius);
      return maxRadius;
    }
    else{
      return circle.radius;
    }
  }
  $("#song_location_long").val(lng);
  $("#song_location_lat").val(lat);
  $("#song_location_radius").val(checkRadius(radius));
  console.log($("#song_location_radius").val())
  // checks if there's more than one overlay, removes first one from map and array if true
  if (all_overlays.length > 1){
      all_overlays[0].overlay.setMap(null);
      all_overlays.shift(0);
  }


  if (e.type != google.maps.drawing.OverlayType.MARKER) {
  // Switch back to non-drawing mode after drawing a shape.
  drawingManager.setDrawingMode(null);
  // Add an event listener that selects the newly-drawn shape when the user
  // mouses down on it.
  var newShape = e.overlay;
  newShape.type = e.type;
  // google.maps.event.addListener(newShape, 'click', function() {
  //   setSelection(newShape);
  // });
  // setSelection(newShape);
    }

  });
$("#reset").on("click",function(){
    for (var i=0; i < all_overlays.length; i++){
      all_overlays[i].overlay.setMap(null);
    }
      all_overlays = [];
    });
  }
}



