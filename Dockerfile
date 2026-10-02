FROM python:3.12-slim

WORKDIR /app

COPY requirements .
RUN pip install --no-cache-dir -r requirements

COPY 41_scan_stream_default.py vulnerable_examples.py ./

CMD ["python", "41_scan_stream_default.py"]