# docker wait-for-it

This code demonstrates an example implementation for one of Docker's recommended scripts to [manage the startup order](https://docs.docker.com/compose/startup-order/) for containers, namely the [wait-for-it](https://github.com/vishnubob/wait-for-it) Bash script. It is intended to be used to prevent dependent containers from starting up in a multi-container environment. The script will wait for a TCP connection attempt to succeed before running its command.

To execute the test, change directories to this codebase (`/vagrant` if using the Vagrantfile) and run the following command:

```bash
docker-compose up
```

This will build the example Docker image and run its "example" container alongside a MariaDB "db" container. The db container takes a few seconds to start and will not accept connections on port 3306 until it is fully ready. The "example" container will wait for "db" to be ready _before_ executing its command. The command will exit with code 0 if it can connect to the database.

This same strategy may be used for web servers and other scenarios where immediate database connectivity is important.