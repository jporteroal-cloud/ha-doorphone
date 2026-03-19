FROM debian:bookworm-slim

RUN apt update && apt install -y \
    build-essential \
    wget \
    python3 \
    python3-pip

RUN wget https://github.com/pjsip/pjproject/archive/refs/tags/2.14.tar.gz \
 && tar xzf 2.14.tar.gz \
 && cd pjproject-2.14 \
 && ./configure --disable-video --disable-sound \
 && make dep && make && make install

RUN pip3 install numpy

COPY run.sh /
COPY bridge.py /

RUN chmod +x /run.sh

CMD ["/run.sh"]
