TAG ?= latest

build: Dockerfile
	docker image build -t conao3/jq:$(TAG) .

push: build
	docker push conao3/jq:$(TAG)
