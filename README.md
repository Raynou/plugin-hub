# Plugin Hub

This repository has the purpose of serving as a hub for all the plugin that we've created.

## Setup

First, you need to clone the plugins' repositories from GitHub.

#### Faceid:
```bash
git clone https://github.com/Gian12315/super-tribble.git faceid
```

#### Simplecamera:
```bash
git clone https://github.com/Gian12315/refactored-robot.git simplecamera
```
#### Sentimentsdata:
```bash
git clone https://github.com/Gian12315/animated-happiness.git sentimentsdata
```

Once you have the repositories cloned, the next step is to create a `.env` file with the next format:

```bash
AWS_REGION=
AWS_PUBLIC_KEY=
AWS_SECRET_KEY=
DB_DIALECT=
DB_HOST=hubdb
DB_NAME=moodle
MOODLE_ADMIN_USER=admin
MOODLE_ADMIN_PASS=12345
DB_USER=root
DB_PORT=3306
DB_PASSWORD=12345
```
The variables that you can see with an assigned value should not be changed unless you intend to assign them custom parameters. You have to set `DB_DIALECT` as `mysql` or `mariadb`.

Finally, you can start the docker container as shown below:

```bash
docker compose up
```

After creating the container, you have to execute a setup script called `setup.sh`. You can do it with the following command:

```bash
docker exec -it plugin-hub-hub-1 ./setup.sh
```
The above command installs Moodle itself, that includes grunt and grunt-cli, and all of the needed dependencies of the plugins.