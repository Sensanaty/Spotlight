import "bootstrap";

import { autocomplete } from "./google_places.js";

autocomplete();



if (document.querySelector('.filter-dropdown-menu')){
  $(".filter-dropdown-menu").click(function(e){
   e.stopPropagation();
})

}
