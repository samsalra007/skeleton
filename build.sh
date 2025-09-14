#!/bin/sh
set -e
set -o pipefail

echo "Building Skeleton Project"
sleep 1

echo "Java Version: " $( java --version )
echo "Java Compiler Version: " $( javac --version )

echo "Generating contracts"
openapi-generator generate \
  -g spring \
  -i skeleton-spec/spec.yaml \
  -o skeleton-contract \
  --global-property 'apis,supportingFiles=ApiUtil.java,apiDocs=false,apiTests=false' \
  --additional-properties 'useSpringBoot3=true,interfaceOnly=true,delegatePattern=false,useTags=true,apiPackage=com.wolfbear.skeleton.contract.api,modelPackage=com.wolfbear.skeleton.contract.model'

mvn clean install

mvn -f skeleton-api/pom.xml spring-boot:run