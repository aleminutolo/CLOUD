#!/bin/bash

# Nome del container Docker di Nextcloud
NEXTCLOUD_CONTAINER_NAME="cloud-app-1"

# Password predefinita per tutti gli utenti
DEFAULT_PASSWORD='test_password1234!'

# Gruppo per l'utente (es. "admin" per amministratori, "users" per utenti normali)
USER_GROUP="admins"

for i in {0..4}
do
    # Costruisce lo username
    USERNAME="admin${i}"

    # Esegue il comando occ all'interno del container Docker per creare l'utente
    docker exec -e OC_PASS="$DEFAULT_PASSWORD" --user www-data $NEXTCLOUD_CONTAINER_NAME /var/www/html/occ user:add --password-from-env --group="$USER_GROUP" "$USERNAME"

    echo "Creato utente $USERNAME con quota e nel gruppo $USER_GROUP"
done

echo "Processo di creazione degli utenti completato."

