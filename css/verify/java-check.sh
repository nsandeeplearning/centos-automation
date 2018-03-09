#!/bin/bash
java -version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 0 ]; then
echo "java was installed"
else
echo "java  was not installed"
 fi
