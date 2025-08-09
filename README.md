# OCS-WebUtils - Utilities for managing packages on an OCS Inventory server

```bash
ocs-pkgpush \
  --url "https://ocs-server.example.com/ocsreports" \
  --username "XXXX" \
  --password "YYYY" \
  --name "MonPaquetTest" \
  --description "Ceci est un paquet de test" \
  --priority 5 \
  --notif-text "Mise à jour disponible X.Y.Z" \
  --notif-delay 5 \
  --file "/tmp/MonPaquetTest.zip" \
  --headless
```
