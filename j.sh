#!/usr/bin/env bash

function print_usage() {
    VERSIONS=$(ls $SDKMAN_DIR/candidates/java | grep -v current | awk -F'.' '{print $1}' | sort -nr | uniq)
    CURRENT=$(basename $(readlink $SDKMAN_DIR/candidates/java/current) | awk -F'.' '{print $1}')
    echo "Available versions: "
    echo "$VERSIONS"
    echo "Current: $CURRENT"
    echo "Usage: j <java_version>"
}

if [[ $# -eq 1 ]]; then
  VERSION_NUMBER=$1
  IDENTIFIER=$(ls $SDKMAN_DIR/candidates/java | grep -v current | grep "$VERSION_NUMBER.0." | sort -r | head -n 1)
  sdk use java $IDENTIFIER
else
  print_usage
fi
