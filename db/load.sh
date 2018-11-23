#!/bin/sh

BASE_DIR=$(dirname $(readlink -f "$0"))
if [ "$1" != "test" ]
then
    psql -h localhost -U yiifilmafinitty -d yiifilmafinitty < $BASE_DIR/yiifilmafinitty.sql
fi
psql -h localhost -U yiifilmafinitty -d yiifilmafinitty_test < $BASE_DIR/yiifilmafinitty.sql
