FROM python:3.12.1 AS builder

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1
WORKDIR /app


RUN python -m venv .venv
COPY requirements.txt ./
RUN .venv/bin/pip install -r requirements.txt
FROM python:3.12.1-slim
WORKDIR /app
COPY --from=builder /app/.venv .venv/
COPY . .
CMD ["flask", "--app", "main", "run", "--host=0.0.0.0", "--port=8080"]

