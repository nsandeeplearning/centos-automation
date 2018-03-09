#!/bin/bash
git --version 2>&1 >/dev/null
GIT_IS_AVAILABLE=$?
if [ $GIT_IS_AVAILABLE -eq 0 ]; then
echo "git was installed"
else
echo "git was not installed"
 fi
