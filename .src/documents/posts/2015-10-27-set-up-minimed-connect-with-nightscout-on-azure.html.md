---
geometry: margin=1in
title: Set up MiniMed Connect with Nightscout on Azure
author: Mark Wilson
layout: post
tags: ['guide','post']
---
# This guide is no longer current — please follow [this guide][newguide] instead
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

## Step 1: Set up Nightscout

*Note: If you already have a Nightscout site, you may skip this step. Instead, use the [Nightscout Update Fork Tool] to ensure that your site is running the latest version of Nightscout.*

Follow all the steps in the [Nightscout with iOS and Dexcom Share Bridge] setup guide **except step 4**. Set aside a decent amount of time to get through it. We can use this guide because the MiniMed Connect plugin works very similarly to the Dexcom Share Bridge plugin, except instead of reading data sent to Dexcom's servers by the Dexcom Share app, it reads data sent to Medtronic's servers by the MiniMed Connect app.

If you need more help or need to troubleshoot a step of this process, the main [Nightscout setup guide] walks through each of the steps in more detail. Just keep in mind this is an "alternate setup," so ignore any reference to a rig or an Android phone or app.

By the end of this, you should have a GitHub account, a MongoLab account, and an Azure or Heroku account with a running Nightscout website. You should be able to access your website at https://YOURSITENAME.azurewebsites.net/ or https://YOURSITENAME.herokuapp.com/.

## Step 2: Enable the MiniMed Connect plugin

*Note: the instructions below are for Azure. If you are on Heroku (which is far more stable but costs $7/month), the steps are very similar, but on Heroku these settings are called "Config Variables", not "Connection Strings". You can access them by going to Settings > Config Vars in the Heroku control panel.*

**2a.** In your Azure dashboard, go to "Configure", and scroll down to "Connection Strings". (This is the same place you just configured your Mongo database and API_SECRET in step 1.)

**2b.** Add these new environment variables:

* `ENABLE` - the value should be "mmconnect", type should be "Custom"
* `MMCONNECT_USER_NAME` - the value should be the username you use to log in to [CareLink], type should be "Custom"
* `MMCONNECT_PASSWORD` - the value should be the password you use to log in to [CareLink], type should be "Custom"

Your "Connection Strings" section should look like this (sensitive information redacted):

![connection-strings](http://i.imgur.com/wSRJ8LM.png)

*Note: If this is not your first time setting up Nightscout, there is a possibility that you already have an `ENABLE` environment variable. That’s fine. Just add a space and "mmconnect" to the end. For example, if `ENABLE` already had the value `bridge`, change it to `bridge mmconnect`.*

**2c.** Triple-check the environment variables. Go to the [CareLink] website and log in by copying and pasting the values directly from your Azure dashboard into the login form. Confirm that (a) you are able to log in successfully, and (b) when you go to "CareLink Connect", you can see the real-time values from the Connect.

**2d.** At the bottom of the Azure dashboard, click "Save", then "Reload".

## Step 3: Show pump data in Nightscout (optional)

**IMPORTANT:** You must be running at least version 0.9 (Grilled Cheese) of Nightscout for these features.

### Showing pump IOB in Nightscout

![](http://i.imgur.com/4ziiUlx.png)

* Make sure you have a Nightscout site running at least version 0.9 (see "Set up Nightscout" above).
* Add `iob` to your `ENABLE` environment variable (the same place you added `mmconnect` earlier).
* Add a new environment variable `DEVICESTATUS_ADVANCED` with the value `true`
* Restart or redeploy your Nightscout site.
* Open the Settings sidebar on your Nightscout site and check the "Insulin-on-Board" checkbox.

### Showing pump reservoir and battery in Nightscout

![](http://i.imgur.com/w985H4Q.png)

* Add `pump` to your `ENABLE` environment variable.
* Restart or redeploy your Nightscout site.
* Open the Settings sidebar on your Nightscout site and check the "Pump" checkbox.

### Showing pump IOB on a Pebble watch

![](http://i.imgur.com/R3tH6FY.png)

After following the steps above, any Nightscout watchface capable of showing IOB will show pump IOB from MiniMed Connect. Each watchface has its own particular way of enabling IOB. You'll do this in the "Settings" screen on the Pebble app. For example, [Urchin](https://github.com/mddub/urchin-cgm/) has an "Insulin on board" option for the status bar. Some other watchfaces require you to type "IOB" in the "T1 name" field.

### Getting pump notifications from Nightscout

Nightscout can send you a notification for certain pump events: low reservoir, low battery, time since last data logged from the pump. These are generally sent to your phone via Pushover.

* If you haven't already, set up Pushover by following [this guide](http://www.nightscout.info/wiki/labs/pushover-in-funnel-cake).
* Add a new environment variable `PUMP_ENABLE_ALERTS=true`.
* Use [this list of environment variables for the pump plugin](https://github.com/nightscout/cgm-remote-monitor/#pump-pump-monitoring) to tweak the conditions under which you want to receive notifications. For example, if you want a "warning" notification when the reservoir is below 30 units, add the environment variable `PUMP_WARN_RES=30`.
* If you don't set a particular environment variable, it will use the default. You can see the defaults listed in the list of environment variables, in parentheses. For example, default is to warn when reservoir is below 10 units, battery is below 30%, or the pump data hasn't been logged for 30 minutes.

[newguide]: http://www.nightscout.info/wiki/welcome/set-up-nightscout-using-heroku
[CareLink]: https://carelink.minimed.com/
[Nightscout with iOS and Dexcom Share Bridge]: http://www.nightscout.info/wiki/welcome/nightscout-with-ios-and-dexcom-share
[Nightscout Update Fork Tool]: http://nightscout.github.io/pages/update-fork/
[Nightscout setup guide]: http://www.nightscout.info/wiki/welcome
