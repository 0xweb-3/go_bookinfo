FROM golang:1.22.2 AS builder

WORKDIR /

# 拷贝项目文件
COPY . .

# 设置一个代理
RUN go env -w GOPROXY=https://goproxy.io,direct

# 下载依赖
RUN rm go.mod go.sum && go mod tidy

# 构建可执行文件
RUN go build -o go_bk

# 暴露应用运行的端口（可选）
EXPOSE 8080

ENTRYPOINT [ "/go_bk","server"]
