// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start()
import Rails from '@rails/ujs';
Rails.start();
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

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
import "bootstrap";


// Internal imports, e.g:
import { adminCharts } from '../plugins/charts';
import { initChart } from "../plugins/initChart";
import { initSelect2 } from "../plugins/init_select2"
import { initChatroomCable } from "../channels/chatroom_channel"
import { initCalendar } from "../plugins/fullCalendar"
import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"


document.addEventListener('turbolinks:load', () => {
  if (document.getElementById('calendardiv')) {
    initCalendar();
  }

  const application = Application.start()
  const context = require.context("../controllers", true, /\.js$/)
  application.load(definitionsFromContext(context))

  initChatroomCable();

  $(document).ready(function () {

    adminCharts();

    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });
  });
});
