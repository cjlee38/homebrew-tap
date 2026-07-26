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

if [[ -f "$output" ]]; then
    current_version=$(
        sed -n 's/^[[:space:]]*version "\([^"]*\)".*/\1/p' "$output"
    )
    [[ -n "$current_version" ]] || {
        print -u2 "Existing Cask has no version: $output"
        exit 1
    }
    autoload -Uz is-at-least
    is-at-least "$current_version" "$version" || {
        print -u2 "Refusing to downgrade Cosmos from $current_version to $version"
        exit 1
    }
fi

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
