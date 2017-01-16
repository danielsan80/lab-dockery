#!/bin/bash

rm -rf /var/www/project/app/cache/*
/bin/bash -l -c "$*"
