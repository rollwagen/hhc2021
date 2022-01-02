# 12 Frost Tower Website Checkup

_Difficulty:_  :evergreen_tree: :evergreen_tree: :evergreen_tree:
                   :evergreen_tree: :evergreen_tree:

> Investigate Frost Tower's website for security issues. This source code will
> be useful in your analysis. In Jack Frost's TODO list, what job position does
> Jack plan to offer Santa? Ribb Bonbowford, in Santa's dining room, may have
> some pointers for you.

[Frost Tower Website](https://staging.jackfrosttower.com/)
[Source code](https://download.holidayhackchallenge.com/2021/frosttower-web.zip)

Ribb Bonbowford:

> Are you new to programming? It's a handy skill for anyone in cyber security.
> This here machine lets you control an Elf using Python 3. It’s pretty fun, but
> I’m having trouble getting beyond Level 8. Tell you what… if you help me get
> past Level 8, I’ll share some of my SQLi tips with you. You may find them
> handy sometime around the North Pole this season. Most of the information
> you'll need is provided during the game, but I'll give you a few more
> pointers, if you want them. Not sure what a lever requires? Click it in the
> Current Level Objectives panel. You can move the elf with commands like
> `elf.moveLeft(5)`, `elf.moveTo({"x":2,"y":2})`, or `elf.moveTo(lever0.position)`.
> Looping through long movements? Don't be afraid to `moveUp(99)` or whatever. You
> elf will stop at any obstacle. You can call functions like myFunction(). If
> you ever need to pass a function to a munchkin, you can use myFunction without
> the ().

```python
# Grab our lever object
lever = levers.get(0)
munchkin = munchkins.get(0)
lollipop = lollipops.get(0)
# move to lever position
elf.moveTo(lever.position)
# get lever int and add 2 and submit val
leverData = lever.data() + 2
lever.pull(leverData)
# Grab lollipop and stand next to munchkin
elf.moveLeft(1)
elf.moveUp(8)
# Solve the munchkin's challenge
munchList = munchkin.ask() # e.g. [1, 3, "a", "b", 4]
answer_list = []
for elem in munchList:
    if type(elem) == int:
        answer_list.append(elem)
munchkin.answer(answer_list)
elf.moveUp(2) # Move to finish
```

```python
# Level 1
elf.moveLeft(10)
elf.moveTo({"x":2,"y":2})

# Level 2
elf.moveTo({"x":2,"y":10})
elf.moveTo({"x":5,"y":8})
elf.moveTo({"x":2,"y":2})

# Level 3
lever0 = levers.get(0)
lollipop0 = lollipops.get(0)
elf.moveTo(lever0.position)
lever0.pull(lever0.data()+2)
elf.moveTo(lollipop0.position)
elf.moveTo({"x":2,"y":2})

# Level 4
lever0, lever1, lever2, lever3, lever4 = levers.get()
# Move onto lever4 - This lever wants a str object:
elf.moveTo(lever4.position)
lever4.pull("")
elf.moveTo(lever3.position)
lever3.pull(True)
elf.moveTo(lever2.position)
lever2.pull(3)
elf.moveTo(lever1.position)
lever1.pull([])
elf.moveTo(lever0.position)
lever0.pull(dict())
elf.moveTo({"x":2,"y":2})

# Level 5
lever0, lever1, lever2, lever3, lever4 = levers.get()
elf.moveTo(lever4.position)
lever4.pull(lever4.data() + " concatenate")
elf.moveTo(lever3.position)
lever3.pull(not lever3.data())
elf.moveTo(lever2.position)
lever2.pull((lever2.data() + 1))
elf.moveTo(lever1.position)
l = lever1.data()
l.append(1)
lever1.pull(l)
elf.moveTo(lever0.position)
d = lever0.data()
d.update({"strkey":"strvalue"})
lever0.pull(d)
elf.moveTo({"x":2,"y":2})

# Level 6
lever = levers.get(0)
d = lever.data()
elf.moveTo(lever.position)
answer = None
if isinstance(d, bool):
    answer = not d
elif isinstance(d, int) or isinstance(d, float):
    answer =  int(d * 2)
elif isinstance(d, list):
    answer = [(i+1) for i in d]
elif isinstance(d, str):
    answer =  d + d
elif isinstance(d, dict):
    answer = d['a'] + 1
lever.pull(answer)
elf.moveTo({"x":2,"y":2})

# Level 7
elf.moveTo({"x":10,"y":1})
elf.moveLeft(2)
elf.moveDown(11)
elf.moveTo({"x":7,"y":1})
elf.moveLeft(2)
elf.moveDown(11)
elf.moveTo({"x":2,"y":2})

# Level 8
all_lollipops = lollipops.get()
for lollipop in all_lollipops:
    elf.moveTo(lollipop.position)
lever = levers.get(0)
elf.moveTo(lever.position)
lever.pull(["munchkins rule"] + lever.data())
elf.moveTo({"x":5,"y":4})
elf.moveTo({"x":2,"y":2})
```

Ribb Bonbowford:
> Gosh, with skills like that, I'll bet you could help figure out what's really
> going on next door... And, as I promised, let me tell you what I know about
> SQL injection. I hear that having source code for vulnerability discovery
> dramatically changes the vulnerability discovery process. I imagine it changes
> how you approach an assessment too. When you have the source code, API
> documentation becomes tremendously valuable. Who knows? Maybe you'll even find
> more than one vulnerability in the code.

[mysqljs/mysql](https://github.com/mysqljs/mysql)
