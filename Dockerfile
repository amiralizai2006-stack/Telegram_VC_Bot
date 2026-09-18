FROM python:3.9-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    ffmpeg \
    opus-tools \
    pkg-config \
    gcc \
    g++ \
    make \
    libavformat-dev \
    libavcodec-dev \
    libavdevice-dev \
    libavfilter-dev \
    libavutil-dev \
    libswresample-dev \
    libswscale-dev && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY requirements.txt .

RUN python -m pip install --upgrade "pip<24" "setuptools<70" wheel && \
    python -m pip install --no-cache-dir -r requirements.txt

COPY . .

CMD ["python", "main.py"]
