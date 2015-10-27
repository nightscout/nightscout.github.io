---
geometry: margin=1in
title: Set up MiniMed Connect with Nightscout on Azure
author: Mark Wilson
layout: post
tags: ['guide','post']
---

# Set up MiniMed Connect with Nightscout on Azure

This setup guide will enable you to bridge data from the MiniMed Connect into a Nightscout site running on Azure. If you use a Medtronic Enlite CGM, you will be able to view the numbers and trends from the CGM in Nightscout. If you use a Medtronic insulin pump compatible with the Connect, you will be able to pump status data such as active insulin in Nightscout.

**NOTE:** You will **not** be able to see the amounts of specific boluses or glucose values from linked meters. This bridge can only see the data which is visible in [CareLink Connect][carelink].

## Step 0: Prerequisites

You should already have:
* a MiniMed Connect and compatible pump
* an iPhone running the MiniMed Connect app
* a username and password for CareLink

You should already be able to:
* see real-time values from the Connect (sensor glucose, active insulin, etc.) in the iPhone app
* log into [CareLink] on your web browser using your username and password, go to the CareLink Connect section, and see the same values

If you haven’t achieved the above, read the online help or contact Medtronic support.

## Step 1: Set up Nightscout on Azure

*Note: If you already have a Nightscout site running on Azure, you may skip this step. Instead, use the [Nightscout Update Fork Tool] to ensure that your site is running the latest version of Nightscout.*

Follow all the steps in the [Nightscout with iOS and Dexcom Share Bridge] setup guide **except step 4**. Set aside a decent amount of time to get through it. We can use this guide because the MiniMed Connect plugin works very similarly to the Dexcom Share Bridge plugin, except instead of reading data sent to Dexcom's servers by the Dexcom Share app, it reads data sent to Medtronic's servers by the MiniMed Connect app.

If you need more help or need to troubleshoot a step of this process, the main [Nightscout setup guide] walks through each of the steps in more detail. Just keep in mind this is an "alternate setup," so ignore any reference to a rig or an Android phone or app.

By the end of this, you should have a GitHub account, a MongoLab account, and an Azure account with a running Nightscout website. You should be able to access your website at https://YOURSITENAME.azurewebsites.net/.

## Step 2: Enable the MiniMed Connect plugin

**2a.** In your Azure dashboard, go to "Configure", and scroll down to "Connection Strings". (This is the same place you just configured your Mongo database and API_SECRET in step 1.)

**2b.** Add these new connection strings:

* `ENABLE` - the value should be "mmconnect", type should be "Custom"
* `MMCONNECT_USER_NAME` - the value should be the username you use to log in to [CareLink], type should be "Custom"
* `MMCONNECT_PASSWORD` - the value should be the password you use to log in to [CareLink], type should be "Custom"

Your connection strings section should look like this (sensitive information redacted):

![connection-strings](http://i.imgur.com/wSRJ8LM.png)

*Note: If this is not your first time setting up Nightscout, there is a possibility that you already have an `ENABLE` connection string. That’s fine. Just add a space and "mmconnect" to the end. For example, if `ENABLE` already had the value `bridge`, change it to `bridge mmconnect`.*

**2c.** Triple-check the connection strings. Go to the [CareLink] website and log in by copying and pasting the values directly from your Azure dashboard into the login form. Confirm that (a) you are able to log in successfully, and (b) when you go to "CareLink Connect", you can see the real-time values from the Connect.

**2d.** At the bottom of the Azure dashboard, click "Save", then "Reload".

## Step 3: Enjoy

Follow optional parts of the [Nightscout setup guide] to view your Nightscout data on a native smartphone app, a Pebble smartwatch, and more.

[CareLink]: https://carelink.minimed.com/
[Nightscout with iOS and Dexcom Share Bridge]: http://www.nightscout.info/wiki/welcome/nightscout-with-ios-and-dexcom-share
[Nightscout Update Fork Tool]: http://nightscout.github.io/pages/update-fork/
[Nightscout setup guide]: http://www.nightscout.info/wiki/welcome
