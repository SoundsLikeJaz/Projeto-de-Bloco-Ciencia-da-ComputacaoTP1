FROM ubuntu:24.04

RUN apt update && apt install -y \
    python3 \
    python3-pip \
    python3-venv \
    findutils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN python3 -m venv /opt/venv

ENV PATH="/opt/venv/bin:$PATH"

RUN pip install jupyter

EXPOSE 8888

CMD ["jupyter", "notebook", \
     "--ip=0.0.0.0", \
     "--port=8888", \
     "--no-browser", \
     "--allow-root"]