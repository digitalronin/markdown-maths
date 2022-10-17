TAG := digitalronin/markdown-maths

.built: Dockerfile
	docker build -t $(TAG) .
	touch .built

build: .built

shell: build
	docker run --rm \
	-v $${PWD}:/app \
	--name mdmaths \
	-it $(TAG) bash
