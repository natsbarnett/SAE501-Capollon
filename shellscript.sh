#!/bin/bash

INSTALLDIR = /var/www/html/

# Vérifier si le script est exécuté en tant que superutilisateur
if [ "$EUID" -ne 0 ]; then
    echo "Veuillez exécuter ce script en tant que superutilisateur."
    exit 1
fi
#------------------------------------------------------------ Installation des dépendances
echo "+-----------------------------------------------------------------------------------+"
echo "+---                    Installation du stack LAMP                               ---+"
echo "+-----------------------------------------------------------------------------------+"

# Mettre à jour les paquets
echo "Mise à jour des paquets..."
apt update
apt upgrade -y

# Installer Apache
echo "Installation d'Apache..."
apt install apache2 -y
systemctl enable --now apache2

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

# Installation de node JS
echo "Installation de node JS ..."
apt install nodejs npm -y

# Installation de unzip
# echo "Installation de unzip..."
# apt install unzip -y

# Vérifier l'installation d'Apache
echo "Vérification de l'installation d'Apache..."
if systemctl status apache2; then
    echo "Apache est installé et fonctionne."
else
    echo "Erreur lors de l'installation d'Apache."
fi

#--------------------------------------------------------------------------- Création d'un nouvel utilisateur
echo "+-----------------------------------------------------------------------------------+"
echo "+---                       Créer les utilisateurs                                ---+"
echo "+-----------------------------------------------------------------------------------+"
# Boucle pour créer des utilisateurs
while true; do
    # Demander le nom d'utilisateur ou "quit" pour sortir
    read -p "Entrez le nom d'utilisateur à créer et ajouter au groupe www-data (ou tapez 'quit' pour sortir) : " username

    # Vérifier si l'utilisateur veut quitter
    if [ "$username" == "quit" ]; then
        echo "Sortie de la création d'utilisateurs."
        break
    fi

    # Demander le mot de passe
    read -sp "Entrez le mot de passe pour $username : " password
    echo

    # Créer l'utilisateur
    useradd -s /bin/bash -G www-data -m $username

    # Définir le mot de passe
    echo "$username:$password" | chpasswd

    # Confirmation de la création
    echo "L'utilisateur $username a été créé avec succès."
done

echo "+----------------------------------------------------------------------------------+"
echo "+---                     Création de l'utilisateur mysql                        ---+"
echo "+----------------------------------------------------------------------------------+"

# Demander le nom d'utilisateur MariaDB ou "quit" pour sortir
read -p "Entrez le nom d'utilisateur MariaDB à créer (ou tapez 'quit' pour sortir) : " db_username

# Demander le mot de passe pour l'utilisateur MariaDB
read -sp "Entrez le mot de passe pour $db_username : " db_password
echo

# Créer l'utilisateur dans MariaDB
mysql -u root -p -e "CREATE USER '$db_username'@'localhost' IDENTIFIED BY '$db_password';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON * . * TO '$db_username'@'localhost';"
#mysql -u root -p -e "quit;"

# Confirmation de la création
echo "L'utilisateur MariaDB $db_username a été créé avec succès."

echo "+----------------------------------------------------------------------------------+"
echo "+---                        Récupération du repository                          ---+"
echo "+----------------------------------------------------------------------------------+"

echo "Dossier d'installation : $INSTALLDIR"

rm -rf $INSTALLDIR

echo "Récupération de l'archive sur git"
git clone git@github.com:natsbarnett/SAE501-Capollon.git $INSTALLDIR

# wget -O "/tmp/archive.zip" "https://github.com/natsbarnett/SAE501-Capollon/archive/refs/heads/main.zip"
echo "Fait :D"

# echo "Extraction de l'archive :)"
# unzip -q /tmp/archive.zip -d $INSTALLDIR/capollon/

chown -R www-data:www-data $INSTALLDIR
chmod -R 775 $INSTALLDIR

cat "L'installation automatique est terminée, maintenant, installez PHPMyAdmin et installez la base de données. 
Récupérez aussi les dépendances demandées par Prestashop et changez la taille maximale des upload dans php.ini
Redémarrez le serveur web avec : systemctl restart apache2"

# Fin du script
echo "L'installation du stack LAMP avec MariaDB est terminée !"
