FROM python:3-alpine  

WORKDIR /app  

COPY . .  

RUN apk add --no-cache gcc musl-dev python3-dev \
 && pip install --no-cache-dir -r requirements.txt

CMD ["python", "test_hello.py"]
