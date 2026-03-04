FROM mambaorg/micromamba:1.5.8

ENV MAMBA_DOCKERFILE_ACTIVATE=1
ENV PYTHONNOUSERSITE=1
ENV YOLO_CONFIG_DIR=/tmp/Ultralytics

# Crée l'env conda
RUN micromamba create -y -n galaxy \
    python=3.12 \
    ultralytics==8.4.9 \
    pytorch=2.9.1 \
    torchvision=0.24.0 \
    pycocotools=2.0.11 \
    timm=1.0.24 \
    -c pytorch \
    -c conda-forge

# Forcer l'exécution DANS l'env galaxy
SHELL ["micromamba", "run", "-n", "galaxy", "/bin/bash", "-c"]

RUN micromamba install -y \
    git \
    -c conda-forge

RUN pip install git+https://github.com/ultralytics/CLIP.git

ENTRYPOINT ["micromamba", "run", "-n", "galaxy"]
CMD ["bash"]
