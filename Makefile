deploy:
	./scripts/deploy.sh 127.0.0.0

build:
	go build -o build/bin/loadhound main.go

build_linux:
	env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o build/bin/loadhound_linux main.go

prepare_test:
	build/bin/loadhound -run my_tests/demo_prepare.toml

run_demo_test:
	build/bin/loadhound -run my_tests/demo_test.toml