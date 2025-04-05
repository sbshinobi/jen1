FROM python:3-slim

WORKDIR /app

COPY . .


CMD ["python", "app.py"]
