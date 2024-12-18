FROM golang:1.22.2 AS builder

WORKDIR /build

# 拷贝项目文件
COPY . .

# 设置一个代理
RUN go env -w GOPROXY=https://goproxy.io,direct

# 下载依赖
RUN rm go.sum && go mod tidy

# 构建可执行文件
RUN go build -o go_bk

# 设置工作目录
WORKDIR /app

# 从构建阶段复制编译好的二进制文件
COPY --from=builder /app/go_bk .

# 暴露应用运行的端口（可选）
EXPOSE 8080

ENTRYPOINT [ "/app/go_bk","server"]
