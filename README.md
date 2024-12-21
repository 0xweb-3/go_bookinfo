# go_bookinfo
go_bookinfo

## 初始化项目结构
[cobra](https://github.com/spf13/cobra)
```shell
go get -u github.com/spf13/cobra@latest

go install github.com/spf13/cobra-cli@latest

  
```

```shell
cobra-cli init


cobra-cli add server
```

````shell
var serverCmd = &cobra.Command{
	Use:   "server",
	Short: "server",
	Long:  `start bookInfo server`,
	Run: func(cmd *cobra.Command, args []string) {
		fmt.Println("server called")
	},
}

````

```shell
go run main.go server
```

## 初始化web
```shell
go get -u github.com/gin-gonic/gin
```

## 容器构建
```shell

docker build -t harbor.fishline.top/k8s-test/bookinfo:v0.1 .

docker build -t bookinfo:v0.1 .
docker run -p 7082:8080 -d bookinfo:v0.1
```

http://124.221.88.70:7082/