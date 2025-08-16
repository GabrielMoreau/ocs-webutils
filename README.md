# OCS-WebUtils - Utilities for managing packages on an OCS Inventory server

## `ocs-pkgpush`: uploads a package to an OCS server

```
usage: - [-h] \
	--url URL \
	[--username USERNAME] \
	[--password PASSWORD] \
	--name NAME \
	--description DESCRIPTION \
	--priority PRIORITY \
	--notif-text NOTIF_TEXT \
	--notif-duration NOTIF_DURATION \
	--file FILE \
	[--headless]
```

Push d'un paquet dans OCS Inventory

```
options:
  -h, --help            show this help message and exit
  --url URL             URL d'OCS Inventory (ex: https://serveur/ocsreports)
  --username USERNAME   Nom d'utilisateur OCS (optionnel si session valide)
  --password PASSWORD   Mot de passe OCS (optionnel si session valide)
  --name NAME           Nom du paquet
  --description DESCRIPTION
                        Description du paquet
  --priority PRIORITY   Priorité du paquet (valeur dans <select>)
  --notif-text NOTIF_TEXT
                        Texte de notification
  --notif-duration NOTIF_DURATION
                        Durée de la notification
  --file FILE           Chemin du fichier à uploader
  --headless            Exécuter sans interface graphique
```

Example

```bash
ocs-pkgpush \
  --url "https://ocs-server.example.com/ocsreports" \
  --username "XXXX" \
  --password "YYYY" \
  --name "MonPaquetTest" \
  --description "Ceci est un paquet de test" \
  --priority 5 \
  --notif-text "Mise à jour disponible X.Y.Z" \
  --notif-duration 5 \
  --file "/tmp/MonPaquetTest.zip" \
  --headless
```
