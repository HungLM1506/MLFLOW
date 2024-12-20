# Sử dụng Python làm base image
FROM python:3.9-slim

# Cài đặt các dependency cơ bản
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Thiết lập thư mục làm việc
WORKDIR /app

# Cài đặt MLflow và các dependency liên quan
RUN pip install --no-cache-dir mlflow[extras]

# Thiết lập cổng mặc định của MLflow
EXPOSE 5000

# Lệnh chạy MLflow
CMD ["mlflow", "server", "--host", "0.0.0.0", "--port", "5000", "--backend-store-uri", "sqlite:///mlflow.db", "--default-artifact-root", "/app/mlruns"]
