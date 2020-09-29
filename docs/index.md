![](.\img\cropped-Header2.png)

</br>

# Welcome to Nightscout

</br>

## Introduction

Nightscout (CGM in the Cloud) is an open source, DIY project cloud application, which you can install yourself using free hosting from various cloud service providers. Once installed, Nightscout acts as a central repository of blood glucose and insulin dosing data for a single person, allowing you to view the CGM graph and other data anywhere using a web browser.

The CGM data is sent to Nightscout using an uploader application such as xDrip+, Spike and Medtronic uploader, running on a mobile phone carried by the person being monitored, or directly from your Dexcom or CareLink account. The application you'll need for uploading the data depends on which CGM device you're using.

In addition to viewing the data using a web browser, there are several applications available for mobile devices and smart watches, which allow you alternate ways to view the information.

</br>

<img src="./img/nscloud.png" width="800px">

</br>

Once you have Nightscout up and running, you'll get a view that looks something like this:

</br>

 <img src="./img/nightscout.jpg" width="600px">

</br>

</br>

!!!warning "Important"

    Please understand that this project:
    
    - Is highly experimental
    - Is not approved for therapy
    
      **You take full responsibility for building and running this system and do so at your own risk.**

</br>

## Development History

Nightscout was developed by parents of children with Type 1 Diabetes and has continued to be developed, maintained, and supported by volunteers. When first implemented, Nightscout was a solution specifically for remote monitoring of Dexcom G4 CGM data. Today, there are Nightscout solutions available for many CGM sensors. The goal of the project is to allow remote monitoring of a T1D’s glucose level using existing monitoring devices.

</br>

## What Does It Cost?

Cost varies based on the setup you will be using.

The online services and accounts needed to run a Nightscout site are free for most users.

</br>

## What Do I Need?

A CGM sensor, and an uploader:

### Dexcom

(1) Dexcom G4 requires additional hardware, like a [Wixel](https://github.com/StephenBlackWasAlreadyTaken/xDrip/wiki/xDrip-Wireless-Bridge), an xDripKit or (2) an Android phone with an OTG cable connected to the receiver as described [here](http://www.nightscout.info/wiki/welcome/basic-requirements).

(3) Dexcom G4 Platinum (Share) requires you to carry the receiver to forward data to the uploader.

Dexcom G5 and G6 with the Dexcom app on your phone will upload directly to Dexcom servers and won't need an uploader: Nightscout will get the information directly with the `bridge` plugin.

You can use open source uploaders for your Dexcom sensor:

Android: xDrip+ for G4 (1)(2)(3), G5 and G6.

iOS: Spike and xDrip4iOS for G4 (1)(3), G5 and old G6 transmitters (not Firefly).

Loop and AAPS will upload your data directly to Nightscout and will act as uploaders.

### Medtronic

If your sensor uploads to CareLink Nightscout will get the information directly with the `mmconnect` plugin.

Else you'll need an Android phone connected with an OTG cable to your pump Bluetooth glucometer like [this](http://pazaan.github.io/600SeriesAndroidUploader/).

### Libre

Non Bluetooth Libre sensors need an additional transmitter device to send readings to the uploader. In release order you'll find these: [LimiTTer](https://github.com/JoernL/LimiTTer), blueReader, blucon, miaomiao, Bubble and Droplet.

All proprietary apps should support upload to Nightscout.

Open source apps xDrip+, Spike and xDrip4iOS support most of these devices.

For Libre 2 more information [here](https://androidaps.readthedocs.io/en/latest/EN/Hardware/Libre2.html).

### Eversense

You need [ESEL](https://github.com/BernhardRo/Esel) with an Android phone and xDrip+.

</br>

## How to Use These Docs

* Use the navigation menu at the top of the screen to find the info you are looking for.
* A Table of Contents for the current page is always displayed on the left side of the screen.
* You can search the Nightscout Docs site by clicking the <img src="img/search_icon.png" width="50px"> icon.