# Supported Uploaders

</br>

An **Uploader** is a mechanism or system for uploading the CGM data from your sensor to your Nightscout site. This can be either an electronic solution (usually for older devices), or just a simple app installed on your phone (for most newer systems) that connects to the sensor/pump and then uploads this data.

The type of Uploader needed will depend on the type of CGM system being used. In this page, we will break the different systems down by manufacturer, then further by sensor type.

Once you are clear about the type of sensor and upload system you will be using, you can find detailed configuration information for each one [here](./setup.md).
</br>
</br>

## Dexcom

#### Dexcom G5/G6

<img src="..\img\Upload02.png" />

If you are using the Dexcom G5 and G6 sensors connected to the Dexcom app on your phone, it will upload directly to the Dexcom servers (also still known as "Dexcom Share") and you won't need to use any extra uploader or master device. 

For this to work, Nightscout must be configured to use the `bridge` plug-in and will then automatically pull the CGM information directly from the Dexcom servers in real-time.

!!!note  
    If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing data using Dexcom Share and the `bridge` plugin.

*Please note that at this time (early 2021), the Dexcom G5 system is effectively obsolete but many people are still using stocks of old sensors and transmitters.*

If you don't want to use the official Dexcom apps, then you can use **open-source software** apps for your Dexcom sensor to connect, display, alarm and also upload to Nightscout:

**Android**: xDrip+ for G4, G5 and G6. <!-- xDrip+ for G4 (1)(2)(3), G5 and G6. -->

**iOS**: Spike or xDrip4iOS for G4, G5 and older G6 transmitters (**not Firefly**) <!-- Spike or xDrip4iOS for G4 (1)(3) -->

<img src="..\img\Upload03.png" />

!!! info "Dexcom "Firefly" Transmitters"
    Any transmitter made before Dexcom switched to the "firefly" range of G6 transmitters is compatible with **Spike** or **xDrip4iOS**. Although there are *slight* physical differences, the easiest way to check is to look at the Transmitter ID. If it starts with **80xxxx** or **81yxxx** (where **y** is a number) then it is a pre-Firefly transmitter and is compatible. 
    
    Most of the useable transmitters that fall into this category at the present time (early 2021) are generally rebatteried or rechargeable/modified 80xxxx or 81xxxx transmitters.


Loop and AAPS will upload your data directly to Nightscout and will act as uploaders.
</br>
</br>

#### Dexcom G4 *(now obsolete)*

<img src="..\img\Upload01.png" />

The Dexcom G4 system is now Dexcom G4 requires additional hardware, like a [Wixel](https://github.com/StephenBlackWasAlreadyTaken/xDrip/wiki/xDrip-Wireless-Bridge), an xDripKit or a compatible Android phone with an OTG cable connected to the receiver.

Dexcom G4 Platinum (Share) requires you to carry the receiver to forward data to the uploader.
</br>
</br>

## Medtronic

If your sensor system is able to directly upload to CareLink then Nightscout might be able to get the information directly from the cloud using the `mmconnect` plugin. Unfortunately, this is **not possible anymore using Heroku** without a bridge device.

You can use an Android phone with a [private version of xDrip+](https://github.com/benceszasz/xDripCareLinkFollower) (see also [here](https://bigdigital.home.blog/category/xdrip/) for a customized version for smartbands), a [computer](https://github.com/FredMK/minimed-connect-to-nightscout-wrapper) or a [Raspberry Pi](https://github.com/psonnera/minimed-connect-to-nightscout-wrapper/wiki) to bridge CareLink to Nightscout.

<img src="..\img\Upload04.png" />
</br>
</br>

If this isn't an option and your sensor/transmitter is connected to your pump (Medtronic 600 series pumps), then you'll need an Android phone connected with an OTG cable to your pump's connected glucose meter. The phone will need to run the [600 Series Uploader](http://pazaan.github.io/600SeriesAndroidUploader/) app.

<img src="..\img\Upload05.png" />
</br>

</br>

## Glucomen Day

You can forward your data from GlucoLog Web using an AWS bridge documented [here](https://github.com/yaronkhazai/gmns-bridge/tree/main/guides).

</br>

</br>

## Tandem t:slim X2

You can synchronize your treatments one way from your Tandem Diabetes t:connect web/mobile application to Nightscout using  a bridge app running via **Pipenv** or **Docker** as documented [here](https://github.com/jwoglom/tconnectsync).

</br>

</br>

## Abbott Freestyle Libre

Non Bluetooth-enabled Freestyle Libre sensors will need an additional transmitter device fixed on top of the sensor to send readings to the uploader device. In release order here are some transmitter options: [LimiTTer](https://github.com/JoernL/LimiTTer), BlueReader, Blucon, MiaoMiao, Bubble, and Droplet.

!!! warning "Transmitter Compatibility"
    The Libre environment is complex and evolves quickly. Before buying a transmitter, please join the respective Facebook groups and make sure that the transmitter you are planning to buy is compatible with your sensor type.

Most of the transmitters have their own proprietary apps. Nearly all of these support the uploading of data to Nightscout (LinkBluCon, Tomato, Diabox, eDroplet, ...). Again, check the transmitter manufacturer's website and the relevant Facebook support groups for information.

**Open-source apps** such as **xDrip+**, **Spike** and **xDrip4iOS** also support most of the above transmitter devices.

You can connect to the Libre 2 sensor (**EU only**) without an additional transmitter using [xDrip+](https://www.minimallooper.com/post/how-to-setup-freestyle-libre-2-and-oop2-to-use-a-native-bluetooth-connection-in-xdrip), Diabox or [xDrip4iOS](https://xdrip4ios.readthedocs.io/en/latest/connect/cgm/#libre).
</br>
</br>

## Eversense

In order to get data from the Eversense CGM system, you will need to use the [ESEL](https://github.com/BernhardRo/Esel) app running on an Android phone.

<img src="..\img\Upload06.png" />