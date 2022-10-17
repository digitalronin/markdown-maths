TAG := digitalronin/markdown-maths

.built: Dockerfile package.json package-lock.json
	docker build -t $(TAG) .
	touch .built

build: .built

shell: build
	docker run --rm \
	-v $${PWD}:/app \
	--name mdmaths \
	-it $(TAG) bash
