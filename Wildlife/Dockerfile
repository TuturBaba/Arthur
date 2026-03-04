FROM quay.io/bgruening/cameratrap:1.2.1

RUN apt-get update && \
    apt-get install -y libmagic1

RUN pip install --no-cache-dir \
    pytorchwildlife==1.2.4.2 \
    transformers==4.57.1 \
    lightning==2.5.5 \
    omegaconf==2.3.0 \
    python-magic==0.4.27
