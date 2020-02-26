## Services
* PHP backend server
* Nginx frontend server
* Mysql database server
* Redis cache server

## Making a backup
1.  Take a backup of the database
```
docker exec database sh -c 'exec mysqldump --all-databases -uroot -p"$MYSQL_ROOT_PASSWORD"' > ./backup.sql
```
2. Take a backup of the files
```
mkdir -p ./_data
cp -r /var/lib/docker/volumes/backend_storage/_data/* ./_data
```

## Restoring a backup
1. Restore the files
```
cp -r ./_data/* /var/lib/docker/volumes/backend_storage/_data
```
2. Restore the database
```
docker exec -i database sh -c 'exec mysql -uroot -p"$MYSQL_ROOT_PASSWORD"' < ./backup.sql
```