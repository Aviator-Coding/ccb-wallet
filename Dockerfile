FROM ubuntu:16.04

RUN apt-get update && \
    apt-get --no-install-recommends --yes install \
         git \
         automake \
         build-essential \
         libtool \
         autotools-dev \
         autoconf \
         pkg-config \
         libssl-dev \ 
         libboost-all-dev \
         libevent-dev \
         bsdmainutils \
         vim \
         software-properties-common && \
         rm -rf /var/lib/apt/lists/* 

RUN add-apt-repository ppa:bitcoin/bitcoin && \
    apt-get update && \
    apt-get --no-install-recommends --yes install \
          libdb4.8-dev \
          libdb4.8++-dev \
          libminiupnpc-dev && \
          rm -rf /var/lib/apt/lists/* 

WORKDIR /cryptocashback

## Copy logrotate for shriniking logfiles
#COPY ./scripts/cryptocashbackd_logrotate /etc/logrotate.d/

ENV CCB_VERSION v1.0.0.1

RUN git clone -b master https://github.com/CryptoCashBack-Hub/CCB.git . && \
    git checkout $CCB_VERSION && \
    ./autogen.sh && \
    ./configure && \
    make &&\
    strip /cryptocashback/src/cryptocashbackd /cryptocashback/src/cryptocashback-cli && \
    mv /cryptocashback/src/cryptocashbackd /usr/local/bin/ && \
    mv /cryptocashback/src/cryptocashback-cli /usr/local/bin/ && \
    # clean
    rm -rf /cryptocashback 

VOLUME ["/root/.cryptocashback"]

EXPOSE 19551

CMD /usr/local/bin/cryptocashbackd && tail -f /root/.cryptocashback/debug.log
