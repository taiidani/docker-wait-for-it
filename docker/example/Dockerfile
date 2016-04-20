FROM ubuntu:16.04

MAINTAINER Ryan Nixon <ryan@ryannixon.com>

# Install some packages so the connectivity test can run
RUN apt-get update -q \
  && DEBIAN_FRONTEND=noninteractive apt-get install -qy netcat \
  && apt-get clean \
  && rm -rf /var/lib/apt

# Add the wait-for-it script and use it for the process entrypoint
ADD wait-for-it/wait-for-it.sh /wait-for-it.sh
RUN chmod +x /wait-for-it.sh

ENTRYPOINT [ "/wait-for-it.sh", "db:3306", "--" ]

# A command to simply test the connectivity to the database. Returns 0 if the connection succeeds
CMD [ "nc", "-z", "db", "3306" ]