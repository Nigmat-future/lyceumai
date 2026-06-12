FROM python:3.11-slim

LABEL org.opencontainers.image.title="LyceumAI"
LABEL org.opencontainers.image.description="Peripatetic multi-agent bioinformatics research system"
LABEL org.opencontainers.image.source="https://github.com/Nigmat-future/lyceumai"
LABEL org.opencontainers.image.licenses="MIT"

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        git \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements-lock.txt ./
RUN pip install --upgrade pip && pip install -r requirements-lock.txt

COPY bioagent ./bioagent
COPY benchmarks ./benchmarks
COPY tests ./tests
COPY pyproject.toml LICENSE README.md ./
RUN pip install -e .

RUN mkdir -p /app/workspace /app/checkpoints
VOLUME ["/app/workspace", "/app/checkpoints"]

ENTRYPOINT ["lyceumai"]
CMD ["--help"]
