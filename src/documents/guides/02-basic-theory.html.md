---
title: Basic Theory
layout: guide
pageOrder: 2
tags: ['guide','quickstart','post']
---

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

### Overview
![cgm in the cloud system](http://i.imgur.com/qrrq27j.jpg)

### OTG Cable
<iframe class="imgur-album" width="100%" height="550" frameborder="0" src="http://imgur.com/a/XRnU8/embed"></iframe>

Normally, mobile phones act as usb slaves.  This allows them to draw
power from the connected master, and allows the master to control
exchanging data such as music, pictures, and other files.
![normal-usb-slave](http://i.imgur.com/1MNdt83.jpg)

The USB `OTG` cable allows the phone to switch roles, becoming the
master side of the connection.
![mobile-otg-usb-master](http://i.imgur.com/xvKULj3.jpg)
This allows the mobile phone to control the Dexcom and provide power,
just like a laptop.


