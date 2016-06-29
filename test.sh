#!/bin/bash

res=$(docker run --rm cirocosta/alpine-dig dig localhost)

grep "QUESTION" <<< $res

