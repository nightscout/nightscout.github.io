---
title: Pebble Smartwatch
layout: guide
pageOrder: 8
tags: ['guide','quickstart','post']
---

### Pebble!

The Pebble works with your main phone, eg, your iPhone.
After getting a pebble watch, install the official Pebble App.

#### Easy method

* Search **Watchfaces** for `Nightscout cgm` and install from Pebble
  App

#### Medium/Hard

If it says `Coming Soon`, you can _sideload_ the `pbw` by clicking on the link in your mobile browser
* [install this pbw](/CGM.pbw)

If you cannot here is how to compile a new one for yourself:

* On your Phone, enable `Developer Mode` in the Pebble App.
* Go to http://cloudpebble.net/, sign up for free account, log in
* `Import Project`
  ![import project](http://i.imgur.com/RvnrCXA.png)

* Enter these details
```
Project Name: anything you want
Github project: github.com/nightscout/cgm-pebble
IMPORT!
```

Make sure the phone is running in the Pebble App in developer mode.
To enable developer mode, go to
`settings -> Pebble -> Enable developer mode`.
Then open the pebble app, and enable developer mode.

* Go to Compilation tab
* Hit **Run Build**

* If your phone is in developer mode and everything is working,
  your phone will show up in a list, select the install and run:
  ![install and run](http://i.imgur.com/WYIMaAk.png)

* Visit the settings menu on the phone and enter the address of your
  `cgm-remote-monitor` from earlier.
  ![pebble settings app](http://i.imgur.com/IOoupMR.png)
  ![pebble config step one](http://i.imgur.com/Pb2DwMh.png)
  ![pebble config step two](http://i.imgur.com/YC64Sh0.png)

![with watch](http://i.imgur.com/tPFMMPl.png)
