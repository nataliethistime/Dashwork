// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

const autosize = require('autosize');
window.jQuery = window.$ = require('jquery');

require("@rails/ujs").start();
require("turbolinks").start();

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

document.addEventListener('turbolinks:load', () => {
  //
  // Toggle the is-active class when a burger button is clicked on
  //
  $('.navbar-burger').each(function() {
    const burger = $(this);
    burger.click(function() {
      const target = burger.attr('data-target');
      const bar = $(`#${target}`);
      burger.toggleClass('is-active');
      bar.toggleClass('is-active');
    });
  });

  //
  // Hide notification bubbles when clicking on the 'x' button or after 5 seconds automatically.
  //
  $('.notification .delete').each(function() {
    const deleteButton = $(this);
    const notification = deleteButton.parent();

    deleteButton.click(function() {
      notification.fadeOut(500);
    });

    if (notification.hasClass('will-autohide')) {
      setTimeout(() => {
        notification.fadeOut(1000);
      }, 5000);
    }
  });

  //
  // Autosize all <textarea> elements
  //
  autosize(document.querySelectorAll('textarea'));
});
