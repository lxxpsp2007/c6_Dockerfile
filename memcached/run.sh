#!/bin/bash


memcached -u nobody -m ${MEM:=128M} -c ${MAXCONN:=5000}
