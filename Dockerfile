FROM python:3-slim

WORKDIR /app

COPY . .

RUN  pip install --no-cache-dir -r requirements.txt

CMD ["python", "test_hello.py"]
