#!/usr/bin/env bash

set -euo pipefail

source "$HOME/.gradle/gradle.properties"

AUTH_SERVER_VERSION="1.0.1"

main() {
  local jar_path="tanzu-local-authorization-server.jar"

  if [ ! -f "$jar_path" ]; then
      echo "Downloading Tanzu Local Auth Server"
      curl -L -H "Authorization: Bearer $broadcomJFrogArtifactoryPassword" -o "$jar_path" -X GET \
        "$broadcomJFrogArtifactoryHost/artifactory/spring-enterprise/com/vmware/tanzu/spring/tanzu-local-authorization-server/$AUTH_SERVER_VERSION/tanzu-local-authorization-server-$AUTH_SERVER_VERSION.jar"
  fi

  java -jar "$jar_path" --config=scripts/tanzu-local-auth-server-config.yml
}

main
