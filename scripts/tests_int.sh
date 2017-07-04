#!/bin/sh

DATE=`date +%s`

echo "carbon.tests.int.carbon-c-relay.zero 0 ${DATE}" | nc carbon-c-relay 2411 -w0
echo "carbon.tests.int.carbon-c-relay.one 1 ${DATE}" | nc carbon-c-relay 2411 -w0
echo "carbon.tests.int.carbon-c-relay.five 5 ${DATE}" | nc carbon-c-relay 2411 -w0
echo "carbon.tests.int.carbon-c-relay.ten 10 ${DATE}" | nc carbon-c-relay 2411 -w0
echo "carbon.tests.int.carbon-c-relay.random ${RANDOM} ${DATE}" | nc carbon-c-relay 2411 -w0
echo "carbon.tests.int.carbon-c-relay.date ${DATE} ${DATE}" | nc carbon-c-relay 2411 -w0

echo "carbon.tests.int.go-carbon.zero 0 ${DATE}" | nc go-carbon 2003 -w0
echo "carbon.tests.int.go-carbon.one 1 ${DATE}" | nc go-carbon 2003 -w0
echo "carbon.tests.int.go-carbon.five 5 ${DATE}" | nc go-carbon 2003 -w0
echo "carbon.tests.int.go-carbon.ten 10 ${DATE}" | nc go-carbon 2003 -w0
echo "carbon.tests.int.go-carbon.random ${RANDOM} ${DATE}" | nc go-carbon 2003 -w0
echo "carbon.tests.int.go-carbon.date ${DATE} ${DATE}" | nc go-carbon 2003 -w0
