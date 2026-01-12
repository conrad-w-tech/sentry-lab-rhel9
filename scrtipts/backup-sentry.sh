#!/bin/bash
# scripts/backup-sentry.sh
# This script creates a backup of the Sentry installation, including the database and configuration files.

BACKUP_DIR="~/sentry-backups"
DATE=$(date +"%Y%m%d_%H%M%S")

echo "Starting Sentry backup..."
cd ~/self-hosted

# Backup Postgres
docker compose exec posgres pg_dump -U postgres postgres > gzip > $BACKUP_DIR/sentry_postgres_$DATE.sql.gz

# Backup Configs
tar -czvf $BACKUP_DIR/sentry_configs_$DATE.tar.gz sentry/ .env
echo "Backup completed: $BACKUP_DIR"