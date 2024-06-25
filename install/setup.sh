#!/bin/sh

pushd ..

printf "\nDeploy HTTPBin service ...\n"
kubectl apply -f apis/httpbin.yaml

printf "\nDeploy VirtualServices ...\n"
kubectl apply -f virtualservices/api-example-com-vs.yaml

popd