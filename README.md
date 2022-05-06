# source-to-blockquoted-code--sed-script
transforms your source code/text into markdown-style blockquoted code
>```
>sov@sov-X550CC:~$ cat termination
>first line
>some text and more
>much more slow
>many lines
>termination
>sov@sov-X550CC:~$ cat one.txt
>first line of one.txt
>many other lines 1.txt
>many other1 lines 1.txt
>many other2 lines 1.txt
>last line of one.txt
>sov@sov-X550CC:~$ cat two.txt
>first line of two.txt
>many other lines 2.txt
>many other1 lines 2.txt
>many other2 lines 2.txt
>last line of two.txt
>sov@sov-X550CC:~$ cat three.txt
>first line of three.txt
>many other lines 3.txt
>many other1 lines 3.txt
>many other2 lines 3.txt
>last line of three.txt
>sov@sov-X550CC:~$ cat terminator.sh
>#!/bin/sh
>sed  --in-place='bak.*' -e '1i \>```'  -e 's/^/>/' -e '$a \>```' termination one.txt two.txt three.txt
>sov@sov-X550CC:~$ ./terminator.sh
>sov@sov-X550CC:~$ cat termination
>>```
>>first line
>>some text and more
>>much more slow
>>many lines
>>termination
>>```
>sov@sov-X550CC:~$ cat one.txt
>>```
>>first line of one.txt
>>many other lines 1.txt
>>many other1 lines 1.txt
>>many other2 lines 1.txt
>>last line of one.txt
>>```
>sov@sov-X550CC:~$ cat two.txt
>>```
>>first line of two.txt
>>many other lines 2.txt
>>many other1 lines 2.txt
>>many other2 lines 2.txt
>>last line of two.txt
>>```
>sov@sov-X550CC:~$ cat three.txt
>>```
>>first line of three.txt
>>many other lines 3.txt
>>many other1 lines 3.txt
>>many other2 lines 3.txt
>>last line of three.txt
>>```
>sov@sov-X550CC:~$ 
>
>```
