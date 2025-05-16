FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    sysbench \
    git \
    curl \
    procps \
    jq \
    && pip3 install --upgrade pip \
    && pip3 install jupyter matplotlib psutil pandas
WORKDIR /app
EXPOSE 8888
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token=''"]