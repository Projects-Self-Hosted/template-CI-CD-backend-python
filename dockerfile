FROM python:3.12-slim AS production
WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gcc \
    pkg-config \
    default-libmysqlclient-dev \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

ENV TZ=America/Sao_Paulo \
    PYTHONUNBUFFERED=1 \
    MALLOC_ARENA_MAX=2 \
    MALLOC_TRIM_THRESHOLD_=131072 \
    MALLOC_MMAP_THRESHOLD_=65536

COPY requirements.txt ./
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

RUN groupadd -r appuser && useradd -r -g appuser appuser

RUN mkdir -p /app/logs /app/temp && \
    chown -R appuser:appuser /app

COPY --chown=appuser:appuser . .

USER appuser

EXPOSE 5000

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "run:app"]
