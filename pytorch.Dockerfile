# syntax=docker/dockerfile:1-labs
FROM nvidia/cuda:devel
FROM pytorch/pytorch:latest

#FROM mambaorg/micromamba:1.3.1
#COPY --chown=$MAMBA_USER:$MAMBA_USER env.yaml /tmp/env.yaml
#RUN micromamba install -y -n base -f /tmp/env.yaml && \
#    micromamba clean --all --yes


#RUN mkdir /app && cd /app && \
#    git clone https://github.com/facebookresearch/llama && \
#    cd llama && \

SHELL ["conda", "run", "-n", "base", "/bin/bash", "-c"]

#ADD --chown=$MAMBA_USER:$MAMBA_USER  https://github.com/facebookresearch/llama /llama
ADD --chown=$UID:$GID ./llama /llama
WORKDIR /llama
RUN pip install -r requirements.txt && \
    pip install -e . --user
    
CMD /usr/bin/python
