#!/usr/bin/env bash

# the 'list' files are shared between the languages
# the 'index.html' in the upper dir is the english version
# this script is supposed to be run from the 'vlzware.com/data' directory

if [ ! -d "data/data_en" ]; then
  echo "Can't find 'data/data_en' directory!"
  exit 1
fi

if [ ! -d "data/data_de" ]; then
  echo "Can't find 'data/data_de' directory!"
  exit 1
fi

WORKDIR="${PWD}"

function build() {
  echo "Building '$1' ..."
  echo
  LANG=${1}
  XMLFILE="${WORKDIR}"/index_"${LANG}".xml
  XSLFILE="${WORKDIR}"/index.xsl
  HTMLFILE="${WORKDIR}"/index_"${LANG}".html

  cat data/data_"${LANG}"/__main_header > "${XMLFILE}"

  while read -r DOM; do
    if [ -z "${DOM}" ] || [ "${DOM}" = " " ]; then
      continue
    fi
    cat data/data_"${LANG}"/"${DOM}"_domain_header >> "${XMLFILE}"
    while read -r FILE; do
      if [ -z "${FILE}" ] || [ "${FILE}" = " " ]; then
        continue
      fi
      echo "adding (${LANG}) $FILE ..."
      cat data/data_"${LANG}"/"${DOM}"_data_"${FILE}".xml >> "${XMLFILE}"
    done <<< "$(<data/lists/"${DOM}"_list)"  # https://stackoverflow.com/a/124349

    cat data/data_"${LANG}"/"${DOM}"_domain_footer >> "${XMLFILE}"
  done <<< "$(<data/lists/__domains_list)"

  cat data/data_"${LANG}"/__main_footer >> "${XMLFILE}"

  echo "Parsing '${LANG}' ..."
  python parse.py "${XMLFILE}" "${XSLFILE}" "${HTMLFILE}"

  echo "Prettifying '${LANG}' ..."
  tidy --drop-empty-elements no -imq --wrap 0 "${HTMLFILE}"

  echo
}

build "en"
build "de"

cp index_de.html ../index_de.html
cp index_en.html ../index.html

echo "Done!"

exit 0
