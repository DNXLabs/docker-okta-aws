#!/bin/bash
set -euo pipefail

# Initialise AWS CLI
aws configure set region "${OKTA_AWS_DEFAULT_REGION:-ap-southeast-2}"

# Primary OKTA login
java "-Duser.home=${HOME}" \
     -classpath /bin/okta-aws-cli.jar com.okta.tools.awscli \
     --profile "${OKTA_AWS_PROFILE:-default}" sts get-caller-identity

echo "" >> /work/.env
echo AWS_ACCESS_KEY_ID=$(aws configure get aws_access_key_id) >> /work/.env
echo AWS_SECRET_ACCESS_KEY=$(aws configure get aws_secret_access_key) >> /work/.env
echo AWS_SECURITY_TOKEN=$(aws configure get aws_security_token) >> /work/.env
echo AWS_SESSION_EXPIRATION=$(aws configure get aws_session_expiration) >> /work/.env
echo AWS_SESSION_TOKEN=$(aws configure get aws_session_token) >> /work/.env