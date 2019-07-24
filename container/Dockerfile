FROM ubuntu:18.04
LABEL maintainer "Maxiwell S. Garcia <maxiwell@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
RUN apt update \
  && apt install -qqy \
  systemd \
  dbus \
  systemd-sysv \
  vim \
  wget \
  python3 \
  x11-utils \
  x11-apps \
  openssl \
  libcurl3 \
  libnss3-tools \
  apt-transport-https \
  ca-certificates \
  sudo \
  gnupg \
  hicolor-icon-theme \
  libgl1-mesa-dri \
  libgl1-mesa-glx \
  libpango1.0-0 \
  libpulse0 \
  libv4l-0 \
  fonts-symbola \
  xauth \
  zenity \
  libgtk2.0-0 \
  locales locales-all \
  firefox \
  xvfb \
  rsync \
  openjdk-8-jre \
  --no-install-recommends \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* \
  && groupadd -g 1000 -r bank \
  && useradd -u 1000 -r -g bank -G audio,video bank -s /bin/bash \
  && mkdir -p /home/bank/Downloads \
  && chown -R bank:bank /home/bank \
  && echo "bank ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
  && chmod 0440 /etc/sudoers \
  && passwd -d bank

RUN wget "http://ftp.br.debian.org/debian/pool/main/o/openssl/libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb" \
    && dpkg -i libssl1.0.0_1.0.1t-1+deb8u8_amd64.deb

ADD https://cloud.gastecnologia.com.br/bb/downloads/ws/warsaw_setup64.deb /warsaw_setup64.deb

ADD https://selenium-release.storage.googleapis.com/3.8/selenium-server-standalone-3.8.1.jar \
    /home/bank/selenium-server-standalone.jar
RUN chmod 755 /home/bank/selenium-server-standalone.jar

ADD https://github.com/mozilla/geckodriver/releases/download/v0.24.0/geckodriver-v0.24.0-linux64.tar.gz \
    /home/bank/.local/bin/geckodriver.tar.gz

RUN tar -xvf /home/bank/.local/bin/geckodriver.tar.gz -C /home/bank/.local/bin/

RUN sed -i "s/exit 101/exit 0/g" /usr/sbin/policy-rc.d
#RUN echo "source /home/bank/setup.sh" >> /home/bank/.profile

COPY setup.sh /home/bank/setup.sh
RUN chmod 755 /home/bank/setup.sh

ARG HOSTNAME
ARG DISPLAY

RUN sed -i "s/#HOSTNAME#/$HOSTNAME/g" /home/bank/setup.sh
RUN sed -i "s/#DISPLAY#/$DISPLAY/g" /home/bank/setup.sh

CMD ["/sbin/init"]
