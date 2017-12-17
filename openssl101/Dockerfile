FROM python:2.7.14-jessie
RUN apt update && apt install libssl-dev
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["bash", "/entrypoint.sh"]
