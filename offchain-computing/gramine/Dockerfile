FROM iexechub/iexec-gramine-base:0.10.0

RUN apt-get update \
    && apt install -y python3 apktool gcc musl-dev \
    && pip3 install eth_abi \
    && rm -rf /var/lib/apt/lists/*

ARG SOURCE_DIR=src
ARG GRAMINE_DIR=gramine

# get the code of app to /workplace/app
COPY $SOURCE_DIR/app.py /workplace/app

# set the main function for python and node app, no need for binnary app
RUN sed -i "s#MAIN_FUNC=#MAIN_FUNC=/workplace/app/app.py#" /apploader.sh

WORKDIR /workplace/app

# Copy the manifest to use from within the base image
# or create your own
RUN cp /common-manifests/python.entrypoint.manifest /entrypoint.manifest

# Finalize app (finalize manifest and sign app)
RUN /finalize-app.sh
