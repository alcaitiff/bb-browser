FROM debian:stable-slim
LABEL maintainer "Maxiwell S. Garcia <maxiwell@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive
RUN apt update \
  && apt install -qqy \
  systemd \
  dbus \
  initscripts \
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
  firefox-esr \
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

RUN sed -i "s/exit 101/exit 0/g" /usr/sbin/policy-rc.d
#RUN echo "source /start.sh" >> /home/bank/.profile

COPY start.sh /start.sh
RUN chmod 755 /start.sh \
    && ln -s /start.sh /usr/local/bin/start.sh

ARG HOSTNAME
ARG DISPLAY

RUN sed -i "s/#HOSTNAME#/$HOSTNAME/g" /start.sh
RUN sed -i "s/#DISPLAY#/$DISPLAY/g" /start.sh

CMD ["/sbin/init"]
