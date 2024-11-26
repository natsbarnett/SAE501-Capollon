from flask import Flask, request, jsonify

# Création de l'application Flask
app = Flask(__name__)

# Définition d'une route pour la page d'accueil
@app.route("/")
def home():
    return render_template("index.html") # Rendu du fichier html 


def start_app():
    print("L'application est en cours de démarrage...")



#Lance la fonction uniquement par le fichier lui même et non par import
if __name__ == "__main__":
    start_app()
    app.run(debug=True)