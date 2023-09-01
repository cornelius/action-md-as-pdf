#!/bin/sh
echo $INPUT_MARKDOWN_FILE

pandoc --pdf-engine=wkhtmltopdf /github/workspace/${INPUT_MARKDOWN_FILE} -o /github/workspace/${INPUT_PDF_FILE}
