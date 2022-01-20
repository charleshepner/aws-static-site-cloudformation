#!/usr/bin/env bash

set -eu

CLOUDFORMATTION_FILE=static-site.yml


echo "==> Validating ${CLOUDFORMATION_FILE} ..."
aws cloudformation validate-template --template-body file://$(pwd)/${CLOUDFORMATION_FILE}

echo "==> Deploying ${CLOUDFORMATION_FILE} ..."
aws cloudformation deploy --stack-name "static-site-cf" --template-file ${CLOUDFORMATION_FILE}
