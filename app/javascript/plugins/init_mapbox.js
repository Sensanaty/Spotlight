import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  // debugger
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/jrrutten/ck2u27rmx36oc1cqjfxqmzs23'
  });
};

//Tetststs
const addMarkersToMap = (map, markers) => {
  const center = JSON.parse(mapElement.dataset.center)

  markers.forEach((marker) => {
    console.log(center)
    console.log([marker.lat, marker.lng])
    console.log("----------------------")
    const options = [marker.lat, marker.lng] == center ? {color:red} : {}
    new mapboxgl.Marker(options)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { duration: 5000,padding: 70, maxZoom: 15 });
};

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
