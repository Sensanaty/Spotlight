import "bootstrap";

import { autocomplete } from "./google_places.js";

autocomplete();


// This makes sure the dropdown of filters doesnt colapse once you click on something
if (document.querySelector('.filter-dropdown-menu')){
  $(".filter-dropdown-menu").click(function(e){
   e.stopPropagation();
})

}
