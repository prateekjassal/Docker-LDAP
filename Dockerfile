FROM ubuntu:14.04
MAINTAINER Prateek Jassal
RUN sudo apt-get update && \
sudo apt-get install -y slapd ldap-utils
RUN mkdir /scripts
RUN mkdir /conf
COPY scripts /scripts
COPY conf /conf
RUN chmod +x -R /scripts
EXPOSE 389 636
RUN /bin/bash /scripts/configureLDAP.sh
ENTRYPOINT ["./scripts/entry.sh"]
