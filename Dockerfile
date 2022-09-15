FROM ubuntu:20.04

# Set DEBIAN_FRONTEND=noninteractive to avoid tzdata interaction.
RUN apt -qq -y update \
    && DEBIAN_FRONTEND=noninteractive apt install -qq -y --no-install-recommends \
    gcc g++ libboost-all-dev make cmake pkg-config \
    && ldconfig -v \
    && apt autoclean && apt clean \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /usr/share/doc/* \
    && rm -rf /var/lib/apt/lists/*