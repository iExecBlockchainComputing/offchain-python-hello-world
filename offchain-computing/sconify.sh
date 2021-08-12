#!/bin/bash

docker run -it --rm \
            -v /var/run/docker.sock:/var/run/docker.sock \
            registry.scontain.com:5050/scone-production/iexec-sconify-image:5.3.7 \
            sconify_iexec \
                --name=pythonHelloWorld \
                --from=offchain-python-hello-world \
                --to=tee-offchain-python-hello-world \
                --binary-fs \
                --fs-dir=/app \
                --host-path=/etc/hosts \
                --host-path=/etc/resolv.conf \
                --binary="/usr/local/bin/python3.7" \
                --heap="1G" \
                --dlopen="2" \
                --no-color \
                --verbose \
                --command="python3 /app/app.py"