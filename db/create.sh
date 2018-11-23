#!/bin/sh

if [ "$1" = "travis" ]
then
    psql -U postgres -c "CREATE DATABASE yiifilmafinitty_test;"
    psql -U postgres -c "CREATE USER yiifilmafinitty PASSWORD 'yiifilmafinitty' SUPERUSER;"
else
    [ "$1" != "test" ] && sudo -u postgres dropdb --if-exists yiifilmafinitty
    [ "$1" != "test" ] && sudo -u postgres dropdb --if-exists yiifilmafinitty_test
    [ "$1" != "test" ] && sudo -u postgres dropuser --if-exists yiifilmafinitty
    sudo -u postgres psql -c "CREATE USER yiifilmafinitty PASSWORD 'yiifilmafinitty' SUPERUSER;"
    [ "$1" != "test" ] && sudo -u postgres createdb -O yiifilmafinitty yiifilmafinitty
    sudo -u postgres createdb -O yiifilmafinitty yiifilmafinitty_test
    LINE="localhost:5432:*:yiifilmafinitty:yiifilmafinitty"
    FILE=~/.pgpass
    if [ ! -f $FILE ]
    then
        touch $FILE
        chmod 600 $FILE
    fi
    if ! grep -qsF "$LINE" $FILE
    then
        echo "$LINE" >> $FILE
    fi
fi
