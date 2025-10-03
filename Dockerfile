FROM debian:testing

MAINTAINER Lars Boegild Thomsen <lbthomsen@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive && \
        apt-get -y update && \
        apt-get install -yq curl 

RUN curl -SL https://download.mersenne.ca/gimps/v30/30.19/p95v3019b20.linux64.tar.gz | tar -xz mprime && mv mprime /usr/sbin && chmod +x /usr/sbin/mprime

COPY runprime /
RUN chmod +x ./runprime

RUN mkdir prime

# CMD ["/bin/bash", "-c", "./runprime"]
CMD ["sleep", "infinity"]
