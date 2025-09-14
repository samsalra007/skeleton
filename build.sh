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
  --global-property 'models,modelDocs=false,modelTests=false' \
  --additional-properties 'useSpringBoot3=true,dateLibrary=java8,serializableModel=true,modelPackage=com.wolfbear.skeleton.contract.model'

echo "Generating API endpoints"
openapi-generator generate \
    -g spring \
    -i skeleton-spec/spec.yaml \
    -o skeleton-api \
    --global-property 'apis,supportingFiles=ApiUtil.java,apiDocs=false,apiTests=false' \
    --additional-properties 'useSpringBoot3=true,interfaceOnly=false,delegatePattern=true,useTags=true,useBeanValidation=true,performBeanValidation=true,dateLibrary=java8,serializableModel=true,apiPackage=com.wolfbear.skeleton.api,modelPackage=com.wolfbear.skeleton.contract.model,invokerPackage=com.wolfbear.skeleton.api.invoker'

mvn clean install

mvn -f skeleton-api/pom.xml spring-boot:run