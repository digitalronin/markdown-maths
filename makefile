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

clean:
	rm -rf src

convert:
	docker run --rm \
	-v $${PWD}:/app \
	--name mdmaths \
	$(TAG) ./convert-local-md-files.sh


run:
	make clean
	./copy-md-files-to-local-tree.sh ../eunice-data/eunice_data

