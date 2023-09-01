FROM pandoc/core:latest-ubuntu
RUN apt-get update
RUN apt-get install wkhtmltopdf -y

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
