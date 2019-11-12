import "bootstrap";

import { autocomplete } from "./google_places.js";

autocomplete();

// window.Chartkick = Chartkick
// This makes sure the dropdown of filters doesnt colapse once you click on something
if (document.querySelector('.filter-dropdown-menu')){
  $(".filter-dropdown-menu").click(function(e){
   e.stopPropagation();
  })
}

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

