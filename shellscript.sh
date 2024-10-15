#!/bin/bash

# Vérifier si le script est exécuté en tant que superutilisateur
if [ "$EUID" -ne 0 ]; then
    echo "Veuillez exécuter ce script en tant que superutilisateur."
    exit 1
fi
#------------------------------------------------------------ Installation des dépendances
# Mettre à jour les paquets
echo "Mise à jour des paquets..."
apt update
apt upgrade -y

# Installer Apache
echo "Installation d'Apache..."
apt install apache2 -y
systemctl start apache2
systemctl enable apache2

# Installer MariaDB
echo "Installation de MariaDB..."
apt install mariadb-server -y
mysql_secure_installation

# Installer PHP
echo "Installation de PHP..."
apt install php libapache2-mod-php php-mysql -y
systemctl restart apache2

# Installer des modules PHP supplémentaires (facultatif)
echo "Installation de modules PHP supplémentaires..."
apt install php-cli php-curl php-gd php-mbstring php-xml php-zip -y

# Installation de git
echo "Installation de git..."
apt install git -y

# Installation de unzip
echo "Installation de unzip..."
apt install unzip -y

# Vérifier l'installation d'Apache
echo "Vérification de l'installation d'Apache..."
if systemctl status apache2; then
    echo "Apache est installé et fonctionne."
else
    echo "Erreur lors de l'installation d'Apache."
fi

#--------------------------------------------------------------------------- Création d'un nouvel utilisateur
# Demander le nom d'utilisateur
read -p "Entrez le nom d'utilisateur à créer : " username

# Demander le mot de passe
read -sp "Entrez le mot de passe pour $username : " password
echo

# Créer l'utilisateur
useradd -m "$username"

# Définir le mot de passe
echo "$username:$password" | chpasswd

# Ajouter l'utilisateur au groupe www-data
usermod -aG www-data "$username"

# Confirmation de la création
echo "L'utilisateur $username a été créé avec succès."

# Fin du script
echo "L'installation du stack LAMP et la création de l'utilisateur sont terminées !"
