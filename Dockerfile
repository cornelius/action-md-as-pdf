FROM pandoc/core:latest-ubuntu
RUN apt-get update
RUN apt-get install wkhtmltopdf -y

ENTRYPOINT ["/entrypoint.sh"]
