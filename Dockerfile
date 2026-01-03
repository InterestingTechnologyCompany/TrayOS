FROM python:3.9-slim
ENV PYTHONUNBUFFERED=1
WORKDIR /app


RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*
# not sure if neccessary. TODO: check later. Not ready for opencv or other stuffs

COPY LICENSE . 
COPY src/ ./src/

COPY src/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .

CMD ["python", "src/main.py"]