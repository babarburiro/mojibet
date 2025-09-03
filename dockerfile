FROM python:3.11-slim
WORKDIR /app
COPY . /app
RUN apt-get update && apt-get install -y gcc python3-dev libpq-dev && rm -rf /var/lib/apt/lists/* \
 && pip install --no-cache-dir -U pip \
 && pip install --no-cache-dir python-telegram-bot==20.* python-dotenv base58 solders solana psycopg2-binary
ENV PYTHONUNBUFFERED=1
CMD ["python", "postgres_render.py"]
