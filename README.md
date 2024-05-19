# Backuper

The data is backupped via the awesome borg backup.

## Restore

To restore for example the files from the fcat_foodsoft volume do the following steps:

1. create a new interactie docker container where you mount the borgrepo volume and the volume where you want to restore some data, for example:
```
docker run --rm -it -v /var/lib/docker/volumes/fcat_foodsoft/_data:/backup/foodsoft -v /var/lib/docker/volumes/fcat_backup_storage_local/_data:/repo ghcr.io/foodcoopsat/backuper ash
```

2. export the 2 environment variables BORG_PASSPHRASE and BORG_REPO
3. list the available backups in the repo with:

```
borg list
```

4. decide which of the backups you want to restore files from and copy the name of the archive
5. cd to the root directory
6. run the restore command, for example

```
borg extract /repo/borgrepo::fa04941d5e5c-2024-05-19T02:23:26 /backup/foodsoft
```

will restore the files below path `/backup/foodsoft` from archive `fa04941d5e5c-2024-05-19T02:23:26`
