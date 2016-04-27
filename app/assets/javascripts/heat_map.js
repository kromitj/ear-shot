var map, heatmap;

function initMap() {

  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(createMap);
  } else {
    x.innerHTML = "Geolocation is not supported by this browser.";
  }
  function createMap(position) {
    map = new google.maps.Map(document.getElementById('heatmap'), {
      zoom: 13,
      center: {lat: position.coords.latitude, lng: position.coords.longitude},
      mapTypeId: google.maps.MapTypeId.SATELLITE
    });

    heatmap = new google.maps.visualization.HeatmapLayer({
      data: getPoints(),
      map: map
    });
  }

  function toggleHeatmap() {
    heatmap.setMap(heatmap.getMap() ? null : map);
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
    ]
    heatmap.set('gradient', heatmap.get('gradient') ? null : gradient);
  }

  function changeRadius() {
    heatmap.set('radius', heatmap.get('radius') ? null : 20);
  }

  function changeOpacity() {
    heatmap.set('opacity', heatmap.get('opacity') ? null : 0.2);
  }
}
