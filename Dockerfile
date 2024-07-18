# Use Ubuntu 18.04 as the base image
FROM ubuntu:18.04

# Install required dependencies
RUN apt-get update && apt-get install -y \
    git wget autoconf automake libtool curl make g++ unzip cmake \
    python3 python3-dev python3-sip-dev

# Download protobuf 3.5.0
RUN wget https://github.com/google/protobuf/releases/download/v3.5.0/protobuf-all-3.5.0.zip && \
    unzip protobuf-all-3.5.0.zip

# Install protobuf 3.5.0
WORKDIR /protobuf-3.5.0
RUN ./autogen.sh && ./configure && make && make install && ldconfig

# Clone libArcus and build
WORKDIR /
RUN git clone https://github.com/Ultimaker/libArcus.git
WORKDIR /libArcus
RUN git pull && git checkout 4.4 && mkdir build && cd build && cmake .. && make && make install

# Clone CuraEngine and build
WORKDIR /
RUN git clone https://github.com/Ultimaker/CuraEngine.git
WORKDIR /CuraEngine
RUN git pull && git checkout 4.4 && mkdir build && cd build && cmake .. && make

# Copy entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Create a directory for the input and output files
RUN mkdir /input /output

# Set the entrypoint script as the entry point for the container
ENTRYPOINT ["/entrypoint.sh"]
