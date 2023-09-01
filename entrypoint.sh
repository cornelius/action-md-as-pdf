#!/bin/sh
echo "INPUT:"
echo $INPUT_MARKDOWN_FILE
cat $INPUT_MARKDOWN_FILE

echo "OUTPUT:"
echo $INPUT_PDF_FILE

pandoc --pdf-engine=wkhtmltopdf /github/workspace/${INPUT_MARKDOWN_FILE} -o /github/workspace/auto-pdf/${INPUT_PDF_FILE}
