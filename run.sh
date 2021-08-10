#!/bin/bash

docker run -it --rm --name sampleapi -p 4321:4321 -e ASPNETCORE_URLS=http://0.0.0.0:4321/ sampleapi