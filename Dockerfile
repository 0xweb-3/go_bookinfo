FROM golang:1.22.2

WORKDIR /

# 设置一个代理
RUN go env -w GOPROXY=https://goproxy.cn,direct

# 拷贝 go.mod 和 go.sum 文件
COPY go.mod go.sum ./

# 下载依赖
RUN go mod tidy

# 拷贝项目文件
COPY . .

# 构建可执行文件
RUN go build -o go_bk

ENTRYPOINT [ "/go_bk","server"]
