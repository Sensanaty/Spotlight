import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  // debugger
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/jrrutten/ck2zk49h804ws1claoopwc6qu'
  });
};

//Tetststs
const addMarkersToMap = (map, markers) => {
  const center = JSON.parse(mapElement.dataset.center)[0]

  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    new mapboxgl.Marker({color:'orange'})
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });

  const element = document.createElement('div');
  element.className = 'marker';
  element.style.backgroundImage = `url('${center.image_url}')`;
  element.style.backgroundSize = 'contain';
  element.style.width = '50px';
  element.style.height = '50px';

  const centerPopup = new mapboxgl.Popup().setHTML(center.infoWindow);
  new mapboxgl.Marker(element)
      .setLngLat([ center.lng, center.lat ])
      .setPopup(centerPopup)
      .addTo(map);

};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { duration: 1200,padding: 80, maxZoom: 14 });
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
