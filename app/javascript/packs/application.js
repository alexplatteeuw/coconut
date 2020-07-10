// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

//= require algolia/v3/algoliasearch.min

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------



// External imports
import { initSelect2 } from "../plugins/init_select2"
import { algoliaSearch } from "../plugins/init_algolia_search";
import "bootstrap";


// Internal imports, e.g:
import { adminCharts } from '../pluggins/charts.js';
import { initChart } from "../plugins/initChart";

document.addEventListener('turbolinks:load', () => {


  $(document).ready(function () {

    adminCharts();
    algoliaSearch();

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
  });
});
