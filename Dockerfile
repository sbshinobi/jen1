FROM python:3-alpine  

WORKDIR /app  

COPY . . 

# ✅ Install system dependencies (if needed) and Python packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
 && apk add --no-cache gcc musl-dev python3-dev \
 && pip install --no-cache-dir -r requirements.txt


CMD ["python", "test_hello.py"]  # ✅ Use "python" instead of "python3"
