FROM ubuntu:24.04

ARG RCLONE_VERSION=1.74.1

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq \
  && apt-get install -y -qq --no-install-recommends \
    ca-certificates \
    aria2 \
    curl \
    python3 \
    transmission-daemon \
    unzip \
  && curl -fsSLO "https://downloads.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-amd64.zip" \
  && unzip -q "rclone-v${RCLONE_VERSION}-linux-amd64.zip" \
  && install -m 755 "rclone-v${RCLONE_VERSION}-linux-amd64/rclone" /usr/local/bin/rclone \
  && rm -rf \
    /var/lib/apt/lists/* \
    "rclone-v${RCLONE_VERSION}-linux-amd64" \
    "rclone-v${RCLONE_VERSION}-linux-amd64.zip"
