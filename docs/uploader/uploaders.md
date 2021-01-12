# Supported uploaders

</br>

## Dexcom

(1) Dexcom G4 requires additional hardware, like a [Wixel](https://github.com/StephenBlackWasAlreadyTaken/xDrip/wiki/xDrip-Wireless-Bridge), an xDripKit or (2) a compatible Android phone with an OTG cable connected to the receiver.

<img src="..\img\Upload01.png" style="zoom:80%;" />

(3) Dexcom G4 Platinum (Share) requires you to carry the receiver to forward data to the uploader.

Dexcom G5 and G6 with the Dexcom app on your phone will upload directly to Dexcom servers and won't need an uploader: Nightscout will get the information directly with the `bridge` plugin.

<img src="..\img\Upload02.png" style="zoom:80%;" />

You can use open source uploaders for your Dexcom sensor but **no data will be sent to Clarity**:

Android: xDrip+ for G4 (1)(2)(3), G5 and G6.

iOS: Spike and xDrip4iOS for G4 (1)(3), G5 and old G6 transmitters (not Firefly).

<img src="..\img\Upload03.png" style="zoom:80%;" />

Loop and AAPS will upload your data directly to Nightscout and will act as uploaders.

## Medtronic

If your sensor uploads to CareLink Nightscout will get the information directly with the `mmconnect` plugin (except for 780G pump).

<img src="..\img\Upload04.png" style="zoom:80%;" />

Else you'll need an Android phone connected with an OTG cable to your pump Bluetooth glucometer like [this](http://pazaan.github.io/600SeriesAndroidUploader/).

<img src="..\img\Upload05.png" style="zoom:80%;" />

## Libre

Non Bluetooth Libre sensors need an additional transmitter device to send readings to the uploader. In release order you'll find these: [LimiTTer](https://github.com/JoernL/LimiTTer), blueReader, blucon, miaomiao, Bubble, and Droplet.

!!! warning "Libre sensors"
    The Libre environment is complex and evolves quickly. Make sure your sensor is compatible with the transmitter before buying hardware. Join the respective Facebook groups to decide which one to use.

All proprietary apps should support upload to Nightscout (LinkBluCon, Tomato, Diabox, eDroplet, ...).

[Setup your uploader](./setup.md).

Open source apps xDrip+, Spike and xDrip4iOS support some of these devices.

For using a Libre 2 sensor (EU only) without an additional transmitter: more information [here](https://androidaps.readthedocs.io/en/latest/EN/Hardware/Libre2.html).

## Eversense

You need [ESEL](https://github.com/BernhardRo/Esel) with an Android phone.

<img src="..\img\Upload06.png" style="zoom:80%;" />