#!/bin/sh

curl -v -X POST -H "foo: bar" -d "false" http://api.example.com/httpbin/post
