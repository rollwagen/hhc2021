# 11 Customer Complaint Analysis

_Difficulty:_  :evergreen_tree: :evergreen_tree: :evergreen_tree:

> A human has accessed the Jack Frost Tower network with a non-compliant host.
> Which three trolls complained about the human? Enter the troll names in
> alphabetical order separated by spaces. Talk to _Tinsel Upatree_ in the kitchen
> for hints.

[jackfrosttower-network.zip](https://downloads.holidayhackchallenge.com/2021/jackfrosttower-network.zip)

Tinsel Upatree:
> Hiya hiya, I'm Tinsel Upatree! Say, do you know what's going on next door? I'm
> a bit worried about the whole FrostFest event. It feels a bit...
> ill-conceived, somehow. Nasty even. Well, regardless – and more to the point,
> what do you know about tracing processes in Linux? We rebuilt this here
> Cranberry Pi that runs the cotton candy machine, but we seem to be missing a
> file. Do you think you can use `strace` or `ltrace` to help us rebuild the
> missing config? We'd like to help some of our favorite children enjoy the
> sweet spun goodness again! And, if you help me with this, I’ll give you some
> hints about using Wireshark filters to look for unusual options that might
> help you achieve Objectives here at the North Pole.

* `strace` - trace system calls and signals
* `ltrace` - A library call tracer

```sh
$ strace ./make_the_candy
...
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
fstat(3, {st_mode=S_IFREG|0644, st_size=19540, ...}) = 0
mmap(NULL, 19540, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7fd31b3ce000
close(3)                                = 0
access("/etc/ld.so.nohwcap", F_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
...
close(3)                                = 0
arch_prctl(ARCH_SET_FS, 0x7fd31b3cd4c0) = 0
mprotect(0x7fd31b1a0000, 16384, PROT_READ) = 0
mprotect(0x55d2fdfa9000, 4096, PROT_READ) = 0
mprotect(0x7fd31b3d3000, 4096, PROT_READ) = 0
munmap(0x7fd31b3ce000, 19540)           = 0
brk(NULL)                               = 0x55d2fe633000
brk(0x55d2fe654000)                     = 0x55d2fe654000
openat(AT_FDCWD, "registration.json", O_RDONLY) = -1 ENOENT (No such file or directory)
fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(136, 0), ...}) = 0
write(1, "Unable to open configuration fil"..., 35Unable to open configuration file.
) = 35
exit_group(1)                           = ?
+++ exited with 1 +++

$ touch registration.json
$ ltrace ./make_the_candy
fopen("registration.json", "r")                          = 0x563e321b7260
getline(0x7ffd3f5442c0, 0x7ffd3f5442c8, 0x563e321b7260, 0x7ffd3f5442c8) = 2
strstr("{\n", "Registration")                            = nil
getline(0x7ffd3f5442c0, 0x7ffd3f5442c8, 0x563e321b7260, 0x7ffd3f5442c8) = 1
strstr("\n", "Registration")                             = nil
getline(0x7ffd3f5442c0, 0x7ffd3f5442c8, 0x563e321b7260, 0x7ffd3f5442c8) = 2
strstr("}\n", "Registration")                            = nil
getline(0x7ffd3f5442c0, 0x7ffd3f5442c8, 0x563e321b7260, 0x7ffd3f5442c8) = -1
puts("Unregistered - Exiting."Unregistered - Exiting.

 $ ltrace ./make_the_candy
fopen("registration.json", "r")                          = 0x556e87007260
getline(0x7ffc4b03c580, 0x7ffc4b03c588, 0x556e87007260, 0x7ffc4b03c588) = 14
strstr("Registration:\n", "Registration")                = "Registration:\n"
strchr("Registration:\n", ':')                           = ":\n"
strstr(":\n", "True")                                    = nil
getline(0x7ffc4b03c580, 0x7ffc4b03c588, 0x556e87007260, 0x7ffc4b03c588) = -1
puts("Unregistered - Exiting."Unregistered - Exiting.
)                          = 24
+++ exited (status 1) +++

# cat registration.json
Registration:True

```

_Tinsel Upatree:_

> Great! Thanks so much for your help! I'm sure I can put those skills I just
> learned from you to good use. Are you familiar with [RFC3514][rfc3514]?
> [Wireshark][wireshark] uses a different name for the Evil Bit: ip.flags.rb.
> HTTP responses are often gzip compressed. Fortunately, Wireshark decompresses
> them for us automatically. You can search for strings in Wireshark fields
> using [display filters][display_filters] the contains keyword.

[rfc3514]: https://datatracker.ietf.org/doc/html/rfc3514
[wireshark]: https://www.wireshark.org
[display_filters]: https://wiki.wireshark.org/DisplayFilters

From RFC:
> Benign packets have this bit set to 0; those that
> are used for an attack will have the bit set to 1.

Wireshark filter used:
`ip.flags.rb eq 1 && http.request.method == "POST"`

Next: File -> Export Objects -> HTTP
and then just using `grep` on the files
and reading/looking at complaints:

```text
name=Hagg&troll_id=2013&guest_info=Incredibly+angry+lady+in+room+1024
name=Flud&troll_id=2083&guest_info=Very+cranky+lady+in+room+1024
Yaqh&troll_id=2796&guest_info=Snooty+lady+in+room+1024&description=
```

_Answer:_ Flud Hagg Yaqh
