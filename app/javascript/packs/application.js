import "bootstrap";
import { toggleDateInputs } from '../components/datepicker.js';
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from '../components/init_mapbox';
import {initAutocomplete } from '../components/init_autocomplete';

toggleDateInputs();
initMapbox();
initAutocomplete();

import algoliasearch from 'algoliasearch/lite';
import instantsearch from 'instantsearch.js';
import { searchBox, hits } from 'instantsearch.js/es/widgets';


const searchClient = algoliasearch('6NT8IPD8TK', '5d00eaa8d0f473939c0735eb49bdf538');

const search = instantsearch({
  indexName: 'Dog',
  searchClient,
});

search.addWidgets([
  searchBox({
    container: "#searchbox"
  }),

  hits({
    container: "#hits"
  })
]);

search.start();
