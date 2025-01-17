#!/bin/sh
echo "INPUT_DIR:" $INPUT_MARKDOWN_DIR
echo "INPUT_FILE:" $INPUT_MARKDOWN_FILE
echo "OUTPUT:" $INPUT_PDF_FILE

if [ -z "$INPUT_MARKDOWN_FILE" ]
then
      echo "DIR MODE"
      INPUTS=$(find /github/workspace/${INPUT_MARKDOWN_DIR} -maxdepth 1 -name "*.md" | sort | tr '\n' ' ')
else
      echo "FILE MODE"
      INPUTS=/github/workspace/${INPUT_MARKDOWN_DIR}/${INPUT_MARKDOWN_FILE}
fi

echo "INPUTS:" $INPUTS

pandoc ${INPUTS} -o /github/workspace/${INPUT_PDF_FILE}
