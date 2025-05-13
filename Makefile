.PHONY: all repo.png
all: slides.html slides.pdf

slides.html: slides.md
	docker run --rm --entrypoint=/bin/bash --volume="${CURDIR}:/src/" --workdir=/src  marpteam/marp-cli:v4.1.2 -c 'marp-cli.js --allow-local-files /src/slides.md'

slides.pdf: slides.md
	docker run --rm --entrypoint=/bin/bash --volume="${CURDIR}:/src/" --workdir=/src  marpteam/marp-cli:v4.1.2 -c 'marp-cli.js --allow-local-files --pdf /src/slides.md'

repo.png:
	qrencode --output=repo.png --size=6 --level=Q https://github.com/nicholascapo/talk-docker-building-go
