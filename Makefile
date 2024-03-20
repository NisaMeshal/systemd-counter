# Misa Neshal
# 2/27/2024

# no build available for python womp womp
build:
	echo "uh... it's python"

test:
	python3 -m pytest

run:
	dpkg -i counter-v2.0.0.deb

build-deb:
	./deb-install.sh
	echo "build deb complete"

lint-deb:
	lintian counter-v2.0.0.deb

clean:
	rm -rf ./temp
	rm -rf ./__pycache__
	rm -rf ./.pytest_cache
	rm -f *.deb