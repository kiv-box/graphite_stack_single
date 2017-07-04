#!/bin/sh

DATE=`date +%s`

echo "carbon.tests.ext.carbon-c-relay.zero 0 ${DATE}" | nc 127.0.0.1 2411 -w0
echo "carbon.tests.ext.carbon-c-relay.one 1 ${DATE}" | nc 127.0.0.1 2411 -w0
echo "carbon.tests.ext.carbon-c-relay.five 5 ${DATE}" | nc 127.0.0.1 2411 -w0
echo "carbon.tests.ext.carbon-c-relay.ten 10 ${DATE}" | nc 127.0.0.1 2411 -w0
echo "carbon.tests.ext.carbon-c-relay.random ${RANDOM} ${DATE}" | nc 127.0.0.1 2411 -w0
echo "carbon.tests.ext.carbon-c-relay.date ${DATE} ${DATE}" | nc 127.0.0.1 2411 -w0

echo "carbon.tests.ext.go-carbon.zero 0 ${DATE}" | nc 127.0.0.1 2003 -w0
echo "carbon.tests.ext.go-carbon.one 1 ${DATE}" | nc 127.0.0.1 2003 -w0
echo "carbon.tests.ext.go-carbon.five 5 ${DATE}" | nc 127.0.0.1 2003 -w0
echo "carbon.tests.ext.go-carbon.ten 10 ${DATE}" | nc 127.0.0.1 2003 -w0
echo "carbon.tests.ext.go-carbon.random ${RANDOM} ${DATE}" | nc 127.0.0.1 2003 -w0
echo "carbon.tests.ext.go-carbon.date ${DATE} ${DATE}" | nc 127.0.0.1 2003 -w0

