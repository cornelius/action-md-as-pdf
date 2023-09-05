This repository provides a GitHub action for rendering markdown formatted text as PDFs.

## Commands

Convert Markdown to PDF using the Latex engine with official upstream Pandoc container image (see [documentation](https://hub.docker.com/r/pandoc/core)):

    docker run --rm --volume "$(pwd):/data" --user $(id -u):$(id -g) pandoc/latex README.md -o outfile.pdf


Build container locally (add option `--no-cache` to force rebuild):

    docker build --network=host . -t action-md-as-pdf

Enter shell of container for debugging:

    docker run --entrypoint /bin/bash -it action-md-as-pdf


Run action locally:

    export INPUT_MARKDOWN_FILE=README.md
    export INPUT_PDF_FILE=output.pdf
    docker run --rm -e "INPUT_MARKDOWN_FILE" -e "INPUT_PDF_FILE" --volume "$(pwd):/github/workspace" action-md-as-pdf
