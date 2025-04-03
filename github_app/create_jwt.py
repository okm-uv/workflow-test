#!/usr/bin/env python3
from jwt import JWT, jwk_from_pem
import time
import os

# https://docs.github.com/ja/apps/creating-github-apps/authenticating-with-a-github-app/generating-a-json-web-token-jwt-for-a-github-app#example-using-python-to-generate-a-jwt

pem_path = './credentials/private_pem'
app_id_path = './credentials/app_id'
if not os.path.exists(pem_path):
  print(f"not exist {pem_path}")
  exit(1)
if not os.path.exists(app_id_path):
  print(f"not exist {app_id_path}")
  exit(1)

# Open PEM
with open(pem_path, 'rb') as f:
  signing_key = jwk_from_pem(f.read())

# read App ID
with open(app_id_path, 'r') as f:
  app_id = f.read()

payload = {
  # Issued at time
  'iat': int(time.time()),
  # JWT expiration time (10 minutes maximum)
  'exp': int(time.time()) + 600,
  # GitHub App's identifier
  'iss': app_id
}

# Create JWT
jwt_instance = JWT()
encoded_jwt = jwt_instance.encode(payload, signing_key, alg='RS256')

print(encoded_jwt)