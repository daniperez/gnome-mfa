# Gnome MFA

Shows Multifactor Authentication tokens (aka "one time passwords" or OTP) in the Gnome panel.
Uses the wonderful [Argos](https://github.com/p-e-w/argos/) extension
for Gnome.

![mfa](mfa.png)

* The **red number** is the **expiration time** for the tokens in seconds.
* If you **click any entry**, the **token is copied** to the clipboard.

## Dependencies
* [Argos extension](https://github.com/p-e-w/argos/)
* [oathtool](http://www.nongnu.org/oath-toolkit/) (included in most distros)
* [xclip](https://github.com/astrand/xclip) (included in most distros)

## Installation
Copy ```mfa.5s.sh``` to ```~/.config/argos``` and grant it execution permission (```chmod +x ~/.config/argos/mfa.5s.sh```).

## Configuration
By default the tokens are read from ```~/.config/gnome-mfa/mfa.txt```.
The configuration for the screenshot above is as follows:
```
Gmail, gr6d 5br7 25s6 vnck v4vl hlao re, mail-mark-unread
Dropbox, ABC5DR789AB3D1B3BCD1ABAB23, weather-overcast
Bank, ba12 1234 126a cdef 5431 1a, calc
```

The format is:

```
Title 1, seed 1, icon name 1
Title 2, seed 2, icon name 2
...
```

* **Title**: it can be anything and can include some mark-up (```<b>```, ```<i>```... check
Argos' documentation). 
* **Seed**: TOTP seed (HOTP not implemented yet). Only base32 seeds are implemented for the time being since they are the most common.
* **Icon name**: name of a Gnome icon ([see here](https://developer.gnome.org/icon-naming-spec/#names) or execute `gtk3-icon-browser`).

If after configuring Argos/Gnome-MFA you cannot see the key icon on the top-right corner, something is not working. Check Argos documentation about how to debug it. 

