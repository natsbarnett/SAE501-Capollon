document.addEventListener("DOMContentLoaded", function () {
  document.querySelector(".menu-button").addEventListener("click", function () {
    var menu = document.querySelector(".mobile-menu");
    menu.classList.toggle("active");
  });

  document
    .querySelector(".menu-button-close")
    .addEventListener("click", function () {
      var menu = document.querySelector(".mobile-menu");
      menu.classList.toggle("active");
    });


  document.getElementById('trigger').addEventListener('click', function () {
    const menu = document.querySelector('.option_connexion');
    menu.classList.toggle('menu_profil_visible');
  });
  
});
