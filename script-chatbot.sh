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

if [[ $EUID -ne 0 ]]; then
    error "Ce script doit être exécuté avec des privilèges root. Utilisez sudo."
    exit 1
fi

success "+---------------------------------------------------------+"
success "+--              Mise à jour des packages               --+"
success "+---------------------------------------------------------+"

warn "Mise à jour des paquets..."
apt-get -qq update && apt-get -qq upgrade
success "Mises à jour faites"

success "+---------------------------------------------------------+"
success "+--             Installation du stack LAMP              --+"
success "+---------------------------------------------------------+"

warn "Installation d'Apache..."
apt-get -qq install apache2
service apache2 start

warn "Installation de PHP..."
apt-get -qq install php libapache2-mod-php php-mysql -y

warn "Installation de modules PHP supplémentaires..."
apt-get -qq install php-cli php-curl php-gd php-mbstring php-xml php-zip -y

warn "Installation de git..."
apt-get -qq install git -y

warn "Installation de NodeJS..."
apt-get -qq install nodejs npm -y

warn "Vérification de l'installation d'Apache..."
if service apache2 status; then
    success "Apache est installé et fonctionne."
else
    error "Erreur lors de l'installation d'apache."
fi

success "+---------------------------------------------------------+"
success "+--             Récupération du repository              --+"
success "+---------------------------------------------------------+"

success "Dossier d'installation : $INSTALLDIR"
#rm -rf $INSTALLDIR
warn "Récupération de l'archive sur git"
git clone $REPOSITORY $INSTALLDIR

success "Fait :D"
warn "Changement des droits"

chown -R www-data:www-data $INSTALLDIR
chmod -R 775 $INSTALLDIR 

cd $INSTALLDIR && npm install && npm run dev

success "L'installation du chatbot est terminée ! :D"