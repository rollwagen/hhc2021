# 2) Where in the World is Caramel Santaigo?

_Difficulty:_  :evergreen_tree:

Help Tangle Coalbox find a wayward elf in Santa's courtyard.
Talk to Piney Sappington nearby for hints.

Piney Sappington:
> Hi ho, Piney Sappington at your service!  Well, honestly, I could use a touch of
> your services.  You see, I've been looking at these documents, and I know someone
> has tampered with one file. Do you think you could log into this Cranberry Pi and
> take a look?  It has exiftool installed on it, if that helps you at all.  I
> just... Well, I have a feeling that someone at that other conference might have
> fiddled with things. And, if you help me figure this tampering issue out, I’ll
> give you some hints about OSINT, especially associated with geographic locations!

## Challenge: Cranberry Pi Exif Metadata

```sh
$ exiftool * | grep Last
Last Modified By : Santa Claus
Last Modified By : Santa Claus
Last Modified By : Santa Claus
Last Modified By : Jack Frost
Last Modified By : Santa Claus
Last Modified By : Santa Claus
$ exiftool * | less
# search for 'Jack Frost' and lookup up FileName
```

**Answer:*** `2021-12-21.docx`
