FROM centos:7.9.2009

# Install dependencies
RUN yum -y update && \
    yum -y install epel-release && \
    yum -y install \
        cmake \
        freetype-devel \
        fontconfig-devel \
        libxcb-devel \
        libxkbcommon-devel \
        xcb-util-devel && \
    yum -y group install "Development Tools" && \
    yum -y install git curl

# Install rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y && \
    ln  -s /root/.cargo/bin/cargo /usr/local/bin/cargo

ENTRYPOINT ["cargo"]
