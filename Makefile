# Misa Neshal
# 2/27/2024

# no build available for python womp womp
build:
	echo "uh... it's python"

test:
	pytest counterService_test.py

run:
	dpkg -i counter-v2.0.0.deb

build-deb:
	./deb-install.sh
	echo "build deb complete"

lint-deb:
	-lintian counter-v2.0.0.deb

clean:
	rm -rf ./temp
	rm -rf ./__pycache__
	rm -rf ./.pytest_cache
	rm -f *.deb

docker-image:
	docker build -t counter:latest .
	echo "docker container built"

docker-run:
	docker run --rm --mount type=bind,source=/tmp,target=/tmp counter:latest