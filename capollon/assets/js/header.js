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

  /* const eyes = document.querySelector('iframe html');

  document.addEventListener('mousemove', (event) => {
    console.log("salut");
    console.log(eyes);
    eyes.forEach((eye) => {
      console.log("non");
      const pupil = eye.querySelector('.pupil');
      const eyeRect = eye.getBoundingClientRect();

      // Calculer la position relative de la souris par rapport au smiley
      const eyeCenterX = eyeRect.left + eyeRect.width / 2;
      const eyeCenterY = eyeRect.top + eyeRect.height / 2;
      
      // Calcul de l'angle en fonction de la position de la souris
      const angle = Math.atan2(event.clientY - eyeCenterY, event.clientX - eyeCenterX);

      // Limiter le déplacement des pupilles
      const pupilX = Math.cos(angle) * 4;
      const pupilY = Math.sin(angle) * 5;

      // Appliquer le déplacement aux pupilles
    
        pupil.style.transform = `translate(${pupilX}px, ${pupilY}px)`;
    });
  }); */
  
});
