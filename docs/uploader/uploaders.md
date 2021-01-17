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

If your sensor system is able to directly upload to CareLink then Nightscout will be able to get the information directly from the cloud using the `mmconnect` plugin (not valid for the newer 780G pump).

<img src="..\img\Upload04.png" />
</br>
</br>

If this isn't an option and your sensor/transmitter is connected to your pump (Medtronic 600 series pumps), then you'll need an Android phone connected with an OTG cable to your pump's connected glucose meter. The phone will need to run the [600 Series Uploader](http://pazaan.github.io/600SeriesAndroidUploader/) app.

<img src="..\img\Upload05.png" />
</br>
</br>

## Abbott Freestyle Libre

Non Bluetooth-enabled Freestyle Libre sensors will need an additional transmitter device fixed on top of the sensor to send readings to the uploader device. In release order here are some transmitter options: [LimiTTer](https://github.com/JoernL/LimiTTer), BlueReader, Blucon, MiaoMiao, Bubble, and Droplet.

!!! warning "Transmitter Compatibility"
    The Libre environment is complex and evolves quickly. Before buying a transmitter, please join the respective Facebook groups and make sure that the transmitter you are planning to buy is compatible with your sensor type.

Most of the transmitters have their own proprietary apps. Nearly all of these support the uploading of data to Nightscout (LinkBluCon, Tomato, Diabox, eDroplet, ...). Again, check the transmitter manufacturer's website and the relevant Facebook support groups for information.

**Open-source apps** such as **xDrip+**, **Spike** and **xDrip4iOS** also support most of the above transmitter devices.

For Android uploader devices, this is the possibility to directly connect to the Libre 2 sensor (EU only) without an additional transmitter. Please read [here](https://androidaps.readthedocs.io/en/latest/EN/Hardware/Libre2.html) for more information.
</br>
</br>

## Eversense

In order to get data from the Eversense CGM system, you will need to use the [ESEL](https://github.com/BernhardRo/Esel) app running on an Android phone.

<img src="..\img\Upload06.png" />