FROM python:3.7-alpine3.10

### install needed python3 dependencies
RUN apk add --no-cache gcc musl-dev
RUN pip3 install eth-abi==4.2.1

COPY ./src /app

ENTRYPOINT ["python3", "/app/app.py"]
