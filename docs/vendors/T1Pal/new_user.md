# New T1Pal Users

</br>

### What Is T1Pal ?

T1Pal provides an always maintained and updated Nightscout site.

- **Privacy**. Unlike DIY, the default T1Pal site is private. Only the account owner can view Nightscout.
- Getting started guide explains getting glucose and insulin data into Nightscout.
- Storage is managed, never worry about MongoDB again.
- Unlimited Shares: Unlike most apps, there is no installation required for sharing Nightscout. Create as many secret sharing links as you like and share them with anyone you want. Revoke or delete access any time.

We make the technology behind Nightscout and manage it for you. There are some important differences between T1Pal and DIY. While most plugins are available, there are a few interacting with third party services that are on our future roadmap. See our [FAQ on differences between T1Pal DIY](https://t1pal.com/legal/faq_8_18_2020_13_38#compare-to-nightscout) for the full details.

</br>

------

#### **Here is an overview of the sequence required to create your Nightscout site with T1Pal .**

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../../vendors/img/T1Pal.png" style="zoom:80%;" />

------

</br>

## Create an account

</br>

Click this link [https://t1pal.com/getting-started/starting/home](https://t1pal.com/getting-started/starting/home)

Select `Select Plan`

<img src="../img/T1Pal01.png" style="zoom:80%;" />

</br>

Sign up with a Google account (create one if necessary)

<img src="../img/T1Pal02.png" style="zoom:80%;" />

</br>

Select a username, confirm mail and accept conditions. Click `Create My Account`

<img src="../img/T1Pal03.png" style="zoom:80%;" />

</br>

Enter your billing information and `Confirm`

</br>

## Configure your data source

</br>

!!!note  
     If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing from Dexcom Share.

</br>

Select your data source

<img src="../img/T1Pal04.png" style="zoom:80%;" />

</br>

If you use a Dexcom sensor enter your Clarity credentials then `Save connection`

<img src="../img/T1Pal05.png" style="zoom:80%;" />

</br>

If you're using another uploader select `review details`

<img src="../img/T1Pal06.png" style="zoom:80%;" />

Then `start uploading` in the `Using Nightscout uploaders?` section

<img src="../img/T1Pal07.png" style="zoom:80%;" />

</br>

Select `Create uploader`

<img src="../img/T1Pal08.png" style="zoom:80%;" />

</br>

In the upper part you'll find your Nightscout API_SECRET and below the URL, copy and paste them in your uploader. Refer to [uploader settings here](../../../uploader/setup).

<img src="../img/T1Pal09.png" style="zoom:80%;" />

</br>

If you're uploading from xDrip+ you can scan the QR code like this:

<img src="../img/T1Pal11.png" style="zoom:80%;" />

<img src="../img/T1Pal10.png" style="zoom:80%;" />

</br>

## Enable a treatments data source

</br>

If your uploader sends treatments (insulin, carbs, basal, ...) you can visualize therapy.

<img src="../img/T1Pal12.png" style="zoom:80%;" />

</br>

Enable `Visualize therapy` and select the data source, `Save changes`.

</br>

## View your site and create a new profile

</br>

From your account home, go to `Visit my Nightscout`

<img src="../img/T1Pal13.png" style="zoom:80%;" />

</br>

Upon first access you will be required to create a new profile. Select `OK`

<img src="../img/T1Pal14.png" style="zoom:80%;" />

</br>

File all required fields as shown [here](../../../nightscout/profile_editor/).

Make sure you enter your correct time zone.

You're automatically authenticated when accessing your site from the T1Pal portal.

</br>

## Configure more settings

</br>

You can change your default settings in the [Control Panel](https://www.t1pal.com/account/sites/my#Overview) from `Configure Nightscout`.

<img src="../img/T1Pal15.png" style="zoom:80%;" />

</br>

##### **API_SECRET**

!!! warning "This is an important password"
    Knowing your site's API Secret gives anybody full access to your Nightscout data, allows uploading to your site and uncontrolled access. Make sure you keep this password secret and avoid exposing it publicly.

To reveal the API_SECRET use the `Api Secret` button, it will display just below.

<img src="../img/T1Pal16.png" style="zoom:80%;" />

</br>

Use the View link below the Api Secret to quickly view your site.

<img src="../img/T1Pal17.png" style="zoom:80%;" />

</br>

##### **CUSTOM TITLE** (`Nightscout`)

<img src="../img/T1Pal19.png" style="zoom:80%;" />

!!! note "This will change your Nightscout displayed name (top left) from default."

The display name for the Nightscout site. Appears in the upper left of the main view. Often set to the name of the CGM wearer.

<img src="../img/SetupNS05.png" style="zoom:80%;" />

</br>

##### **CLOCK MODE**

<img src="../img/T1Pal18.png" style="zoom:80%;" />

Clock view will show you a simple view with your BG.

You can configure more clock views from your site, see [here](../../../nightscout/discover/#drawer-menu).

</br>

<img src="../img/T1Pal20.png" style="zoom:80%;" />

</br>

You can set your preferences on each browser view using the drawer menu then Settings.

<img src="../../../nightscout/img/UseNS21.png" style="zoom:80%;" />

<img src="../../../nightscout/img/UseNS23.png" style="zoom:80%;" />

If you want all browsers to open with a default configuration you need to customize it with the options shown below.

</br>

##### **TIME FORMAT** (`12`)

Possible values `12` or `24`

</br>

##### **THEME**

Default setting for new browser views, for the color theme of the CGM graph.

`default`

<img src="../../../nightscout/img/SetupNS06.png" style="zoom:80%;" />

`colors`

<img src="../../../nightscout/img/SetupNS07.png" style="zoom:80%;" />

</br>

##### **NIGHT MODE** (`off`) 

Possible values `on` or `off`

</br>

##### `basal` (Basal Profile)

<img src="../img/T1Pal21.png" style="zoom:80%;" />

Uses the `basal` field from the [treatment profile](https://github.com/nightscout/cgm-remote-monitor#treatment-profile).

- You can define the rendering of your basal, possible values are:

`none` (basal not displayed), 

`default`,

<img src="../../../nightscout/img/SetupNS29.png" style="zoom:70%;"/>

or `icicle` (inverted)

<img src="../../../nightscout/img/SetupNS28.png" style="zoom:70%;"/>

</br>

## Plugins

Plugins are used to extend the way information is displayed, how notifications are sent, alarms are triggered, and more.  

If you want the enabled plugins to **show by default on any browser**, you should add them to the `Enabled plugins` list.

<img src="../img/T1Pal22.png" style="zoom:80%;" />

To learn more about plugins see [here](../../../nightscout/setup_variables/#plugins).

</br>

##### **DISPLAY UNITS**

<img src="../img/T1Pal23.png" style="zoom:80%;" />

Preferred BG units for the site: `mg/dl` or `mmol` (mmol/l).

</br>

## Advanced Plugins:

##### `careportal` (Care Portal)

<img src="../img/T1Pal24.png" style="zoom:80%;" />

An optional form to enter treatments.

Care Portal is an important plugin that gives access to the `Log a treatment` interface. Unlock it entering your API secret with the lock icon top right, then use the `+` icon to log a treatment.  More information [here](../../../nightscout/discover/#add-a-treatment-careportal).

<img src="../../../nightscout/img/SetupNS14.png" style="zoom:80%;" />

</br>

##### `cage` (Cannula Age) / `sage` (Sensor Age) / `iage` (Insulin Age) / `bage` (Battery Age)

<img src="../../../nightscout/img/SetupNS23.png" style="zoom:80%;" />

##### `cage` (Cannula Age)

<img src="../img/T1Pal25.png" style="zoom:80%;" />

Calculates the number of hours since the last `Site Change` treatment that was recorded.

- `ENABLE ALERTS` (`display`) - Set to `alert` to enable notifications to remind you of upcoming cannula change.
- `CANNULA AGE DISPLAY` (`hours`) - Possible values are `hours` or `days`. If `days` is selected and age of canula is greater than 24h number is displayed in days and hours
- `CANNULA AGE INFO` (`44`) - If time since last `Site Change` matches this value, user will be warned of upcoming cannula change
- `CANNULA AGE WARNING` (`48`) - If time since last `Site Change` matches this value, user will be alarmed to to change the cannula
- `CANNULA AGE URGENT` (`72`) - If time since last `Site Change` matches this value, user will be issued a persistent warning of overdue change.

##### `sage` (Sensor Age)

<img src="../img/T1Pal26.png" style="zoom:80%;" />

Calculates the number of days and hours since the last `Sensor Start` and `Sensor Change` treatment that was recorded.

- `ENABLE ALERTS` (`display`) - Set to `alert` to enable notifications to remind you of upcoming sensor change.
- `SENSOR AGE INFO` (`144`) - If time since last sensor event matches this value, user will be warned of upcoming sensor change
- `SENSOR AGE WARNING` (`164`) - If time since last sensor event matches this value, user will be alarmed to to change/restart the sensor
- `SENSOR AGE URGENT` (`166`) - If time since last sensor event matches this value, user will be issued a persistent warning of overdue change.

##### `iage` (Insulin Age)

<img src="../img/T1Pal27.png" style="zoom:80%;" />

Calculates the number of days and hours since the last `Insulin Change` treatment that was recorded.

- `ENABLE ALERTS` (`display`) - Set to `alert` to enable notifications to remind you of upcoming insulin reservoir change.
- `INSULIN AGE INFO` (`44`) - If time since last `Insulin Change` matches this value, user will be warned of upcoming insulin reservoir change
- `INSULIN AGE WARNING` (`48`) - If time since last `Insulin Change` matches this value, user will be alarmed to to change the insulin reservoir
- `INSULIN AGE URGENT` (`72`) - If time since last `Insulin Change` matches this value, user will be issued a persistent warning of overdue change.

##### `bage` (Battery Age)

<img src="../img/T1Pal28.png" style="zoom:80%;" />

Calculates the number of days and hours since the last `Pump Battery Change` treatment that was recorded.

- `ENABLE ALERTS` (`display`) - Set to `alert` to enable notifications to remind you of upcoming pump battery change.

- `BATTERY AGE DISPLAY` (`days`) - Set to `hours` to display time since last `Pump Battery Change` in hours only.

- `BATTERY AGE INFO` (`312`) - If time since last `Pump Battery Change` matches this value hours, user will be warned of upcoming pump battery change (default of 312 hours is 13 days).

- `BATTERY AGE WARNING` (`336`) - If time since last `Pump Battery Change` matches this value hours, user will be alarmed to to change the pump battery (default of 336 hours is 14 days).

- `BATTERY AGE URGENT` (`360`) - If time since last `Pump Battery Change` matches this value hours, user will be issued a persistent warning of overdue change (default of 360 hours is 15 days).

  </br>

##### `pump` (Pump Monitoring)

<img src="../../../nightscout/img/SetupNS24.png" style="zoom:120%;" />

<img src="../img/T1Pal29.png" style="zoom:80%;" />

Generic Pump Monitoring

- `ENABLE ALERTS` (`display`) - Set to `alarm` to enable notifications for Pump battery and reservoir.
- `WARN ON SUSPEND` (`display`) - Set to `alert` to get an alarm when the pump is suspended.
- `PUMP FIELDS` - The fields to display by default. Any of the following fields: `reservoir`, `battery`, `clock`, `status`, and `device`
- `PUMP RETRO FIELDS` - The fields to display in retro mode. Any of the above fields.

</br>

## Alarms

These alarm setting affect all delivery methods (browser, Pushover, IFTTT, etc.). Values and settings entered here will be the defaults for new browser views, but will be overridden if different choices are made in the settings UI.

</br>

##### **ALARM TYPES** 

<img src="../img/T1Pal30.png" style="zoom:80%;" />

!!! note "TYPES"
    Keep the `simple` type if you want Custom threshold parameters (setup below) to be used. 

`Simple` and/or `Predictive`. 

Simple alarms trigger when BG crosses the various thresholds set below.

Predict alarms uses highly tuned formula that forecasts where the BG is going based on its trend. You will ***not*** get warnings when crossing any of the BG thresholds set below when using ***only*** the predict type.

</br>

<img src="../img/T1Pal31.png" style="zoom:80%;" />

##### **When last reading is more than**

A warning alarm when CGM data hasn't been received in the number of minutes set in the field. `warn` or `do nothing`.

##### **Urgent alarm when time ago exceeds** 

An urgent alarm when CGM data hasn't been received in the number of minutes set in the field. `alarm` or `do nothing`.

</br>

<img src="../img/T1Pal32.png" style="zoom:80%;" />

!!! note "BG Thresholds"
    These values are the ones that will trigger `simple` alarms. They are expressed in the unit you selected with `DISPLAY_UNITS`.

##### **High BG**

Urgent High BG threshold, triggers the `ALARM_URGENT_HIGH` alarm.

##### **Target Top**

High BG threshold, triggers the `ALARM_HIGH` alarm.

##### **Target Bottom**

Low BG threshold, triggers the `ALARM_LOW` alarm.

##### **Low BG**

Urgent Low BG threshold, triggers the `ALARM_URGENT_LOW` alarm.

</br>

!!! note "`ALARM_*` `ALARM_URGENT_*`"
    You can setup alarms, so that when your Nightscout page is open and the alarm enabled, above (`HIGH`) or below (`LOW`) a certain threshold, a sound might play.
