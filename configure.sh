#!/bin/sh -eu
if [[ -z "${URL:-}" ]]; then BACKEND_URL="undefined"; else BACKEND_URL=$URL; fi
if [[ -z "${USER:-}" ]]; then USERNAME="undefined"; else USERNAME=$USER; fi
if [[ -z "${KEY:-}" ]]; then SECRET_KEY="undefined"; else SECRET_KEY=$KEY; fi

cat <<EOF
window.baseUrl="$BACKEND_URL";
window.apiUsername="$USERNAME";
window.apiPassword="$SECRET_KEY";
EOF
