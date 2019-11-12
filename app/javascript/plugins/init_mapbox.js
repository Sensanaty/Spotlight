import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  // debugger
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/jrrutten/ck2u80316600q1cmk0txz0cib'
  });
};

//Tetststs
const addMarkersToMap = (map, markers) => {
  const center = JSON.parse(mapElement.dataset.center)[0]

  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });

  const centerPopup = new mapboxgl.Popup().setHTML(center.infoWindow);
  new mapboxgl.Marker({color: 'red'})
      .setLngLat([ center.lng, center.lat ])
      .setPopup(centerPopup)
      .addTo(map);

};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { duration: 1200,padding: 70, maxZoom: 15 });
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
