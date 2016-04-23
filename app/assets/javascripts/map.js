// $(document).ready(function(){
var map;
var circle;
function initMap(){
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 12
  });
  var drawingManager = new google.maps.drawing.DrawingManager({
    drawingMode: google.maps.drawing.OverlayType.MARKER,
    drawingControl: true,
    drawingControlOptions: {
      position: google.maps.ControlPosition.TOP_CENTER,
      drawingModes: [
      google.maps.drawing.OverlayType.MARKER,
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
      editable: true,
      zIndex: 1
    }
  });
  drawingManager.setMap(map);
  var all_overlays = [];
  google.maps.event.addListener(drawingManager, 'overlaycomplete', function(e) {
  all_overlays.push(e);
  var circle = e.overlay
  var radius = circle.radius
  $("#radius").text(radius + " meters")

  var lat = circle.getCenter().lat();
  var lng = circle.getCenter().lng();

  console.log(radius);
  console.log(lat);
  console.log(lng);

  // var ajaxRequest = $.ajax({
  //   method: 'GET',
  //   url: "/artists/",
  //   data: radius
  // })

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


