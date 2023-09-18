# Markdown-as-PDF Action

This repository provides a GitHub action for rendering markdown formatted text as PDFs. It can process specific files or pull together a document from all Markdown files in a directory.

## Inputs

### `markdown_dir`

Name of directory containing markdown files. This is a required input. The input `markdown_file` controls, if all files in the directory are processed or only one specific file.

### `markdown_file`

Name of input file in Markdown format. If omitted all files in `markdown_dir` will be processed.

### `pdf_file`

Name of output file in PDF format.

## Example usage

The following example runs when changes to files in the `src` directory are pushed. It takes all Markdown files from the directory and turns them into one PDF `output.pdf`. The resulting PDF is uploaded as artifact of the CI job.

````
on:
  push:
    paths:
      - 'src/**'
  workflow_dispatch:

name: Create PDF

jobs:
  makepdfs:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - uses: cornelius/action-md-as-pdf@main
      if: github.ref == 'refs/heads/main'
      with:
        markdown_dir: src
        pdf_file: output.pdf
    - uses: actions/upload-artifact@v1
      with:
        name: Generated PDF
        path: output.pdf
```

## Notes for working on the action

### Using the `pandoc/latex` standard container

Convert Markdown to PDF using the Latex engine with official upstream Pandoc container image (see [documentation](https://hub.docker.com/r/pandoc/core)):

    docker run --rm --volume "$(pwd):/data" --user $(id -u):$(id -g) pandoc/latex README.md -o outfile.pdf

### Working with the `action-md-as-pdf` container

Build container locally (add option `--no-cache` to force rebuild):

    docker build --network=host . -t action-md-as-pdf

Enter shell of container for debugging:

    docker run --entrypoint /bin/bash -it action-md-as-pdf

### Running the action locally

Run action locally in file mode:

    export INPUT_MARKDOWN_DIR=.
    export INPUT_MARKDOWN_FILE=README.md
    export INPUT_PDF_FILE=output.pdf
    docker run --rm -e "INPUT_MARKDOWN_DIR" -e "INPUT_MARKDOWN_FILE" -e "INPUT_PDF_FILE" --volume "$(pwd):/github/workspace" action-md-as-pdf

Run action locally in dir mode:

    export INPUT_MARKDOWN_DIR=test_data
    export INPUT_MARKDOWN_FILE=""
    export INPUT_PDF_FILE=output.pdf
    docker run --rm -e "INPUT_MARKDOWN_DIR" -e "INPUT_PDF_FILE" --volume "$(pwd):/github/workspace" action-md-as-pdf

## License

This repository is licensed under the MIT license. See the [LICENSE](LICENSE) file for details.
