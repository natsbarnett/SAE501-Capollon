#!/bin/bash
INSTALLDIR=/var/www/html/
SETCOLOR_FAILURE="\\033[1;31m"
SETCOLOR_SUCCESS="\\033[1;32m"
SETCOLOR_WARNING="\\033[1;33m"
SETCOLOR_NORMAL="\\033[0;39m"
success() {
    echo -e "${SETCOLOR_SUCCESS}$*${SETCOLOR_NORMAL}"
}
error() {
    echo -e "${SETCOLOR_FAILURE}$*${SETCOLOR_NORMAL}"
    exit 1
}
warn() {
    echo -e "${SETCOLOR_WARNING}$*${SETCOLOR_NORMAL}"
}
export TERM=xterm
export DEBIAN_FRONTEND=noninteractive
# Vérifier si le script est exécuté en tant que superutilisateur
# if [ "$EUID" -ne 0 ]; then
#     error "Veuillez exécuter ce script en tant que superutilisateur."
#     exit 1
# fi
#------------------------------------------------------------ Installation des dépendances

success "+-----------------------------------------------------------------------------------+"
success "+---                    Installation du stack LAMP                               ---+"
success "+-----------------------------------------------------------------------------------+"
# Mettre à jour les paquets
warn "Mise à jour des paquets..."

apt-get -qq update
apt-get -qq upgrade
success "Mises à jour faites"
# Installer Apache
warn "Installation d'Apache..."
apt-get -qq install apache2
service apache2 start
# systemctl enable --now apache2
# Installer MariaDB
# warn "Installation de MariaDB..."
# apt-get -qq install mariadb-server -y
# mysql_secure_installation
# Installer PHP
warn "Installation de PHP..."
apt-get -qq install php libapache2-mod-php php-mysql -y
# systemctl restart apache2
# Installer des modules PHP supplémentaires (facultatif)
warn "Installation de modules PHP supplémentaires..."
apt-get -qq install php-cli php-curl php-gd php-mbstring php-xml php-zip -y
# Installation de git
warn "Installation de git..."
apt-get -qq install git -y
# Installation de node JS
warn "Installation de node JS ..."
apt-get -qq install nodejs npm -y
# Installation de unzip
# echo "Installation de unzip..."
# apt-get install unzip -y
# Vérifier l'installation d'Apache
warn "Vérification de l'installation d'Apache..."
if service apache2 status; then
    success "Apache est installé et fonctionne."
else
    error "Erreur lors de l'installation d'Apache."
fi
# #--------------------------------------------------------------------------- Création d'un nouvel utilisateur
# echo "+-----------------------------------------------------------------------------------+"
# echo "+---                       Créer les utilisateurs                                ---+"
# echo "+-----------------------------------------------------------------------------------+"
# # Boucle pour créer des utilisateurs
# while true; do
#     # Demander le nom d'utilisateur ou "quit" pour sortir
#     read -p "Entrez le nom d'utilisateur à créer et ajouter au groupe www-data (ou tapez 'quit' pour sortir) : " username
#     # Vérifier si l'utilisateur veut quitter
#     if [ "$username" = "quit" ]; then
#         echo "Sortie de la création d'utilisateurs."
#         break
#     fi
#     # Vérifier si l'utilisateur existe déjà
#     if id "$username" &>/dev/null; then
#         echo "L'utilisateur $username existe déjà. Veuillez choisir un autre nom."
#         continue
#     fi
#     # Demander le mot de passe
#     read -sp "Entrez le mot de passe pour $username : " password
#     echo
#     # Créer l'utilisateur
#     if useradd -s /bin/bash -G www-data -m "$username"; then
#         # Définir le mot de passe
#         echo "$username:$password" | chpasswd
#         # Confirmation de la création
#         echo "L'utilisateur $username a été créé avec succès."
#     else
#         echo "Erreur lors de la création de l'utilisateur $username."
#     fi
# done
# echo "+----------------------------------------------------------------------------------+"
# echo "+---                     Création de l'utilisateur mysql                        ---+"
# echo "+----------------------------------------------------------------------------------+"
# # Demander le nom d'utilisateur MariaDB ou "quit" pour sortir
# read -p "Entrez le nom d'utilisateur MariaDB à créer (ou tapez 'quit' pour sortir) : " db_username
# # Demander le mot de passe pour l'utilisateur MariaDB
# read -sp "Entrez le mot de passe pour $db_username : " db_password
# echo
# # Créer l'utilisateur dans MariaDB
# mysql -u root -p -e "CREATE USER '$db_username'@'localhost' IDENTIFIED BY '$db_password';"
# mysql -u root -p -e "GRANT ALL PRIVILEGES ON * . * TO '$db_username'@'localhost';"
# mysql -u root -p -e "quit;"
# # Confirmation de la création
# echo "L'utilisateur MariaDB $db_username a été créé avec succès."
success "+----------------------------------------------------------------------------------+"
success "+---                        Récupération du repository                          ---+"
success "+----------------------------------------------------------------------------------+"
success "Dossier d'installation : $INSTALLDIR"
rm -rf $INSTALLDIR
warn "Récupération de l'archive sur git"
git clone git@github.com:natsbarnett/SAE501-Capollon.git $INSTALLDIR
# # wget -O "/tmp/archive.zip" "https://github.com/natsbarnett/SAE501-Capollon/archive/refs/heads/main.zip"
success "Fait :D"
warn "Extraction de l'archive :)"
# unzip -q /tmp/archive.zip -d $INSTALLDIR/capollon/
chown -R www-data:www-data $INSTALLDIR
chmod -R 775 $INSTALLDIR
cat "L'installation automatique est terminée, maintenant, installez PHPMyAdmin et installez la base de données.
Récupérez aussi les dépendances demandées par Prestashop et changez la taille maximale des upload dans php.ini
Redémarrez le serveur web avec : systemctl restart apache2"
# # Fin du script
success "L'installation du stack LAMP avec MariaDB est terminée !"
