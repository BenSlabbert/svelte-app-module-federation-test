#!make

.PHONY: build
build:
	yarn run build

.PHONY: run
run:
	yarn run dev

.PHONY: clean
clean:
	rm -rf out
