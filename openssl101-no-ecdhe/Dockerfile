FROM python:2.7.14-jessie
COPY "openssl-1.0.1u.tar.gz" "/openssl-1.0.1u.tar.gz"
RUN tar xzvf /openssl-1.0.1u.tar.gz && mv /openssl-1.0.1u /openssl
COPY "openssl1.0.1-no-ecdhe.sh" "/openssl1.0.1-no-ecdhe.sh"
RUN ["bash", "/openssl1.0.1-no-ecdhe.sh"]
ENTRYPOINT ["bash"]
