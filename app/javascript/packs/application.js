// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

const autosize = require('autosize');
window.jQuery = window.$ = require('jquery');

require('@rails/ujs').start();
require('turbolinks').start();

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

  //
  // Geolocation
  //
  const Geolocation = window.navigator.geolocation;
  const longitudes = $('input[data-x-frontend-value="longitude"]');
  const latitudes = $('input[data-x-frontend-value="latitude"]');

  if (longitudes.length + latitudes.length > 0) {
    console.log('Fetching geolocation');
    Geolocation.getCurrentPosition(
      (res) => {
        console.log('Got geolocation', res);
        longitudes.each((i, el) => $(el).val(res.coords.longitude));
        latitudes.each((i, el) => $(el).val(res.coords.latitude));
      },
      (err) => {
        console.log('Failed to get geolocation:', err);
      }
    );
  }
});
