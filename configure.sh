#!/bin/bash -eu
cat <<EOF
window.baseUrl="${URL:-}";
window.apiUsername="${USER:-}";
window.apiPassword="${KEY:-}";
EOF
