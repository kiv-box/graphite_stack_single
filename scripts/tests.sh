#!/bin/bash

DATE=`date +%s`

echo "carbon.tests.carbon-c-relay.zero 0 ${DATE}" | nc 127.0.0.1 2411 -w0 -t
echo "carbon.tests.carbon-c-relay.one 1 ${DATE}" | nc 127.0.0.1 2411 -w0 -t
echo "carbon.tests.carbon-c-relay.five 5 ${DATE}" | nc 127.0.0.1 2411 -w0 -t
echo "carbon.tests.carbon-c-relay.ten 10 ${DATE}" | nc 127.0.0.1 2411 -w0 -t
echo "carbon.tests.carbon-c-relay.random ${RANDOM} ${DATE}" | nc 127.0.0.1 2411 -w0 -t
echo "carbon.tests.carbon-c-relay.date ${DATE} ${DATE}" | nc 127.0.0.1 2411 -w0 -t

echo "carbon.tests.go-carbon.zero 0 ${DATE}" | nc 127.0.0.1 2003 -w0 -t
echo "carbon.tests.go-carbon.one 1 ${DATE}" | nc 127.0.0.1 2003 -w0 -t
echo "carbon.tests.go-carbon.five 5 ${DATE}" | nc 127.0.0.1 2003 -w0 -t
echo "carbon.tests.go-carbon.ten 10 ${DATE}" | nc 127.0.0.1 2003 -w0 -t
echo "carbon.tests.go-carbon.random ${RANDOM} ${DATE}" | nc 127.0.0.1 2003 -w0 -t
echo "carbon.tests.go-carbon.date ${DATE} ${DATE}" | nc 127.0.0.1 2003 -w0 -t
