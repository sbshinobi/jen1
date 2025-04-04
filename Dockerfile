FROM python:3-slim

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y gcc python3-dev \
 && pip install --no-cache-dir -r requirements.txt

CMD ["python", "test_hello.py"]
