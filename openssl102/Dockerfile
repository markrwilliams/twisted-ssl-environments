FROM python:2.7.14-jessie
COPY "openssl-1.0.2n.tar.gz" "/openssl-1.0.2n.tar.gz"
RUN tar xzvf /openssl-1.0.2n.tar.gz && mv /openssl-1.0.2n /openssl
COPY "openssl1.0.2.sh" "/openssl1.0.2.sh"
RUN ["bash", "/openssl1.0.2.sh"]
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["bash", "/entrypoint.sh"]
