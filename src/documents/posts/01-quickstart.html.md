---
title: Nightscout Quickstart Guide, Draft
layout: post
tags: ['guide','quickstart','post']
---

Nightscout is educational source code for monitoring estimated glucose
values from a Dexcom G4 Receiver.  The following steps describe how
one might use Nightscout.


### **Disclaimer**

> All information, thought, and code described here is intended for
> informational and educational purposes only. Use of code from
> github.com/rnpenguin is without warranty or support of any kind.
> Please review the LICENSE found within each repository for further
details. Do not use the information or code to make medical decisions.

Most likely, you will find yourself with a broken Dexcom receiver.
The reciever's USB port was not intended to be used often.  Even
careful users report broken USB ports.

## Basic Concept of Operations

  1. Dexcom G4 Sensor / Transmitter sends wireless signal to Dexcom G4
     Receiver
  1. Dexcom G4 Receiver is connected via USB OTG (On The Go) cable to
     an Android Uploader Device
  1. Android Uploader Device sends data to MongoDB database somewhere
     in the Cloud
  1. Cloud Service hosts a Node.js server, which serves pages to
     endpoint devices
  1. Endpoint devices display glucose information and generate audible
     alerts

## Specific Instructions

It will be easier to follow along if you print these instructions.
This document describes the steps to deploy Nightscout on the
following hardware / services:
  * Dexcom G4 Receiver
  * Moto G phone (for uploading from the Dexcom)
  *  Mongolab (for storing data on the cloud)
  *   Microsoft Azure (for serving web pages)

Setup should take about an hour.  Don’t skip steps, and please see
instructions at the end if you have any suggestions for improving the
clarity / correctness of these instructions.

### Dexcom G4 Receiver

**Important: the USB jack is very fragile.**
Many people have broken their jack. 

  1. If a cable is plugged into the jack and the receiver is dropped
     it may break
  1. Repeated plugging / unplugging may cause it to break
  1. Various hacks (styrofoam, fishing tackle cases, person game
     system cases, pouches) have been used to protect the cable
     connection.  Drilling a hole in the case above the jack and
     filling it with 5 minute epoxy may provide additional mechanical
     strength.

### Moto G phone – get a phone, unlock it, and root it

  1. Buy the version of the phone which will work with your preferred
     cellular provider

     *  Keep in mind this phone’s primary purpose is an uploader.
        Because it must remain connected to the Dexcom receiver which
        has a fragile USB connection, it is best to minimize its use an
        actual phone.

     The phone will need to be unlocked and “rooted” for the software
     to turn the USB power off between uploads (otherwise the Dexcom
     will charge, draining the phone’s battery)
     Following the unlocking and rooting instructions here:

       * http://androidadvices.com/root-moto-g-android-phone-firmware-guide/#.U1cii_ldWCk
       * https://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-b
       * http://www.technewscentral.co.uk/how-to-enable-usb-debugging-and-developer-options-in-android-4-2-and-higher-android-4-2android-4-3android-4-4/id_7250
       * http://www.swedroid.se/forum/showthread.php?t=106595
       * http://forum.xda-developers.com/showthread.php?t=2585755  

  2. Set up web access (wifi, cellular)

     * Put the phone aside for a moment, and set up MongoLab
     * Do not upgrade the Android OS or return it to factory defaults,
       or the phone will need to be re-rooted.
        
### MongoLab
Sign up for a free account at http://www.mongolab.com and

record the information you provide:

```
       account name: _______
       username: _______
       email: _______
       password: _______
       database user: _______ (e.g. sallyuser)
       database user password: _______ (e.g. sallypassword)
       Cloud Provider: _______ (e.g. amazon webservices)
       Location: ____________ (e.g. Amazon’s US East (Virginia) Region
       (us-east-1)
       Plan: Single-node (development), Sandbox
       New destination database name: _________ (e.g. nightscout)
       Add a collection: _______ (e.g. sally)
       Once all has been configured, on the Database summary page,
       copy the link under “To connect using a driver via the standard
       URI”, as this will be used to configure both the Android App
       and the Node.js server.  It will look something like this:
       mongodb://sallyuser:sallypassword@ds011111.mongolab.com:11111/nightscout

```

The 500MB free tier should be enough to store 10 years of data

### Moto G

Compile and Install the uploader

