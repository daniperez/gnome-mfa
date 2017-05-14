# Gnome MFA

Shows Multifactor Authentication tokens (aka "one time passwords" or OTP) in the Gnome panel.
Uses the wonderful [Argos](https://github.com/p-e-w/argos/) extension
for Gnome.

## Installation

### Dependencies
* [Argos extension](https://github.com/p-e-w/argos/)
* [oathtool](http://www.nongnu.org/oath-toolkit/) (included in most distros)
* [xclip](https://github.com/astrand/xclip) (included in most distros)

Copy ```mfa.5s.sh``` to ```~/.config/argos```. 
If you keep the "5s" in the script name, it is updated every 5 seconds.
By default the tokens are read from ```~/.config/gnome-mfa/mfa.txt```.
The format is as follows:

```
Title 1, seed 1, icon char 1
Title 2, seed 2, icon char 2
...
```

The title can be anything and can include some mark-up (```<b>```, ```<i>```... check
Argos' documentation). The seed is the TOTP seed (HOTP not implemented yet) and the icon
can be any character, including emojis (check Argos' documentation).
