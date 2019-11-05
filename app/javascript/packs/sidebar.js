// From theme

(function($) {
  "use strict"; // Start of use strict

  // Toggle the side navigation
  $("#sidebarToggle, #sidebarToggleTop").on('click', function(e) {
    $("body").toggleClass("sidebar-toggled");
    $(".sidebar").toggleClass("toggled");
    if ($(".sidebar").hasClass("toggled")) {
      $('.sidebar .collapse').collapse('hide');
    };
  });

  // Close any open menu accordions when window is resized below 768px
  $(window).resize(function() {
    if ($(window).width() < 768) {
      $('.sidebar .collapse').collapse('hide');
    };
  });
})(jQuery); // End of use strict


// Add 'active' class to activated element on sidebar
const dashboardButton = document.querySelector('#dashboard-sidebar-link')
const feedButton = document.querySelector('#feed-sidebar-link')
const exploreButton = document.querySelector('#explore-sidebar-link')

feedButton.addEventListener("click", (event) => {
  console.log("clicked");
  currentTarget.classList = "nav-item active"
});
