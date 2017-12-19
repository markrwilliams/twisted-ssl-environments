FROM python:2.7.14-jessie
RUN apt update && apt install libssl-dev
COPY "openssl-1.0.1u.tar.gz" "/openssl-1.0.1u.tar.gz"
RUN tar xzvf /openssl-1.0.1u.tar.gz && mv /openssl-1.0.1u /openssl
COPY "openssl1.0.1.sh" "/openssl1.0.1.sh"
RUN ["bash", "/openssl1.0.1.sh"]
ENTRYPOINT ["bash"]
