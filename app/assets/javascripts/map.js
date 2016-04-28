// $(document).ready(function(){
  var map;
  var songsMap;
  var circle;
  var heatMap;

  function initMap(){
    console.log("IN");
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


    var ajaxRequest = $.ajax({
      type: "GET",
      url: window.location.pathname
    });

    ajaxRequest.done(function(response){
      var listenData = [];
      var songsArray = response;
      for(var i=0; i < songsArray.length; i++){
        var songListens = songsArray[i];
        for(var j=0; j < songListens.length; j++){
          listenData.push(songListens[j]);
        }
      }

   // create new map for heatmap
   songsMap = new google.maps.Map(document.getElementById('heatmap'), {
    zoom: 10,
    center: {lat: listenData[0].lat, lng: listenData[0].long},
    mapTypeId: google.maps.MapTypeId.SATELLITE
  });

    // create heatmap overaly, relies on getPoints() method

    heatmap = new google.maps.visualization.HeatmapLayer({
      data: getPoints(),
      map: songsMap
    });

    function toggleHeatmap() {
      heatmap.setMap(heatmap.getMap() ? null : songsMap);
    }

    function changeGradient() {
      var gradient = [
      'rgba(0, 255, 255, 0)',
      'rgba(0, 255, 255, 1)',
      'rgba(0, 191, 255, 1)',
      'rgba(0, 127, 255, 1)',
      'rgba(0, 63, 255, 1)',
      'rgba(0, 0, 255, 1)',
      'rgba(0, 0, 223, 1)',
      'rgba(0, 0, 191, 1)',
      'rgba(0, 0, 159, 1)',
      'rgba(0, 0, 127, 1)',
      'rgba(63, 0, 91, 1)',
      'rgba(127, 0, 63, 1)',
      'rgba(191, 0, 31, 1)',
      'rgba(255, 0, 0, 1)'
      ];
      heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
    }

    function changeRadius() {
      heatmap.set('radius', heatmap.get('radius') ? null : 20);
    }

    function changeOpacity() {
      heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
    }

    function getPoints() {
      var heatPoints = [];
      for(var i=0; i < listenData.length; i++){
        heatPoints.push(new google.maps.LatLng(listenData[i].lat, listenData[i].long));
      }
      return heatPoints;
    }




  });
// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

$("#all").on("click", function(){
 var ajaxRequest = $.ajax({
  type: "GET",
  url: window.location.pathname
});

 ajaxRequest.done(function(response){
  var allListenData = [];
  var songsArray = response;

  for(var i=0; i < songsArray.length; i++){
    var songListens = songsArray[i];
    for(var j=0; j < songListens.length; j++){
      allListenData.push(songListens[j]);
    }
  }

  allSongsMap = new google.maps.Map(document.getElementById('heatmap'), {
    zoom: 15,
    center: {lat: allListenData[0].lat, lng: allListenData[0].long},
    mapTypeId: google.maps.MapTypeId.SATELLITE
  });

    // create heatmap overaly, relies on getPoints() method

    allHeatMap = new google.maps.visualization.HeatmapLayer({
      data: getPoints(),
      map: allSongsMap
    });

    function toggleHeatmap() {
      allHeatMap.setMap(allHeatMap.getMap() ? null : allSongsMap);
    }

    function changeGradient() {
      var gradient = [
      'rgba(0, 255, 255, 0)',
      'rgba(0, 255, 255, 1)',
      'rgba(0, 191, 255, 1)',
      'rgba(0, 127, 255, 1)',
      'rgba(0, 63, 255, 1)',
      'rgba(0, 0, 255, 1)',
      'rgba(0, 0, 223, 1)',
      'rgba(0, 0, 191, 1)',
      'rgba(0, 0, 159, 1)',
      'rgba(0, 0, 127, 1)',
      'rgba(63, 0, 91, 1)',
      'rgba(127, 0, 63, 1)',
      'rgba(191, 0, 31, 1)',
      'rgba(255, 0, 0, 1)'
      ];
      allHeatMap.set('gradient', allHeatMap.get('gradient') ? null : gradient);
    }

    function changeRadius() {
      allHeatMap.set('radius', allHeatMap.get('radius') ? null : 20);
    }

    function changeOpacity() {
      allHeatMap.set('opacity', allHeatMap.get('opacity') ? null : 0.2);
    }
    function getPoints() {
      var songHeatPoints = [];
      for(var i=0; i < allListenData.length; i++){

        songHeatPoints.push(new google.maps.LatLng(allListenData[i].lat, allListenData[i].long));
      }
      console.log(songHeatPoints);
      return songHeatPoints;
    }
  });

});


// +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

var songallListenData = [];
$(".heatmap-button").on("click", function(){

  var dataID = $(this).attr('id');
  var ajaxRequest = $.ajax({
    type: "GET",
    url: "/songs/heat_map/"+dataID
  });


  ajaxRequest.done(function(response){
    var songListenData = response;

    songsMap = new google.maps.Map(document.getElementById('heatmap'), {
      zoom: 15,
      center: {lat: songListenData[0].lat, lng: songListenData[0].long},
      mapTypeId: google.maps.MapTypeId.SATELLITE
    });

    // create heatmap overaly, relies on getPoints() method
    heatmap = new google.maps.visualization.HeatmapLayer({
      data: getPoints(),
      map: songsMap
    });
    function toggleHeatmap() {
      heatmap.setMap(heatmap.getMap() ? null : songsMap);
    }

    function changeGradient() {
      var gradient = [
      'rgba(0, 255, 255, 0)',
      'rgba(0, 255, 255, 1)',
      'rgba(0, 191, 255, 1)',
      'rgba(0, 127, 255, 1)',
      'rgba(0, 63, 255, 1)',
      'rgba(0, 0, 255, 1)',
      'rgba(0, 0, 223, 1)',
      'rgba(0, 0, 191, 1)',
      'rgba(0, 0, 159, 1)',
      'rgba(0, 0, 127, 1)',
      'rgba(63, 0, 91, 1)',
      'rgba(127, 0, 63, 1)',
      'rgba(191, 0, 31, 1)',
      'rgba(255, 0, 0, 1)'
      ];
      heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
    }

    function changeRadius() {
      heatmap.set('radius', heatmap.get('radius') ? null : 20);
    }

    function changeOpacity() {
      heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
    }

    function getPoints() {
      var heatPoints = [];
      for(var i=0; i < songListenData.length; i++){
        heatPoints.push(new google.maps.LatLng(songListenData[i].lat, songListenData[i].long));
      }
      return heatPoints;
    }

  });


   // create new map for heatmap



 });

// +++++++++++++++++++++++++++++++++++++++++++++++++++++


var input = document.getElementById('pac-input');
var searchBox = new google.maps.places.SearchBox(input);
map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);

map.addListener('bounds_changed', function() {
  searchBox.setBounds(map.getBounds());
});

var markers = [];
searchBox.addListener('places_changed', function() {
  var places = searchBox.getPlaces();

  if (places.length === 0) {
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
      fillOpacity: 0.6,
      strokeWeight: 1,
      clickable: true,
      editable: false,
      zIndex: 1
    }
  });
map.controls[google.maps.ControlPosition.TOP_CENTER].push(input);

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
  };
  $("#song_location_long").val(lng);
  $("#song_location_lat").val(lat);
  $("#song_location_radius").val(checkRadius(radius));
  console.log($("#song_location_radius").val());
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
