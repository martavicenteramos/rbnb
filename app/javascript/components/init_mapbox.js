import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };

  const fitMapToMarkersSingle = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([ markers.lng, markers.lat ]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };


  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/pdunleav/cjofefl7u3j3e2sp0ylex3cyb'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    if (Array.isArray(markers)) {
      markers.forEach((marker) => {
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(map);
      });
      fitMapToMarkers(map, markers);
    }  else {
        new mapboxgl.Marker()
          .setLngLat([ markers.lng, markers.lat ])
          .addTo(map);

      fitMapToMarkersSingle(map, markers);
    }
  }
};

export { initMapbox };
