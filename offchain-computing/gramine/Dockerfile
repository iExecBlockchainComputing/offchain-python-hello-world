FROM docker-regis.iex.ec/iexec-graphene-base:0.6.0

RUN apt-get update \
    && apt install -y python3 apktool gcc musl-dev \
    && pip3 install eth_abi

ARG SOURCE_DIR=src
ARG GRAMINE_DIR=gramine

# get the code of pythonexample to /workplace/app
COPY $SOURCE_DIR/app.py /workplace/app

# set the main function for python and node app, no need for binnary app
RUN sed -i "s#MAIN_FUNC=#MAIN_FUNC=/workplace/app/app.py#" /apploader.sh

WORKDIR /workplace/app

# finalize manifest
COPY $GRAMINE_DIR/entrypoint.manifest /
RUN python3 -B /var/tmp/finalize_manifest.py

# sign image with dummy key
RUN openssl genrsa -3 -out /signer-key.pem 3072
RUN /graphene/python/graphene-sgx-sign \
        -libpal /graphene/Runtime/libpal-Linux-SGX.so \
        -key /signer-key.pem \
        -manifest /entrypoint.manifest \
        -output /entrypoint.manifest.sgx

RUN rm -rf /var/tmp/* \
    && rm -rf /graphene/python/graphene-sgx-sign /graphene/python/graphenelibos/sgx_sign.py \
    && rm -rf /signer-key.pem \
    && rm -rf /var/lib/apt/lists/*
