function autocomplete() {
  var componentForm = {
    name: 'restaurant_name',
    formatted_address: 'restaurant_address',
    price_level: 'restaurant_price_level',
  };

  document.addEventListener("DOMContentLoaded", function() {
    var restaurantLocatorDisplay = document.getElementById('restaurant_selector');

    if (restaurantLocatorDisplay) {
      var autocomplete = new google.maps.places.Autocomplete(restaurantLocatorDisplay, { types: [ 'establishment' ] });
      // autocomplete.setFields(['name', 'formatted_address', 'price_level']);
      autocomplete.addListener('place_changed', function(e) {
        // if (e.key === "Enter") {
        //   e.preventDefault(); // Do not submit the form on Enter.
        // }
        var place = autocomplete.getPlace();
        console.log(place);

        for (var component in componentForm) {
          console.log(componentForm[component]);
          document.getElementById(componentForm[component]).value = place[component];
          document.getElementById(componentForm[component]).disabled = false;
        }
      });
    };
  });
}

export { autocomplete }
