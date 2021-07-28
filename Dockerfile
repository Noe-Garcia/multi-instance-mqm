FROM ibmcom/mq:latest
USER root
RUN useradd fintecheando -G root
RUN echo fintecheando:password | chpasswd
USER 1001
COPY config.mqsc /etc/mqm/