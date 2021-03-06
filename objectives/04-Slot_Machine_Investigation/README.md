# 4) Slot Machine Investigation

_Difficulty:_  :evergreen_tree: :evergreen_tree:

> Test the security of Jack Frost's slot machines. What does the Jack Frost
> Tower casino security team threaten to do when your coin total exceeds 1000?
> Submit the string in the server data.response element. Talk to _Noel Boetie_
> outside Santa's Castle for help.

Noel Boetie:

> Hello there! Noel Boetie here. We’re all so glad to have you attend KringleCon
> IV and work on the Holiday Hack Challenge!  I'm just hanging out here by the
> Logic Munchers game.  You know… logic: that thing that seems to be in short
> supply at the tower on the other side of the North Pole?  Oh, I'm sorry. That
> wasn't terribly kind, but those frosty souls do confuse me...  Anyway, I’m
> working my way through this Logic Munchers game.  A lot of it comes down to
> understanding boolean logic, like `True` And `False` is `False`, but `True` And
> `True` is `True`.
> It can get a tad complex in the later levels.  I need some help, though. If you
> can show me how to complete a stage in Potpourri at the Intermediate (Stage 3)
> or higher, I’ll give you some hints for how to find vulnerabilities.
\
> :link: **Boolean Logic** [link](http://notes.imt-decal.org/sets/cheat-sheet.html)

## Challenge: Cranberry Pi Logic Munchers

![Chompers](img/chompers.png)

Noel Boetie:

> Wow - amazing score! Great work!
> So hey, those slot machines. It seems that in his haste,
> Jack bought some terrible hardware.
> It seems they're susceptible to parameter tampering.

:link: **Parameter Tampering** [link](https://owasp.org/www-community/attacks/Web_Parameter_Tampering)

* Used 'Burp' to change request to `betamount=1000&numline=20&cpl=-0.25`
* Server response:

```json
{
  "success": true,
  "data": {
    "credit": 5100,
    "jackpot": 0,
    "free_spin": 0,
    "free_num": 0,
    "scaler": 0,
    "num_line": 20,
    "bet_amount": 1000,
    "pull": {
      "WinAmount": -3750,
      "FreeSpin": 0,
      "WildFixedIcons": [],
      "HasJackpot": false,
      "HasScatter": false,
      "WildColumIcon": "",
      "ScatterPrize": 0,
      "SlotIcons": [
        "icon9",
        "icon6",
        "scatter",
        "icon3",
        "wild"
      ],
      "ActiveIcons": [
        11,
        12,
        3
      ],
      "ActiveLines": [
        19
      ]
    },
    "response": "I'm going to have some bouncer trolls bounce you right out of this casino!"
  },
  "message": "Spin success"
}
```
