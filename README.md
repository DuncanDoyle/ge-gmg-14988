# GMG 14988 Reproducer on Gloo Edge
 
Gloo Mesh Gateway issue: https://github.com/solo-io/gloo-mesh-enterprise/issues/14988

Gloo Gateway issue: https://github.com/solo-io/gloo/issues/9768

## Installation

Add Gloo EE Helm repo:
```
helm repo add glooe https://storage.googleapis.com/gloo-ee-helm
```

Export your Gloo Edge License Key to an environment variable:
```
export GLOO_EDGE_LICENSE_KEY={your license key}
```

Install Gloo Edge:
```
cd install
./install-gloo-edge-enterprise-with-helm.sh
```

> NOTE
> The Gloo Edge version that will be installed is set in a variable at the top of the `install/install-gloo-edge-enterprise-with-helm.sh` installation script.

## Setup the environment

Run the `install/setup.sh` script to setup the environment:
- Deploy the HTTPBin service
- Deploy the VirtualServices (including inline transformation policy)


```
./setup.sh
```

## Run the test

Run the `curl-request.sh` script to fire a POST request to the `HTTPBin` application at http://api.example.com/httpbin/post with the value `false` as literal in the body. According to [RFC8259](https://datatracker.ietf.org/doc/html/rfc8259#section-3), this is valid JSON. Parsing however fails in the transformation policy and we get the following error back:

```
HTTP/1.1 400 Bad Request

bad request: [json.exception.type_error.305] cannot use operator[] with a string argument with boolean
```