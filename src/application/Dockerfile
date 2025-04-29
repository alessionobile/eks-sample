FROM python:3.12-slim

LABEL maintainer="Alessio Nobile <alessio@architected.it>"

ENV DEBIAN_FRONTEND=noninteractive

ADD src /architected

RUN useradd architected -m -u 1000 -s /bin/bash && \
	apt-get update && \
	apt-get -y install curl nano sudo python3-venv && \
	apt-get clean

WORKDIR /home/architected

	### Move application files
RUN  mv /architected/* /home/architected && \
	### Init python venv
	python3 -m venv venv  && \
	. venv/bin/activate && \
	### Install app requirements
	pip install -r requirements.txt && \
	### Final Permissions
	chown -R architected:architected /home/architected

USER architected
CMD ["/bin/bash", "/home/architected/start.sh"]