#### setup
[Download and install Android Studio](http://developer.android.com/sdk/installing/studio.html),
along with any updates,

> Through the rooting procedure on the Moto G, [usb debugging should
  already be enabled](http://developer.android.com/tools/device.html).

#### Start a new project
Start a new project, and `git` the [source
code](https://github.com/rnpenguin/dexcom-uploader.git) In
UploadHelper.java, near the very top, enter the URI information
from the Mongolab setup above.  It will look something like:

```java
private String
DB_URI="mongodb://sallyuser:sallypassword@ds011111.mongolab.com:11111/nightscout";
private String DB_COLLECTION = "sally";
```

#### Compile, and install

Connect the Moto G with a USB cable, and click **Run** to install the
application on the Moto G.

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
into the database.

Android Studio also provides a way to “package” the app as an apk,
which can then be attached to an email.  On Android devices, the gmail
app is smart enough to install apps which are attached to emails.  In
this way, it is very easy to deploy the app to other devices such as
tablets or micro pcs.  These are especially useful for bedside
monitoring, since they have their own source of external power.  For
more information, see:

* http://developer.android.com/tools/publishing/publishing_overview.html
 
### Microsoft Azure – cloud service to host website (free)
  * [Sign into Github.com](https://github.com/) with a free account.
  * [![fork](http://i.imgur.com/gR4wJ24.png) the cgm-remote-monitor](https://github.com/nightscout/cgm-remote-monitor/fork)

  * Visit http://azure.microsoft.com
  * Click “Try for free”
  * Enter or create username: `_________` (e.g. sally@outlook.com)
  * Enter or create password: `_________`
  * Enter credit card information (will not be billed, ever, without
    your permission)  
  * Go to the [Azure Portal](https://manage.windowsazure.com)
      Create a new Azure site
  * Choose a Site Name: `_________` `.azurewebsites.net`
    (e.g. **`nightscoutss`**`.azurewebsites.net`)
  * Configure connection strings
    Find the configure tab
    ![go to configure tab](http://i.imgur.com/dIPRHjt.png)

    Find the connection strings:
    ![connection strings](http://i.imgur.com/PZjxkjE.png)

    Enter your mongo details from before, using the `Custom` type, for
    `mongo` and `mongo_collection` keys.
    ![configure connection strings](http://i.imgur.com/YKVGcIP.png)
    The `mongo` key should be the `mongo://` url from the Android App.
    The `mongo_collection` key should match the collection.


  * Find setup deployment from the `Dashboard` tab of the project.
    ![find setup deployment ](http://i.imgur.com/6UnzWd4.png)
  * Select Github ![select github](http://i.imgur.com/iczHBW6.png)
  * Authorize Github/Azure access.
  * Find `cgm-remote-monitor`:
    ![find cgm-remote-monitor repo](http://i.imgur.com/KbhyIcx.png)

  * Confirm, watch the site deploy, it should deploy automatically.

  * Verify operation by visiting the site, e.g.
    `http://nightscoutss.azurewebsites.net`.

  * If blood glucose reaches a dangerous level, an alarm may sound and
    the blood glucose value in the upper right hand corner will turn
    into a red button.  Press the button to silence / acknowledge the
    alarm.  This will also silence the alarm for anyone else who is
    looking at the website.
  * For support, determine your Azure ftp username / password for azure
    website access by following these instructions:
    http://weblogs.asp.net/bleroy/archive/2012/06/12/azure-web-sites-ftp-credentials.aspx

### Pebble!

The Pebble works with your main phone, eg, your iPhone.
After getting a pebble watch, install the official Pebble App.

* You should be able to [install this pbw](/CGM.pbw)

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

* Go to Compilation tab
* Hit Run Build
* If your phone is in developer mode and everything is working,
  install and run:
  ![install and run](http://i.imgur.com/WYIMaAk.png)

* Visit the settings menu on the phone and enter the address of your
  `cgm-remote-monitor` from earlier.
  ![pebble settings app](http://i.imgur.com/IOoupMR.png)
  ![pebble config step one](http://i.imgur.com/Pb2DwMh.png)
  ![pebble config step two](http://i.imgur.com/YC64Sh0.png)

![with watch](http://i.imgur.com/tPFMMPl.png)

## **Pay it forward**

Help a friend.  Enhance Nightscout by providing feedback, ideas,
bug-fixes, and enhancements.



