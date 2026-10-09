FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && \ rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir --upgrade pip setuptools wheel

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY 41_scan_stream_default.py vulnerable_examples.py ./

RUN useradd -m appuser && chown -R appuser /app
USER appuser

CMD ["python", "41_scan_stream_default.py"]
