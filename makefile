TAG := digitalronin/markdown-maths

.built: Dockerfile package.json package-lock.json
	docker build -t $(TAG) .
	touch .built

build: .built

run:
	make clean
	./copy-md-files-to-local-tree.sh ../eunice-data/eunice_data
	make convert

clean:
	docker run --rm \
	-v $${PWD}:/app \
	--name mdmaths \
	$(TAG) rm -rf src html

convert:
	docker run --rm \
	-v $${PWD}:/app \
	--name mdmaths \
	$(TAG) npx mpx build --input src --output html

# For use during development
shell: build
	docker run --rm \
	-v $${PWD}:/app \
	--name mdmaths \
	-it $(TAG) bash
