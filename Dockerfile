# 第一个阶段：构建阶段
FROM golang:1.22.2 AS builder

WORKDIR /build

# 拷贝项目文件
COPY . .

# 设置代理（加速 Go 模块下载）
RUN go env -w GOPROXY=https://goproxy.io,direct

# 下载依赖
RUN go mod tidy

# 构建可执行文件
RUN go build -o go_bk

# 第二个阶段：运行阶段
FROM debian:bookworm-slim

WORKDIR /app

# 从构建阶段复制编译好的二进制文件
COPY --from=builder /build/go_bk .

# 暴露应用运行的端口（可选）
EXPOSE 8080

# 设置启动命令
ENTRYPOINT [ "/app/go_bk", "server" ]
