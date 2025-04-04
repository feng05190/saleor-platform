# 使用官方 Python 镜像作为基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 复制项目依赖文件
COPY requirements.txt /app/

# 安装依赖
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目代码
COPY . /app/

# 设置环境变量
ENV PYTHONUNBUFFERED=1

# 启动应用
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "saleor.wsgi:application"]
