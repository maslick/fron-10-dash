#!/bin/sh -eu
if [[ -z "${URL:-}" ]]; then
    BACKEND_URL="undefined"
else
    BACKEND_URL=$URL
fi

cat <<EOF
window.url="$BACKEND_URL";
EOF
