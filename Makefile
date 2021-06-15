IMAGE_NAME?=dnxsolutions/aws-okta-auth:latest

build:
	docker build -t $(IMAGE_NAME) .

test:
	docker run --rm -it --entrypoint="aws" $(IMAGE_NAME) --version
	docker run --rm -it --entrypoint="make" $(IMAGE_NAME) --version

shell:
	docker run --rm -it --entrypoint="bash" $(IMAGE_NAME)

lint:
	docker run --rm -i -v $(PWD)/hadolint.yaml:/.config/hadolint.yaml hadolint/hadolint < Dockerfile