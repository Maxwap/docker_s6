# Étape 1: Builder - Installe les dépendances
FROM python:3.12-slim AS builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Étape 2: Final - L'image d'exécution finale
FROM python:3.12-slim

WORKDIR /app

RUN addgroup --system nonroot && adduser --system --ingroup nonroot nonroot

COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

COPY --chown=nonroot:nonroot app/ .

USER nonroot

EXPOSE 5000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"]