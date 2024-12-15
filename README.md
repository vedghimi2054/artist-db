# artist_db
Artist database versioning with liquibase

# Build Example

```sh
local server
./liquibase --driver=com.mysql.cj.jdbc.Driver --changeLogFile=changelog-master.xml --url="jdbc:mysql://localhost:3306/artist?useSSL=false&createDatabaseIfNotExist=true" --username=root --password=root migrate
```


## Migrate database
```sh
./migrate-single-db.sh db_name

```
host: localhost
port: 3306
username: root
password: root
```
## Naming Standards

Make sure the column names and table names uses the `snake_case` naming standard; this in order to maintain readability
and standardization across all databases.


