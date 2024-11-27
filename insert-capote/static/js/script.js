// Sélection des éléments
const fileInput = document.getElementById("img");
const nomInput = document.getElementById("nom");
const prixInput = document.getElementById("prix");
const descInput = document.getElementById("desc");
const addButton = document.getElementById("addProduct");

// Fonction pour vérifier si tous les champs sont remplis
function checkFields() {
    const isFilled =
        fileInput.files.length = 1 &&
        nomInput.value.trim() !== "" &&
        prixInput.value.trim() !== "" &&
        descInput.value.trim() !== "";

    if (isFilled) {
        addButton.classList.remove("desactive"); // Retire la classe 'desactive'
    } else {
        addButton.classList.add("desactive"); // Ajoute la classe 'desactive' si un champ est vide
    }
}

// Ajouter des événements d'écoute sur les champs
fileInput.addEventListener("input", checkFields);
nomInput.addEventListener("input", checkFields);
prixInput.addEventListener("input", checkFields);
descInput.addEventListener("input", checkFields);

addButton.addEventListener("click",()=>{
    validator();
})

function validator() {
    if (button.classList.contains('desactive')) {
        if(isFilled){

        }else {
            alert("Veuillez remplire tous les champs");
        }
    }
}