# Nightscout Configuration

</br>

A complete list and description is available here: [https://github.com/nightscout/cgm-remote-monitor#environment](https://github.com/nightscout/cgm-remote-monitor#environment)

</br>

## Nightscout core Config Vars

</br>

When deploying Nightscout for the first time you are required to setup core config variables that are mandatory to the site functioning.

You will see them in the same order they appear when setting up a new site.

If you need to modify them later, you'll find them in [Heroku](../setup_variables#editing-config-vars-in-heroku).

From `Settings`, click on the  `Reveal Config Vars`

<img src="../img/config-vars.png" width="800">

</br>

------

### Alarms

!!! note "ALARMS"
    You can setup alarms, so that when your Nightscout page is open and the alarm enabled, above (HIGH) or below (LOW) a certain threshold, a sound might play.

**ALARM_HIGH**

Default setting for new browser views, for the High alarm (triggered when BG crosses BG_TARGET_TOP). ('on' or 'off')

```
on
```

**ALARM_LOW**

Default setting for new browser views, for the Low alarm (triggered when BG crosses BG_TARGET_BOTTOM). ('on' or 'off')

```
on
```

!!! note "TIMEAGO"
    Missing data alarms can also be setup, so that when your Nightscout page is open and the alarm enabled, after a certain time without receiveing BG, a sound might play.

**ALARM_TIMEAGO_URGENT**

Default setting for new browser views, for an urgent alarm when CGM data hasn't been received in the number of minutes set in ALARM_TIMEAGO_URGENT_MINS. ('on' or 'off')

```
on
```

**ALARM_TIMEAGO_URGENT_MINS**

Default setting for new browser views, for the number of minutes since the last CGM reading to trigger an ALARM_TIMEAGO_URGENT alarm.

```
30
```

**ALARM_TIMEAGO_WARN**

Default setting for new browser views, for a warning alarm when CGM data hasn't been received in the number of minutes set in ALARM_TIMEAGO_WARN_MINS. ('on' or 'off')

```
on
```

**ALARM_TIMEAGO_WARN_MINS**

Default setting for new browser views, for the number of minutes since the last CGM reading to trigger an ALARM_TIMEAGO_WARN alarm.

```
15
```

!!! note "TYPES"
    Keep the simple type so that the `BG_` parameters (setup below) will be used. 

**ALARM_TYPES**

'simple' and/or 'predict'. Simple alarms trigger when BG crosses the various thresholds set below. Predict alarms use a formula that forecasts where the BG is going based on its trend. You will *not* get warnings when crossing the BG thresholds set below when using the predict type.

```
simple
```

**ALARM_URGENT_HIGH**

Default setting for new browser views, for the Urgent High alarm (triggered when BG crosses BG_HIGH). ('on' or 'off')

```
on
```

**ALARM_URGENT_LOW**

Default setting for new browser views, for the Urgent Low alarm (triggered when BG crosses BG_LOW). ('on' or 'off')

```
on
```



------

!!! note "API Secret"
    This is the passcode that will be required by the uploader app (if any) to send data to your site, and that will allow you to modify your site parameters from the web interface. Keep it secret, only share it with trusted people, change it if you believe it's been exposed publicly. Minimum length is 12 characters, don't make it too long and do not put special characters in it (better stick to letters and numbers). It is case sensitive. 

**API_SECRET `Required`**

A passphrase that must be at least 12 characters long. Avoid 'special' characters, which can cause problems in some cases.

```
MyV3ry53cr37
```



------

!!! note "BG Thresholds"
    These values are the ones that will trigger the alarms defined above. They are expressed in the unit you will select below with `DISPLAY_UNITS`.

**BG_HIGH**

Urgent High BG threshold, triggers the ALARM_URGENT_HIGH alarm. Set in mg/dL or mmol/L, as set in DISPLAY_UNITS variable.

**BG_LOW**

Urgent Low BG threshold, triggers the ALARM_URGENT_LOW alarm. Set in mg/dL or mmol/L, as set in DISPLAY_UNITS variable.

**BG_TARGET_BOTTOM**

Low BG threshold, triggers the ALARM_LOW alarm. Set in mg/dL or mmol/L, as set in DISPLAY_UNITS variable.

**BG_TARGET_TOP**

High BG threshold, triggers the ALARM_HIGH alarm. Set in mg/dL or mmol/L, as set in DISPLAY_UNITS variable.

------

!!!info "Dexcom Bridge"
    Entering a `BRIDGE_PASSWORD` and `BRIDGE_USER_NAME` will allow you to receive your BG directly from Dexcom Share if you have a Dexcom sensor connected to a device that uploads it to the internet. This is possible with the Dexcom G5 and G6 apps on a mobile phone. For Dexcom G4 you need the original Nightscout project uploader with the receiver.

!!! note "Username and Password"
    To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging into your Dexcom account. *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

**BRIDGE_PASSWORD**

Your Dexcom account password, to receive CGM data from the Dexcom Share service. Also make sure to include 'bridge' in your ENABLE line.

!!! warning "Make sure you select the right country code!"

**BRIDGE_SERVER**

If you are bridging from the Dexcom Share service, and are anywhere *outside* the US, change this to EU. ('US' or 'EU')

```
US
```

```
EU
```

**BRIDGE_USER_NAME**

Your Dexcom account username, to receive CGM data from the Dexcom Share service. Also make sure to include 'bridge' in your ENABLE line.

</br>

!!! info "More variables for `BRIDGE` are available [here](https://github.com/nightscout/cgm-remote-monitor#bridge-share2nightscout-bridge) for you to add and edit in  [Heroku](../setup_variables#editing-config-vars-in-heroku)."

------

**CUSTOM_TITLE**

!!! note "This will change your Nightscout displayed name (top left) from default."

The display name for the Nightscout site. Appears in the upper left of the main view. Often set to the name of the CGM wearer.

<img src="..\img\SetupNS05.png" style="zoom:80%;" />

------

**DISPLAY_UNITS `Required`**

Preferred BG units for the site: 'mg/dl' or 'mmol/L' (or just 'mmol').

```
mg/dl
```

```
mmol
```

------

**ENABLE**

!!! warning "Select the right plugins! Better too many than not enough."

Plugins to enable for your site. Must be a space-delimited, lower-case list. 

```
careportal basal dbsize
```

Include the word 'bridge' here if you are receiving data from the Dexcom Share service.

```
careportal basal dbsize bridge
```

 Include 'mmconnect' if you are bridging from the MiniMed CareLink service.

```
careportal basal dbsize mmconnect
```

If you don't want to decide, add all the followings, you can disable them if you don't need them:

`careportal` `basal` `dbsize` `rawbg` `iob` `maker` `bridge` `cob` `bwp` `cage` `iage` `sage` `boluscalc` `pushover` `treatmentnotify` `mmconnect` `loop` `pump` `profile` `food` `openaps` `bage` `alexa` `override`

------

!!!info "CareLink MMConnect"
    Entering a `MMCONNECT_PASSWORD` and `MMCONNECT_USER_NAME` will allow you to receive your BG directly from CareLink if you have a Medtronic sensor connected to a device that uploads it to the internet. Connecting Nightscout to a Medtronic pump requires an uploader system as detailed [here](https://github.com/pazaan/600SeriesAndroidUploader/wiki).

**MMCONNECT_PASSWORD**

Your CareLink account password, to receive CGM data from the CareLink service. Also make sure to include 'mmconnect' in your ENABLE line.

!!! warning "Make sure you select the right country code!"

**MMCONNECT_SERVER**

If you are bridging from the CareLink service, and are anywhere *outside* the US, change this to EU. ('US' or 'EU')

```
US
```

```
EU
```

**MMCONNECT_USER_NAME**

Your CareLink account username, to receive CGM data from the CareLink service. Also make sure to include 'mmconnect' in your ENABLE line.

</br>

!!! info "More variables for `MMCONNECT` are available [here](https://github.com/nightscout/cgm-remote-monitor#mmconnect-minimed-connect-bridge) for you to add and edit in [Heroku](../setup_variables#editing-config-vars-in-heroku). "

------

!!! warning "This string is vital to your Nightscout functioning: it is the link that will allow access to the database where all your data is stored in the cloud. A wrong connection string will prevent your site to open and your data to upload in Nightscout"

An Atlas database string will look like this:

`mongodb+srv://nightscout:<password>@cluster0.xxxxx.mongodb.net/<dbname>?retryWrites=true&w=majority`

**MONGO_COLLECTION `Required`**

The Mongo collection where CGM data is stored.

------

**NIGHT_MODE**

Default setting for new browser views, for whether Night Mode should be enabled. ('on' or 'off')

```
off
```

------

**SHOW_PLUGINS**

Default setting for whether or not these plugins are checked (active) by default, not merely enabled. Include plugins here as in the ENABLE line; space-separated and lower-case.

------

**SHOW_RAWBG**

Default setting for new browser views, for the display of raw CGM data (if available). ('always', 'never', or 'noise')

------

**THEME**

Default setting for new browser views, for the color theme of the CGM graph. ('default', 'colors', or 'colorblindfriendly')

Default

<img src="..\img\SetupNS06.png" style="zoom:80%;" />

Colors

<img src="..\img\SetupNS07.png" style="zoom:80%;" />

Colorblind-friendly colors

<img src="..\img\SetupNS08.png" style="zoom:80%;" />



------

**TIME_FORMAT**

Default setting for new browser views, for the time mode. ('12' or '24')

```
12
```

```
24
```

</br>

## Editing Config Vars in Heroku

</br>

Once Nightscout deployed, you can access your variables from [Heroku](https://id.heroku.com/login).

- Select your app

<img src="..\img\SetupNS00.png" style="zoom:80%;" />

</br>

- Click `Settings`

<img src="..\img\SetupNS01.png" style="zoom:80%;" />

</br>

- Scroll down and click `Reveal Config Vars`

<img src="..\img\SetupNS02.png" style="zoom:80%;" />

</br>

- You can modify the values clicking on the pen icon

<img src="..\img\SetupNS03.png" style="zoom:80%;" />

</br>

- Change the contents of `Value`  as needed then click `Save Changes`

<img src="..\img\SetupNS04.png" style="zoom:80%;" />

</br>

Some variables changes might require you to restart all Dynos.



## Plugins

Work in progress...

