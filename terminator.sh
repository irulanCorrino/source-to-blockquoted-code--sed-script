#!/bin/sh
sed  --in-place='bak.*' -e '1i \> ```'  -e 's/^/> /' -e '$a \> ```' termination
