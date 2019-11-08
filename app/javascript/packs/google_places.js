function autocomplete() {
  const componentForm = {
    name: 'restaurant_name',
    formatted_address: 'restaurant_address',
    price_level: 'restaurant_price_level',
  };

  document.addEventListener("DOMContentLoaded", function() {
    const restaurantLocatorDisplay = document.getElementById('restaurant_selector');

    if (restaurantLocatorDisplay) {
      var autocomplete = new google.maps.places.Autocomplete(restaurantLocatorDisplay, { types: [ 'establishment' ] });
      autocomplete.setFields(['name', 'formatted_address', 'price_level', 'geometry']);
      autocomplete.addListener('place_changed', function(e) {
        // if (e.key === "Enter") {
        //   e.preventDefault(); // Do not submit the form on Enter.
        // }
        const place = autocomplete.getPlace();
        const lat = place.geometry.viewport.ka.g;
        const lon = place.geometry.viewport.pa.g;
        console.log(lat);
        console.log(lon);

        for (var component in componentForm) {
          document.getElementById(componentForm[component]).value = place[component];
          document.getElementById(componentForm[component]).disabled = false;
        }
        document.getElementById("restaurant_latitude").value = lat;
        document.getElementById("restaurant_latitude").disabled = false;
        document.getElementById("restaurant_longitude").value = lon;
        document.getElementById("restaurant_latitude").disabled = false;
      });
    };
  });
}

export { autocomplete }
