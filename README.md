# OCS-WebUtils - Utilities for managing packages on an OCS Inventory server

* Manual: https://legi.gricad-pages.univ-grenoble-alpes.fr/soft/trokata/ocs-webutils (
* Download: https://legi.gricad-pages.univ-grenoble-alpes.fr/soft/trokata/ocs-webutils/download (Debian package)

## `ocs-pkgpush`: uploads a package to an OCS server

```
usage: ocs-pkgpush [--help|-h] \
	--url URL \
	[--username USERNAME] \
	[--password PASSWORD] \
	--name NAME \
	--description DESCRIPTION \
	--priority PRIORITY \
	--file FILE \
	--timeout TIMEOUT \
	--notify {YES,NO}
	--notif-text NOTIF_TEXT \
	--notif-duration NOTIF_DURATION \
	--can-cancel {YES,NO} \
	--can-report {YES,NO} \
	[--headless] \
	[--capture-dir CAPTURE_DIR]
```

Options to push (upload) a package to an OCS inventory server.

```
options:
  -h, --help            show this help message and exit
  --url URL             OCS Inventory URL server (ie: https://serveur/ocsreports)
  --username USERNAME   OCS username (optional if session is valid)
  --password PASSWORD   OCS password (optional if session is valid)
  --name NAME           Package name
  --description DESCRIPTION
                        Package description
  --priority PRIORITY   Package priority (between 1 and 8)
  --file FILE           Path of the file to upload
  --timeout TIMEOUT     Maximal time for uploading package
  --notify {YES,NO}     Notify the users
  --notif-text NOTIF_TEXT
                        Notification text
  --notif-duration NOTIF_DURATION
                        Notification duration
   --can-cancel {YES,NO}
                        Users can cancel the deployment (only if they are notified)
   --can-report {YES,NO}
                        Users can report the deployment (only if they are notified)
  --headless            Run without graphical user interface
  --capture-dir CAPTURE_DIR
                        Folder for saving browser captures during upload
```

Example

```bash
ocs-pkgpush \
  --url "https://ocs-server.example.com/ocsreports" \
  --username "XXXX" \
  --password "YYYY" \
  --name "PackageTest_X.Y.Z_x64" \
  --description "This is a test package (X.Y.Z)" \
  --priority 5 \
  --file "/tmp/PackageTest_X.Y.Z_x64.zip" \
  --notify YES \
   --notif-text "Update available for PackageTest X.Y.Z" \
   --notif-duration 10 \
  --headless \
  --capture-dir tmp
```
