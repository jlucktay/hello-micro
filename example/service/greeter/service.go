package main

import (
	"log"
	"time"

	// hello "github.com/jlucktay/hello-micro/example/service/proto/hello"
	hello "github.com/micro/examples/greeter/srv/proto/hello"
	"github.com/micro/go-grpc"
	"github.com/micro/go-micro"

	"golang.org/x/net/context"
)

type Say struct{}

func (s *Say) Hello(ctx context.Context, req *hello.Request, rsp *hello.Response) error {
	log.Print("Received Say.Hello request")
	rsp.Msg = "Hello " + req.Name
	return nil
}

func main() {
	service := grpc.NewService(
		micro.Name("go.micro.srv.greeter"),
		micro.RegisterTTL(time.Second*30),
		micro.RegisterInterval(time.Second*10),
	)

	// Optionally set up command line usage
	service.Init()

	// Register handlers
	hello.RegisterSayHandler(service.Server(), new(Say))

	// Run server
	if err := service.Run(); err != nil {
		log.Fatal(err)
	}
}
