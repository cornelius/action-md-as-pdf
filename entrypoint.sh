#!/bin/sh

pandoc --pdf-engine=wkhtmltopdf -o /github/workspace/$(INPUT_MARKDOWN_FILE) /github/workspace/$(INPUT_PDF_FILE)
