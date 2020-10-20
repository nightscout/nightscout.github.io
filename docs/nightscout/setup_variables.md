# Nightscout Configuration

</br>

A complete list and description is available here: [https://github.com/nightscout/cgm-remote-monitor#environment](https://github.com/nightscout/cgm-remote-monitor#environment)

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

!!! info "More variables for `MMCONNECT` are available [here](https://github.com/nightscout/cgm-remote-monitor#mmconnect-minimed-connect-bridge) for you to add and edit in [Heroku](../setup_variables#editing-config-vars-in-heroku). "

------

**MONGO_COLLECTION `Required`**

The Mongo collection where CGM data is stored.

!!! warning "This string is vital to your Nightscout functioning: it is the link that will allow access to the database where all your data is stored in the cloud. A wrong connection string will prevent your site to open and your data to upload in Nightscout"

An Atlas database string will look like this:

`mongodb+srv://nightscout:<password>@cluster0.xxxxx.mongodb.net/<dbname>?retryWrites=true&w=majority`

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

# Plugins

Plugins are used to extend the way information is displayed, how notifications are sent, alarms are triggered, and more.

If you want the `ENABLE`'d plugins to show by default on any browser, you should put them in the `SHOW_PLUGINS` variable.

If you want to specifically disable a plugin (mainly a default plugin) you should place it in the `DISABLE` variable.

You also can enable them manually on your Nightscout view from the drawer menu. `Authenticate` and `Save` the settings on your browser.

<img src="..\img\SetupNS09.png" style="zoom:80%;" />

</br>

## Default Plugins

Below some default plugins: `timeago`, `upbat`, `direction` and `delta`.

Hovering the mouse on (computer) or touching (touch screen) some plugins will give you additional information.

##### `timeago` (Time Ago)

Displays the time since last CGM entry. Use these extended setting to adjust behavior:

- `TIMEAGO_ENABLE_ALERTS` (`false`) - Set to `true` to enable stale data alarms via Pushover and IFTTT.
- `ALARM_TIMEAGO_WARN` (`on`) - possible values `on` or `off`
- `ALARM_TIMEAGO_WARN_MINS` (`15`) - minutes since the last reading to trigger a warning
- `ALARM_TIMEAGO_URGENT` (`on`) - possible values `on` or `off`
- `ALARM_TIMEAGO_URGENT_MINS` (`30`) - minutes since the last reading to trigger a urgent alarm

##### `upbat` (Uploader Battery)

Displays the most recent battery status from the uploader phone. Use these extended setting to adjust behavior:

- `UPBAT_ENABLE_ALERTS` (`false`) - Set to `true` to enable uploader battery alarms via Pushover and IFTTT.
- `UPBAT_WARN` (`30`) - Minimum battery percent to trigger warning.
- `UPBAT_URGENT` (`20`) - Minimum battery percent to trigger urgent alarm.

##### `delta` (BG Delta)

Calculates and displays the change between the last 2 BG values. Delta shows a `*` if time difference is more than 5 minutes.

##### `direction` (BG Direction)

Displays the trend direction.

<img src="..\img\SetupNS11.png" style="zoom:80%;" />

</br>

##### `devicestatus` (Device Status)

Used by `upbat` and other plugins to display device status info. Supports the `DEVICESTATUS_ADVANCED="true"` extended setting to send all device statuses to the client for retrospective use and to support other plugins.

Example: `upbat` information using `devicestatus`.

<img src="..\img\SetupNS20.png" style="zoom:80%;" />

</br>

##### `ar2` (AR2 Forecasting)

Generates alarms based on forecasted values. See [Forecasting using AR2 algorithm](https://github.com/nightscout/nightscout.github.io/wiki/Forecasting)

- Enabled by default if no thresholds are set **OR** `ALARM_TYPES` includes `predict`.
- `AR2` forecasting display can be enabled/disabled from `... `
- Use extended settings to adjust AR2 behavior:
  - `AR2_CONE_FACTOR` (`2`) - to adjust size of cone, use `0` for a single line.

<img src="..\img\SetupNS10.png" style="zoom:80%;" />

</br>

##### `simplealarms` (Simple BG Alarms)

Uses `BG_HIGH`, `BG_TARGET_TOP`, `BG_TARGET_BOTTOM`, `BG_LOW` thresholds to generate alarms.

Simple alarms are enabled by default if one of the `BG_HIGH`, `BG_TARGET_TOP`, `BG_TARGET_BOTTOM`, `BG_LOW` thresholds is set or `ALARM_TYPES` includes `simple`.

You'll find the plugin in the drawer menu. You can change thresholds in `Profile editor`.

You can click the loudspeaker icon to test the alarms volume or to snooze an active alarm.

<img src="..\img\SetupNS12.png"/>

</br>

##### `profile` (Treatment Profile)

Add a link in the drawer menu to Profile Editor and allows to enter treatment profile settings. Also uses the extended setting:

- `PROFILE_HISTORY` (`off`) - possible values `on` or `off`. Enable/disable NS ability to keep history of your profiles (still experimental)
- `PROFILE_MULTIPLE` (`off`) - possible values `on` or `off`. Enable/disable NS ability to handle and switch between multiple treatment profiles

More variables of your profile will be used by Nightscout plugins like treatments, see [here](https://github.com/nightscout/cgm-remote-monitor#treatment-profile). 

<img src="..\img\SetupNS13.png"/>

</br>

##### `dbsize` (Database Size)

Show size of Nightscout Database, as a percentage of declared available space or in MiB.

Many deployments of Nightscout use free tier of MongoDB Atlas on Heroku, which is limited in size to 512MiB. After some time, as volume of stored data grows, it may happen that this limit is reached and system is unable to store new data. This plugin provides pill that indicates size of Database and shows (when configured) alarms regarding reaching space limit.

**IMPORTANT:** This plugin can only check how much space database already takes, *but cannot infer* max size available on server for it. To have correct alarms and realistic percentage, `DBSIZE_MAX` need to be properly set - according to your mongoDB hosting configuration.

**NOTE:** This plugin rely on db.stats() for reporting *logical* size of database, which may be different than *physical* size of database on server. It may work for free tier of MongoDB on Atlas, since it calculate quota according to logical size too, but may fail for other hostings or self-hosted database with quota based on physical size.

**NOTE:** MongoDB Atlas quota is for **all** databases in cluster, while each instance will get only size of **its own database only**. It is ok when you only have **one** database in cluster (most common scenario) but will not work for multiple parallel databases. In such case, spliting known quota equally beetween databases and setting `DBSIZE_MAX` to that fraction may help, but wont be precise.

All sizes are expressed as integers, in *Mebibytes* `1 MiB == 1024 KiB == 1024*1024 B`

- `DBSIZE_MAX` (`496`) - Maximal allowed size of database on your mongoDB server, in MiB. You need to adjust that value to match your database hosting limits - default value is for standard Heroku mongoDB free tier.
- `DBSIZE_WARN_PERCENTAGE` (`60`) - Threshold to show first warning about database size. When database reach this percentage of `DBSIZE_MAX` size - pill will show size in yellow.
- `DBSIZE_URGENT_PERCENTAGE` (`75`) - Threshold to show urgent warning about database size. When database reach this percentage of `DBSIZE_MAX` size, it is urgent to do backup and clean up old data. At this percentage info pill turns red.
- `DBSIZE_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications about database size.
- `DBSIZE_IN_MIB` (`false`) - Set to `true` to display size of database in MiB-s instead of default percentage.

<img src="..\img\SetupNS15.png"/>

</br>

## Advanced Plugins

##### `careportal` (Careportal)

An optional form to enter treatments.

Care Portal is an important plugin that gives access to the `Log a treatment` interface. Unlock it entering your API secret with the lock icon top right, then use the `+` icon to log a treatment. 

<img src="..\img\SetupNS14.png" style="zoom:80%;" />

</br>

##### `boluscalc` (Bolus Wizard)

Bolus Wizard plugin gives access to the `Bolus Wizard` interface. You can access it with the calculator icon top right. 

<img src="..\img\SetupNS16.png" style="zoom:80%;" />

</br>

##### `food` (Custom Foods)

Custom Foods enabled by the variable `food` allows to to customize your food database and adds a `Food Editor` entry in the menu.

<img src="..\img\SetupNS17.png" style="zoom:80%;" />

</br>

##### `rawbg` (Raw BG)

Calculates BG using sensor and calibration records from and displays an alternate BG values and noise levels. Defaults that can be adjusted with extended setting. Raw BG will only display if your sensor provides this data, your bridge device transfers it and your uploader sends it to Nightscout.

- `DISPLAY`(`unsmoothed`) - Allows the user to control which algorithm is used to calculate the displayed raw BG values using the most recent calibration record.

  - ​	`unfiltered` - Raw BG is calculated by applying the calibration to the glucose record's unfiltered value.

  - `filtered` - Raw BG is calculated by applying the calibration to the glucose record's filtered value. The glucose record's filtered values are generally produced by the CGM by a running average of the unfiltered values to produce a smoothed value when the sensor noise is high.

  - `unsmoothed` - Raw BG is calculated by first finding the ratio of the calculated filtered value (the same value calculated by the `filtered` setting) to the reported glucose value. The displayed raw BG value is calculated by dividing the calculated unfiltered value (the same value calculated by the `unfiltered` setting) by the ratio. The effect is to exagerate changes in trend direction so the trend changes are more noticeable to the user. This is the legacy raw BG calculation algorithm.

<img src="..\img\SetupNS21.png" style="zoom:40%;" />

</br>

##### `iob` (Insulin-on-Board)

Adds the IOB pill visualization in the client and calculates values that used by other plugins. Uses treatments with insulin doses and the `dia` and `sens` fields from the [treatment profile](https://github.com/nightscout/cgm-remote-monitor#treatment-profile).

##### `cob` (Carbs-on-Board)

Adds the COB pill visualization in the client and calculates values that used by other plugins. Uses treatments with carb doses and the `carbs_hr`, `carbratio`, and `sens` fields from the [treatment profile](https://github.com/nightscout/cgm-remote-monitor#treatment-profile).

When you enter the information with the Care Portal or Nightscout receives if from the uploader, you can see remaining insulin on board and carbs. 

<img src="..\img\SetupNS18.png" style="zoom:80%;" />

</br>

##### `bwp` (Bolus Wizard Preview)

This plugin in intended for the purpose of automatically snoozing alarms when the CGM indicates high blood sugar but there is also insulin on board (IOB) and secondly, alerting to user that it might be beneficial to measure the blood sugar using a glucometer and dosing insulin as calculated by the pump or instructed by trained medicare professionals. ***The values provided by the plugin are provided as a reference based on CGM data and insulin sensitivity you have configured, and are not intended to be used as a reference for bolus calculation.*** The plugin calculates the bolus amount when above your target, generates alarms when you should consider checking and bolusing, and snoozes alarms when there is enough IOB to cover a high BG. Uses the results of the `iob` plugin and `sens`, `target_high`, and `target_low` fields from the [treatment profile](https://github.com/nightscout/cgm-remote-monitor#treatment-profile). Defaults that can be adjusted with [extended setting](https://github.com/nightscout/cgm-remote-monitor#extended-settings)

- `BWP_WARN` (`0.50`) - If `BWP` is > `BWP_WARN` a warning alarm will be triggered.
- `BWP_URGENT` (`1.00`) - If `BWP` is > `BWP_URGENT` an urgent alarm will be triggered.
- `BWP_SNOOZE_MINS` (`10`) - minutes to snooze when there is enough IOB to cover a high BG.
- `BWP_SNOOZE` - (`0.10`) If BG is higher then the `target_high` and `BWP` < `BWP_SNOOZE` alarms will be snoozed for `BWP_SNOOZE_MINS`.

<img src="..\img\SetupNS19.png" style="zoom:80%;" />