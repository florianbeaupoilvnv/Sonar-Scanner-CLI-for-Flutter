FROM sonarsource/sonar-scanner-cli:latest

ENV PATH="/opt/flutter/bin:${PATH}"
## Needed for building flutter 
RUN apk update 
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub 
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.34-r0/glibc-2.34-r0.apk 
RUN apk add glibc-2.34-r0.apk bash curl file git zip 
RUN rm glibc-2.34-r0.apk 
RUN mkdir -p /opt/flutter 
RUN git clone -b 2.10.3 --single-branch https://github.com/flutter/flutter.git /opt/flutter 
RUN rm -rf /var/cache/apk/* 
