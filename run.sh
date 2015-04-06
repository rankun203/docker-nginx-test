#!/usr/bin/env bash

docker build -t "nginx_img_1" ./ && docker run -i -t -p 8088:80 nginx_img_1
