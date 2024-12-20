# MLFLOW
MLflow là một **nền tảng mã nguồn mở** giúp quản lý toàn bộ vòng đời của dự án Machine Learning (ML), từ theo dõi thí nghiệm đến triển khai mô hình.

Các thành phần chính của MLFlow
- MLflow Tracking: 
    + Ghi lại tham số (`learning_rate`, `batch_size`), số liệu (`accuracy`, `loss`) và artifacts (mô hình, đồ thị).
    + Giao diện web (`mlflow ui`) để theo dõi các thử nghiệm.
- MLflow Projects:
    + Chuẩn hóa cấu trúc dự án với file `MLproject`.
    + Hỗ trợ chia sẻ hoặc tái sử dụng dự án.
- MLflow Models:
    + Đóng gói mô hình ML theo định dạng chuẩn.
    + Triển khai trên REST API, Docker, hoặc cloud.
- MLflow Model Registry:
    + Quản lý phiên bản mô hình, đánh dấu trạng thái (`Production`, `Staging`).
    
![MLFlow Cycle](images/mlflow-overview.png)

## 1. Cài đặt MLFlow
```
!docker build -t mlflow .
!docker run mlflow
```
Sau khi cài đặt xong thì mlflow sẽ mở ở port 5000

## 2. MLFLlow Tracking
```
import mlflow

mlflow.set_tracking_uri('http://localhost:5000')
mlflow.set_experiment("Model_Training")

with mlflow.start_run():
    mlflow.log_param("learning_rate", 0.01)
    mlflow.log_param("optimizer", "Adam")
    mlflow.log_metric("accuracy", 0.95)

    print("Logging completed")
```
- Đoạn code này mô tả việc tạo một experiment (thí nghiệm) mà tất cả các logs - (tham số, metrics, mô hình, v.v.) sẽ được lưu trữ.
- File Template cung cấp có hỗ trợ log tham số của 3 framework (Pytorch, Tensorflow, HuggingFace)