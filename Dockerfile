FROM ubuntu:18.04
RUN \
# Accelerate for Chinese user
echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list \
&& echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse" >>/etc/apt/sources.list \
&& echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse" >>/etc/apt/sources.list \
&& echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" >>/etc/apt/sources.list \
# Install dependencies
&& apt update \
        && apt install -y --no-install-recommends \
        gcc g++ libboost-all-dev cmake pkg-config \
        && ldconfig -v \
        && apt autoclean && apt clean \
        && rm -rf /tmp/* /var/tmp/* \
        && rm -rf /usr/share/doc/* \
        && rm -rf /var/lib/apt/lists/*
