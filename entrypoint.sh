#!/bin/sh
echo "INPUT_DIR:" $INPUT_MARKDOWN_DIR
echo "INPUT_FILE:" $INPUT_MARKDOWN_FILE
echo "INPUT_CSS_FILE:" $INPUT_CSS_FILE
echo "OUTPUT:" $INPUT_PDF_FILE

if [ -z "$INPUT_MARKDOWN_FILE" ]
then
      echo "DIR MODE"
      INPUTS=$(find /github/workspace/${INPUT_MARKDOWN_DIR} -maxdepth 1 -name "*.md" | sort | tr '\n' ' ')
      cd /github/workspace/${INPUT_MARKDOWN_DIR}
else
      echo "FILE MODE"
      INPUTS=/github/workspace/${INPUT_MARKDOWN_DIR}/${INPUT_MARKDOWN_FILE}
fi

if [ -z "$INPUT_CSS_FILE" ]
then
      echo "NO CSS FILE"
else
      echo "CSS FILE:" $INPUT_CSS_FILE
      CSS_OPTION="--css /github/workspace/${INPUT_CSS_FILE}"
fi

echo "INPUTS:" $INPUTS

set -x

pandoc ${INPUTS} --pdf-engine=weasyprint $CSS_OPTION -o /github/workspace/${INPUT_PDF_FILE}
