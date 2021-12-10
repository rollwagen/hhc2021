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

Piney Sappington:
> Wow, you figured that out in no time! Thanks!  I knew they were up to no good.
> So hey, have you tried the Caramel Santaigo game in this courtyard?  Carmen?
> No, I haven't heard of her.  So anyway, some of the hints use obscure coordinate
> systems like MGRS and even what3words.

Don't forget coordinate systems other than lat/long like:

* [MGRS](https://en.wikipedia.org/wiki/Military_Grid_Reference_System)
* [what3words](https://what3words.com/)

Tangle Coalbox:
> Hey there, Gumshoe. Tangle Coalbox here again.  I've got a real doozy of a
> case for you this year.  Turns out some elves have gone on some misdirected
> journeys around the globe. It seems that someone is messing with their travel
> plans.  We could sure use your open source intelligence (OSINT) skills to find
> them.  Why dontcha' log into this vintage Cranberry Pi terminal and see if you
> have what it takes to **track them around the globe.**  If you're having any
> trouble with it, you might ask Piney Sappington right over there for tips.

* They said, if asked, they would describe their next location as "staring
  desire frost."
  * _what3words_: **staring.desire.frost** `Reykjavík`
* They were dressed for 0.0°C and sunny conditions. The elf got really heated
  about using spaces for indents.
* The elf wanted to drink gløgg in Tivoli Gardens.
* Buddy, a close friend of the elves, once went on an ice skating date under
  their huge Christmas tree!
* They sent me this blurry selfie of themself or someone they met:
* They were dressed for 8.3°C and overcast conditions. The elf got really
  heated about using tabs for indents.
* They were excited about checking out the Vánoční trhy.
* They said, if asked, they would describe their next location as "only milder
  vanilla."
* I'm not sure what a hogmanay is, but that elf wants to experience one just
  after Christmas.
* They said something about MGRS and 32U NU 05939 98268...
* Apparently they really wanted to see what a town hall looks like when it's
  converted into a giant Advent calendar!
* They were dressed for 1.0°C and partly cloudy conditions. The elf mentioned
  something about Stack Overflow and Python.
