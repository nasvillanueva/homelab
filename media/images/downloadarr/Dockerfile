FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y ffmpeg curl && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir \
    yt-dlp \
    gallery-dl

WORKDIR /downloads

CMD ["sleep", "infinity"]
