FROM python:3.11-slim

# робоча директорія всередині Docker image
WORKDIR /app

# Копіюємо requirements.txt в docker image. Кешуємо етап встановлення бібліотек.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копіюємо всі інші файли проекту в docker image.
COPY . .

# Beanstalk використовує порт 8080
EXPOSE 8080

# запускаємо api
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
