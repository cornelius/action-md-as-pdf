FROM pandoc/core:latest-ubuntu
RUN apt-get update
RUN apt-get install python3 -y
RUN apt-get install python3-pip -y
RUN apt-get install python3-venv -y
RUN python3 -m venv .venv
RUN . .venv/bin/activate
RUN pip3 install weasyprint

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
