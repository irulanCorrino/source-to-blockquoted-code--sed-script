# source-to-blockquoted-code--sed-script
transforms your source code/text into markdown-style blockquoted code
### part 1 (broken [see next section])

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
### after i have learned Lesson 2 [the headache with google’s tweaked linux renamed to android]
- there were issues with copied output in Part 1 —something [firefox, a clipboard and so on] had eaten whitespaces i guess; but because i lose my memory oftenly i cannot tell that was not my issue —when i myself have copied that line from this my github readme.md in Android a couple of days ago it has not produced correct markdown output [certainly]
- here is a code snippet from Lesson 1 written cleanly:
> ```
> #!/bin/sh
> sed --in-place='.bak' -e '1i \> ```'  -e 's/^/> /' -e '$a \> ```' termination
> echo "Asta la Vista!"
> 
> ```
- #please note that in Unix systems all your source codes are expected to terminate with a newline character! [e.g. android eats last string in terminal emulators]
- i have tried passing file name to command line script in Android but it DOES NOT WORK!
- there were `'$1'` and `/proc/self/fd/1` and maybe `stdin` and even more [i have lost my memory after exiting the `dothe`]

#### anyway here is how to make it working with Android
- i use following tools in my Android systems:
1. airTerm[^1]
2. simpleBusyBox v.3 (busybox v1.24.2)[^2]
3. total commander[^3]
4. SD Maid[^4]
5. QuickEdit[^5]
6. jbak2 keyboard[^6] with my own layout which you may find in another my repository here @gitHub[^7]
- #please note that my two file managers have different sets of features —e.g. tc cannot install apk files while SD Maid is quiet reckless (specifically with deleting images —Gallery shows broken links after removals)

###### A. i have found following requirement for script’s execution in Android
- set execute permissions with a file manager if your Android is rooted
- it is impossible to directly execute custom scripts in non‑rooted system [because changing execute [and any other] permissions is blocked]
- use this workaround: `sh ./terminator.sh`

###### B. it is more convenient to define a bash/sh/[whatever else] function
> ```
> terminator () {
> sed  -e '1i \> ```'  -e 's/^/> /' -e '$a \> ```'
> }
> ```
- it can be used together with `cat` but it would be usable ONLY FOR SMALL FILES because [at least my] Android’s terminal emulators do not allow SCROLLING WHILE COPYING!!!

###### C. i use hard‑coded file name in both shell‑script and shell‑function realisations of my `sed` script
- `bash` script variant is already posted above
- here is that `sh` function
> ```
> terminator () {
> sed --in-place='.bak' -e '1i \> ```'  -e 's/^/> /' -e '$a \> ```' termination
> }
> ```

###### D. here is my airTerm’s analogue for bash profile
> ```
> export PATH=/data/local/bin:$PATH
> export PATH=/data/data/org.galexander.busybox/files:$PATH
> cd /storage/emulated/0/Workplace
> terminator () { sed  --in-place='.bak'  -e '1i \> ```'  -e 's/^/> /' -e '$a \> ```' termination; }
> echo "Hello, hacker!!!"
> ```
- it is called `initial command` in terminal emulators’ preferences
- rename your source code or text to `termination` then to invoke the script simply issue `terminator` command
- then you would may need to rename other your files to `termination` after copying processed content of your source
- there is backup [unprocessed] copy left behind —`termination.bak` [it would be overwritten @ next invocation of the script]

[^1]: https://play.google.com/store/apps/details?id=com.myboyfriendisageek.airterm [i have found that most other terminal emulators are broken down to unusability; even this one does not allow multisessions hanging Android system (is valid at least for Jelly Bean)]
[^2]: https://play.google.com/store/apps/details?id=org.galexander.busybox
[^3]: https://play.google.com/store/apps/details?id=eu.thedarken.sdm
[^4]: https://play.google.com/store/apps/details?id=com.ghisler.android.TotalCommander
[^5]: https://play.google.com/store/apps/details?id=com.rhmsoft.edit
[^6]: https://play.google.com/store/apps/details?id=com.jbak2.JbakKeyboard
[^7]: https://github.com/irulanCorrino/kturtle-script-keyboard-layout-for-jbak2

