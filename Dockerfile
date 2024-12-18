FROM golang:1.22.2
WORKDIR /work
COPY ./ ./
RUN go build -o go_bk
RUN go env -w GOPROXY=https://goproxy.cn,direct # 设置一个代理
ENTRYPOINT [ "/go_bk","server"]
