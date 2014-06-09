---
title: Android App
layout: guide
pageOrder: 6
tags: ['guide','quickstart','post']
---
### Moto G

Compile and Install the uploader

#### setup
[Download and install Android Studio](http://developer.android.com/sdk/installing/studio.html),
along with any updates,

> Through the rooting procedure on the Moto G, [usb debugging should
  already be enabled](http://developer.android.com/tools/device.html).

#### Start a new project
Start a new project, and `git` the
[source code](https://github.com/nightscout/dexcom-uploader.git)

One way to do that: is to visit https://github.com/nightscout/dexcom-uploader
![visit github](http://i.imgur.com/7QXcK4s.jpg)
And download the zip file directly from github.

Then import that zip file as a new project:
![import project](http://i.imgur.com/m4HN47j.jpg)
Select the zip file you just downloaded.

#### Compile, and install
Plug your phone into the computer, and select `Run`:  Troubleshooting tip: If the app does not install on your phone, double check the target device by selecting "Edit Configurations" under the Run tab of Android Studio.  Ensure that USB device is selcted as the target device, not Emulator.  
![run app](http://i.imgur.com/TxLrp6f.jpg)
These pictures were taken on a Mac.


##### Configure preferences
Go into the settings menu in the CGM android app.  It is in the upper right
corner or it might be accessed by pressing the menu button to the left of the home button of the smartphone.  Use your your **`mongo connection uri`** from above and fill in your collection name where requested.
<iframe class="imgur-album" width="100%" height="550" frameborder="0" src="http://imgur.com/a/gVYWC/embed"></iframe>
With Mongolab now set up, the application should be able to start
uploading.  Connect the Dexcom receiver to the Moto G.

> **Important**: when connecting the phone to the Dexcom, the OTG cable
> plugs into the phone, and the regular USB cable plugs into the
> Dexcom.  It will not work the other way, because OTG cables have
> pins 4 and 5 shorted on the microusb connector, the indication to
> the phone that an OTG device is connected.

During the initial connection, there may be a pop-up asking if the app
should have permission to run / access services.  Select yes.  The app
should load, and data should start flowing to Mongolab.
Using Mongolab credentials from above, verify that data is flowing
into the database by logging into MongoLab, and inspecting the collection you
created for any documents.

Android Studio also provides a way to “package” the app as an apk,
which can then be attached to an email.  On Android devices, the gmail
app is smart enough to install apps which are attached to emails.  In
this way, it is very easy to deploy the app to other devices such as
tablets or micro pcs.  These are especially useful for bedside
monitoring, since they have their own source of external power.  For
more information, see:

* http://developer.android.com/tools/publishing/publishing_overview.html
