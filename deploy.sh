#!/usr/bin/env bash

set -eu

ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
CLOUDFORMATION_FILE=static-site.yml

echo "==> Validating ${CLOUDFORMATION_FILE} ..."
aws cloudformation validate-template --template-body file://$(pwd)/${CLOUDFORMATION_FILE}

echo "==> Deploying ${CLOUDFORMATION_FILE} ..."
aws cloudformation deploy --stack-name "static-site-cf" --template-file ${CLOUDFORMATION_FILE} --role-arn "arn:aws:iam::${ACCOUNT_ID}:role/cloudformation"
