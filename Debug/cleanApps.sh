#!/bin/sh

ENVVARS_FILE=envvars.mk

IS_OS_CYGWIN=`uname|tr '[A-Z]' '[a-z]'|awk 'index($0,"cygwin") != 0 {print "cygwin"}'`
IS_OS_BSD=`uname|tr '[A-Z]' '[a-z]'|awk 'index($0,"bsd") != 0 {print "bsd"}'`
IS_OS_SOLARIS=`uname|tr '[A-Z]' '[a-z]'|awk 'index($0,"sunos") != 0 {print "sunos"}'`
IS_OS_LINUX=`uname|tr '[A-Z]' '[a-z]'|awk 'index($0,"linux") != 0 {print "linux"}'`
IS_OS_MINGW=`uname|tr '[A-Z]' '[a-z]'|awk 'index($0,"mingw") != 0 {print "mingw"}'`
IS_OS_DARWIN=`uname|tr '[A-Z]' '[a-z]'|awk 'index($0,"darwin") != 0 {print "darwin"}'`

MAKE_EXE=make
RES_LIB_EXT=so

if [ "$IS_OS_BSD" != "" ]; then
MAKE_EXE=gmake
elif [ "$IS_OS_SOLARIS" != "" ]; then
MAKE_EXE=gmake
elif [ "$IS_OS_CYGWIN" != "" || "$IS_OS_MINGW" != "" ]; then
RES_LIB_EXT=a
fi

cd ../web/default/src/Debug
$MAKE_EXE clean
cd ../../../flexApp/src/Debug
$MAKE_EXE clean
cd ../../../oauthApp/src/Debug
$MAKE_EXE clean