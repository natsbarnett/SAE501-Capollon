document.querySelector(".menu-button").addEventListener("click", function () {
  var menu = document.querySelector(".mobile-menu");
  menu.classList.toggle("active"); // Ajoute ou retire la classe active
});

document
  .querySelector(".menu-button-close")
  .addEventListener("click", function () {
    var menu = document.querySelector(".mobile-menu");
    menu.classList.toggle("active"); // Ajoute ou retire la classe active
  });
