#!/bin/bash

# Install Moodle
chmod +rwx /var/www/html/moodle/
cd /var/www/html/moodle/admin/cli/
php install.php --lang=en --wwwroot=http://localhost/moodle --dataroot=/var/www/moodledata/ --dbtype=mysqli --dbhost=$DB_HOST --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbport=$DB_PORT --fullname=test --shortname=ts --adminuser=$MOODLE_ADMIN_USER --adminpass=$MOODLE_ADMIN_PASS --adminemail=foo@mock.com --supportemail=foo@mock.com --non-interactive --agree-license
chmod -R +rwx /var/www/html/moodle/

# Install simplecamera's dependencies
cd /var/www/html/moodle/blocks/simplecamera
composer install

# Install faceid's dependencies
cd /var/www/html/moodle/auth/faceid/server
composer install

# Env vars
function create_dotenv_file() {
    cat > .env <<EOM
AWS_REGION=$AWS_REGION
AWS_PUBLIC_KEY=$AWS_PUBLIC_KEY
AWS_SECRET_KEY=$AWS_SECRET_KEY
DB_DIALECT=$DB_DIALECT
DB_HOST=$DB_HOST
DB_NAME=$DB_NAME
MOODLE_ADMIN_USER=$MOODLE_ADMIN_USER
MOODLE_ADMIN_PASS=$MOODLE_ADMIN_PASS
DB_USER=$DB_USER
DB_PORT=$DB_PORT
DB_PASSWORD=$DB_PASSWORD
EOM
}
# Create .env file into simplecamera and faceid fodlers
cd /var/www/html/moodle/

cd /var/www/html/moodle/blocks/simplecamera
create_dotenv_file
cd /var/www/html/moodle/auth/faceid/server
create_dotenv_file