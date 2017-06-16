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
Copy ```mfa.5s.sh``` to ```~/.config/argos```. 

## Configuration
By default the tokens are read from ```~/.config/gnome-mfa/mfa.txt```.
The format is as follows:

```
Title 1, seed 1, icon name 1
Title 2, seed 2, icon name 2
...
```
* **Title**: it can be anything and can include some mark-up (```<b>```, ```<i>```... check
Argos' documentation). 
* **Seed**: TOTP seed (HOTP not implemented yet). They look like ```gr6d 5br7 25s6 vnck v4vl hlao re```. Only base32 seeds are implemented for the time being since they are the most common.
* **Icon name**: name of an icon as provided by Gnome ([see here](https://developer.gnome.org/icon-naming-spec/#names)). In the picture
above the icon names are "mail-mark-unread", "weather-overcast" and "calc" respectively.



