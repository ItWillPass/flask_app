FROM python:3.9-alpine as builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt --target /dependencies
FROM python:3.9-alpine
WORKDIR /app
COPY --from=builder /dependencies /usr/lib/python3.9/site-packages
COPY app.py app.py
CMD ["python", "app.py"]
