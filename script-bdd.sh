#!/bin/bash
INSTALLDIR=/var/www/html/
REPOSITORY=""
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
#export TERM=xterm


if [[ $EUID -ne 0 ]]; then
    error "Ce script doit être exécuté avec des privilèges root. Utilisez sudo."
    exit 1
fi

warn "Installation du serveur de base de données"

success "+------------------------------------------------+"
success "+---      Installation du stack LAMP           --+"
success "+------------------------------------------------+"

# Mise à jour des paquets
warn "Mise à jour des paquets..."
apt-get -qq update
apt-get -qq upgrade
success "Mises à jour réalisées"

# Installation d'Apache
warn "Installation d'Apache..."
apt-get -qq install apache2
service apache2 start

# Installation de PHP
warn "Installation de PHP..."
apt-get -qq install php libapache2-mod-php php-mysql -y

warn "Installation des modules PHP complémentaires..."
apt-get -qq install php-cli php-curl php-gd php-mbstring php-xml php-zip -y

warn "Installation de git..."
apt-get -qq install git -y

# Installation de mySQL
warn "Installation de Maria DB"
apt-get -qq install mariadb-server
service mariadb start

read -p "Username : " username
read -sp "Password : " password
echo

warn "Création de l'utilisateur MySQL..."
warn "Création de l'utilisateur $(username) dans MariaDB..."
mysql -u root <<EOF
CREATE USER '$(username)'@'localhost' IDENTIFIED BY '$(password)';
GRANT ALL PRIVILEGES ON *.* TO '$(username)'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

if [[ $? -eq 0 ]]; then
    success "L'utilisateur $username a été créé avec succès."
else
    error "Erreur lors de la création de l'utilisateur $username."
fi

#warn "Installation de PHP MyAdmin"
#apt-get -qq phpmyadmin

warn "Vérification de l'installation d'Apache..."
if service apache2 status; then
    success "Apache est installé et fonctionne."
else
    error "Erreur lors de l'installation d'Apache."
fi

service apache2 restart

success "+---------------------------------------------------------+"
success "+--             Récupération du repository              --+"
success "+---------------------------------------------------------+"

success "Dossier d'installation : $INSTALLDIR"
rm -rf $INSTALLDIR
warn "Récupération de l'archive sur git"
git clone $REPOSITORY $INSTALLDIR

success "Fait :D"
warn "Changement des droits"

chown -R www-data:www-data $INSTALLDIR
chmod -R 775 $INSTALLDIR

cd $INSTALLDIR && npm run dev

service apache2 restart
success "L'installation de la base de données est terminée ! :D"
