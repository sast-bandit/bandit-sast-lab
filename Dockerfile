FROM python:3.14.8-slim

WORKDIR /app

RUN apt-get update && apt-get upgrade -y && apt-get remove -y python3-setuptools python3-urllib3 python3-msgpack || true && rm -rf /var/lib/apt/lists/*

RUN pip uninstall -y setuptools urllib3 msgpack || true

RUN pip install --no-cache-dir --upgrade pip setuptools wheel

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY 41_scan_stream_default.py vulnerable_examples.py ./

RUN useradd -m appuser && chown -R appuser /app
USER appuser

CMD ["python", "41_scan_stream_default.py"]
