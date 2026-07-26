#!/bin/zsh

set -euo pipefail

repo_root="${0:A:h:h}"
version="${1:-}"
sha256="${2:-}"
output="${3:-$repo_root/Casks/cosmos.rb}"

[[ "$version" =~ '^[0-9]+\.[0-9]+\.[0-9]+([-.][0-9A-Za-z.-]+)?$' ]] || {
    print -u2 "Invalid version: $version"
    exit 1
}
[[ "$sha256" =~ '^[0-9a-f]{64}$' ]] || {
    print -u2 "Invalid SHA-256: $sha256"
    exit 1
}

mkdir -p "${output:h}"
sed \
    -e "s/@VERSION@/$version/g" \
    -e "s/@SHA256@/$sha256/g" \
    "$repo_root/templates/cosmos.rb" >"$output"

if grep -q '@VERSION@\|@SHA256@' "$output"; then
    print -u2 "Cask template contains unresolved placeholders."
    exit 1
fi

print "Rendered $output"
