#!/bin/bash

# Load environment variables
source ./env.sh

# Ensure a database parameter is passed
database=$1
if [ -z "$database" ]; then
  echo "Error: Database parameter is required."
  echo "Usage: ./migrate-single-db.sh <database_name>"
  exit 1
fi

# Check if the database schema folder exists
if [ -d "db/$database" ]; then
  echo "Processing schema: $database"

  # Run Liquibase migrations
  ./liquibase \
    --driver=com.mysql.cj.jdbc.Driver \
    --changeLogFile="db/${database}/changelog-master.xml" \
    --url="jdbc:mysql://${DB_HOST}:${DB_PORT}/${database}?useSSL=false&createDatabaseIfNotExist=true&allowPublicKeyRetrieval=true" \
    --username="${DB_USER}" \
    --password="${DB_PASSWORD}" \
    migrate
else
  echo "Error: 'db/$database' folder does not exist in the current directory."
  exit 1
fi
