FROM python3:alpine

WORKDIR /app

COPY . .

RUN pip install -r requirements.txt

CMD ["python3", "test_hello.py"]