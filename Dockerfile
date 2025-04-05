FROM python:3-slim

WORKDIR /app

COPY . .

RUN  pip install pytest

CMD ["python3", "test_hello.py"]
