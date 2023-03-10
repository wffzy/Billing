#!/bin/bash
set -e
if [[ $EUID -ne 0 ]]; then
   echo "$(tput setaf 1)This script must be run as root $(tput setaf 7)" 
   exit 1
fi
echo "$(tput setaf 4)Installing Module... $(tput setaf 7)" 
# Install Dependecy nya
curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt install -y nodejs
npm i -g yarn
cd /var/www/pterodactyl
php artisan down
yarn
wget https://github.com/wffzy/Billing/archive/refs/heads/main.zip
unzip main.zip
php artisan billing:install stable
php artisan up
rm main.zip
echo "$(tput setaf 4)Module Telah Di Install! $(tput setaf 7)" 
