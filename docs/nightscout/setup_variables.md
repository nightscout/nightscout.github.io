# Nightscout Configuration

Nightscout configuration is held in variables , their content can be modified to change and customize the behavior (data source, security, alarms, ...) and appearance (language, colors, visible items, ...). When deploying your Nightscout, most are left with default values and with time you might want to tune your site.

**Variables location will depend on the platform you use:**

````{tab-set}

:::{tab-item} Select your platform ->
</br>
:::

:::{tab-item} Heroku
[**→ Here**](/vendors/heroku/new_user.md#editing-config-vars-in-heroku)
:::

:::{tab-item} Railway
[**→ Here**](/vendors/railway/new_user.md#editing-variables-in-railway)
:::

:::{tab-item} Northflank
[**→ Here**](/vendors/northflank/new_user.md#editing-variables-in-northflank)
:::

:::{tab-item} Azure
[**→ Here**](/vendors/azure/new_user.md#editing-config-vars-in-azure)
:::

:::{tab-item} Render
[**→ Here**](/vendors/render/new_user.md#editing-variables-in-render)
:::

:::{tab-item} Fly.io
[**→ Here**](editing-config-vars-in-fly-io)
:::

:::{tab-item} Google Cloud
[**→ Here**](https://navid200.github.io/xDrip/docs/Nightscout/NS_Variables.html)
:::

:::{tab-item} Hosted Nightscout
If you use a hosted service, open the vendor web interface to access your Nightcsout site variables configuration or contact support.
:::

````

------

</br>

```{hint}
Only most used variables are explained below.</br>
For the full list consult the [main repository ReadMe](https://github.com/nightscout/cgm-remote-monitor#environment).
```

</br>

## Nightscout Config Vars

</br>

### Required variables

#### `MONGODB_URI` (Database connection string)

The connection string required to access your [Mongo database](/nightscout/new_user.md#basic-concepts) (where all your data is stored in the cloud).

```{warning}
**`MONGODB_URI` is handled automatically if you use a hosted service or Google Cloud xDrip+ method.** In these cases you don't need to worry about it and can't or shouldn't change it.</br>
This string is vital to your Nightscout functioning. A wrong connection string will prevent your site from opening and your data uploading in Nightscout.
```

An [Atlas database string](/troubleshoot/atlas.md#meet-your-connection-string) will look like this:

`mongodb+svr://sally:sallypass@cluster0.abcdef.mongodb.net/nightscout?retryWrites=true&w=majority`

A traditional MongoDB string will look like this:

`mongodb://sally:sallypass@myhosteddb.fqd/nightscout`

```{hint}
If you migrated from mLab, this variable might be `MONGO_CONNECTION`.
Only one of these two variables must be present: `MONGODB_URI` or `MONGO_CONNECTION`.
```

</br>

(api-secret)=

#### `API_SECRET` (Nightscout password)

```{admonition} This is an important password
:class: warning
Knowing your site's API Secret gives anybody full access to your Nightscout data, allows uploading to your site and uncontrolled access. Make sure you keep this password secret and avoid exposing it publicly.
```

A passphrase that must be at least 12 characters long, for example:

```
MyV3ry53cr37
```

```{hint}
Don't make it too long and **do not put special characters in it** (better stick to letters and numbers).</br>It is case-sensitive.</br>
If you need to share Nightscout access but control the access, use an `admin` [token](/nightscout/security.md#create-authentication-tokens-for-users).
```

</br>

(display-units)=

#### `DISPLAY_UNITS` (Units to use)

Preferred BG units for the site: `mg/dl` or `mmol/L` (or just `mmol`). Setting to `mmol/L` puts the entire server into `mmol/L` mode by default, no further settings needed. Make sure it matches you uploader and followers.

</br>

------

### Features

(enable)=

#### `ENABLE` (Enable Plugins)

```{hint}
Select the right plugins! Better too many than not enough.
```

Select which [Plugins](#plugins) to enable for your site, this is the current list:

- `careportal` (Careportal)
- `boluscalc` (Bolus Wizard)
- `food` (Custom Foods)
- `rawbg` (Raw BG)
- `iob` (Insulin-on-Board)
- `cob` (Carbs-on-Board)
- `bwp` (Bolus Wizard Preview)
- `cage` (Cannula Age)
- `sage` (Sensor Age)
- `iage` (Insulin Age)
- `bage` (Battery Age)
- `treatmentnotify` (Treatment Notifications)
- `basal` (Basal Profile)
- `bolus` (Bolus Rendering)
- `connect` (Nightscout Connect) - Beta
- `bridge` (Share2Nightscout bridge) - Deprecated
- `mmconnect` (MiniMed Connect bridge) - Deprecated: not functional
- `pump` (Pump Monitoring)
- `openaps` (OpenAPS)
- `loop` (Loop)
- `override` (Override Mode)
- `xdripjs` (xDrip-js)
- `alexa` (Amazon Alexa)
- `googlehome` (Google Home/DialogFLow)
- `speech` (Speech)
- `cors` (CORS)

Must be a space-delimited, lower-case list. 

`careportal basal dbsize`

Include the word `bridge` here if you are receiving data from the Dexcom Share service.

`careportal basal dbsize bridge`

If you don't want to decide now, add all the followings, you can disable them if you don't need them:

`careportal basal dbsize rawbg iob maker bridge cob bwp cage iage sage boluscalc pushover treatmentnotify mmconnect loop pump profile food openaps bage alexa override cors`

Note: `mmconnect` is not functional with Heroku (if you wanted to bridge from the MiniMed CareLink service you will need another device to send data to Nightscout). If you are sending data to CareLink do **NOT** enable `mmconnect`.

</br>

#### `DISABLE` (Disable Plugins)

Used to disable ***default*** features, expects a space delimited list.

For example this will disable the direction arrow and uploader battery information:

`direction upbat`

</br>

(auth_default_roles)=

#### `AUTH_DEFAULT_ROLES` (Authentication)

Possible values `readable`, `denied`, or any valid role name. When `readable`, anyone can view Nightscout without a token. Setting it to `denied` will require a token from every visit, using `status-only` will enable api-secret based login.

More information on how to setup tokens [here](/nightscout/security.md#create-authentication-tokens-for-users).

</br>

### Alarms

These alarm setting affect all delivery methods (browser, Pushover, IFTTT, etc.). Values and settings entered here will be the defaults for new browser views, but will be overridden if different choices are made in the settings UI.

#### `ALARM_TYPES`

```{admonition} TYPES
:class: hint
Keep the `simple` type if you want `BG_` parameters (setup below) to be used.
```

`simple` and/or `predict`. 

Simple alarms trigger when BG crosses the various thresholds set below.

Predict alarms uses highly tuned formula that forecasts where the BG is going based on its trend. You will ***not*** get warnings when crossing any of the `BG_` thresholds set below when using ***only*** the predict type.

```{admonition} BG Thresholds
:class: hint
These values are the ones that will trigger `simple` alarms. They are expressed in the unit you selected with `DISPLAY_UNITS`.
```

#### `BG_HIGH`

Urgent High BG threshold, triggers the `ALARM_URGENT_HIGH` alarm.

#### `BG_LOW`

Urgent Low BG threshold, triggers the `ALARM_URGENT_LOW` alarm.

#### `BG_TARGET_BOTTOM`

Low BG threshold, triggers the `ALARM_LOW` alarm.

#### `BG_TARGET_TOP`

High BG threshold, triggers the `ALARM_HIGH` alarm.

</br>

```{admonition} ALARM_* and ALARM_URGENT_*
:class: hint
You can setup alarms, so that when your Nightscout page is open and the alarm enabled, above (`HIGH`) or below (`LOW`) a certain threshold, a sound might play.  
```

#### `ALARM_URGENT_HIGH`

Default setting for new browser views, for the Urgent High alarm (triggered when BG crosses `BG_HIGH`). (`on` or `off`)

#### `ALARM_HIGH`

Default setting for new browser views, for the High alarm (triggered when BG crosses `BG_TARGET_TOP`). (`on` or `off`)

#### `ALARM_LOW`

Default setting for new browser views, for the Low alarm (triggered when BG crosses `BG_TARGET_BOTTOM`). (`on` or `off`)

#### `ALARM_URGENT_LOW`

Default setting for new browser views, for the Urgent Low alarm (triggered when BG crosses `BG_LOW`). (`on` or `off`)

#### Other Alarms on by Default

These other two alarms are on by default, so set them to 'off' if you prefer no alarms.

* `ALARM_TIMEAGO_WARN`
* `ALARM_TIMEAGO_URGENT`

</br>

```{admonition} Pushover
:class: hint
`ALARM_*_MINS`: Only the first value of the space separated list, for options in browser, will be used for pushover.
```

#### `ALARM_URGENT_HIGH_MINS`

Number of minutes to snooze urgent high alarms.

#### `ALARM_HIGH_MINS`

Number of minutes to snooze high alarms.

#### `ALARM_LOW_MINS`

Number of minutes to snooze low alarms.

#### `ALARM_URGENT_LOW_MINS`

Number of minutes to snooze urgent low alarms.

#### `ALARM_URGENT_MINS`

Number of minutes to snooze urgent alarms (that aren't tagged as high or low).

#### `ALARM_WARN_MINS`

Number of minutes to snooze warning alarms (that aren't tagged as high or low).

</br>

```{admonition} TIMEAGO
:class: hint
Missing data alarms can also be setup, so that when your Nightscout page is open and the alarm enabled, after a certain time without receiving BG, a sound might play. 
```

#### `ALARM_TIMEAGO_URGENT`

Default setting for new browser views, for an urgent alarm when CGM data hasn't been received in the number of minutes set in `ALARM_TIMEAGO_URGENT_MINS`. (`on` or `off`)

#### `ALARM_TIMEAGO_URGENT_MINS`

Default setting for new browser views, for the number of minutes since the last CGM reading to trigger an `ALARM_TIMEAGO_URGENT` alarm.

#### `ALARM_TIMEAGO_WARN`

Default setting for new browser views, for a warning alarm when CGM data hasn't been received in the number of minutes set in `ALARM_TIMEAGO_WARN_MINS`. (`on` or `off`)

#### `ALARM_TIMEAGO_WARN_MINS`

Default setting for new browser views, for the number of minutes since the last CGM reading to trigger an `ALARM_TIMEAGO_WARN` alarm.

</br>

------

### Predefined values for your browser settings (default)

#### `TIME_FORMAT` (`12`)

Possible values `12` or `24`. This defines the horizontal timeline expressed as AM/PM or 0-24.

</br>

#### `NIGHT_MODE` (`off`) 

Possible values `on` or `off`. Night mode has a lower brightness and contrast.

</br>

#### `SHOW_RAWBG` (`never`)

Display of raw CGM data (this is a legacy feature). (`always`, `never`, or `noise`)

<img src="/nightscout/img/SetupNS35.png" width="250px" />

</br>

#### `CUSTOM_TITLE` (`Nightscout`)

The display name for the Nightscout site. Appears in the upper left of the main view. Often set to the name of the CGM wearer.

<img src="/nightscout/img/SetupNS05.png" width="300px" />

#### `THEME` (`colors`)

Color theme of the CGM graph.

`default`

<img src="/nightscout/img/SetupNS06.png" width="600px" />

`colors`

<img src="/nightscout/img/SetupNS07.png" width="600px" />

`colorblindfriendly`

<img src="/nightscout/img/SetupNS08.png" width="600px" />

</br>

#### `SHOW_PLUGINS`

Default setting for whether or not these plugins are checked (active) by default, not merely enabled. Include plugins here as in the `ENABLE` line; space-separated and lower-case.

When you `ENABLE` a plugin, it will be used by Nightscout but might not be visible unless you select it in the [drawer menu](/nightscout/discover.md#settings). If you want a plugin to display by default you need to add it to the `SHOW_PLUGINS` list.

More details [below](#plugins).

</br>

#### `SHOW_FORECAST` (`ar2`)

Plugin forecasts that should be shown by default, supports space delimited values such as: 
`ar2 openaps loop false`

Note the ar2 forecast is selected by default so if no value is set, it will be AR2. AR2 is an early attempt at forecasting BG and you should not base any medical decisions on it's predictions. 

If you are looping, you can chose instead to use either `loop` or `openaps` which will use the appropriate algorithm.

You should also add the parameter to the `SHOW_PLUGINS` and `ENABLE` variables.

For example, if you are using the Loop app for iPhone, you should have the following settings (In addition to any others outlined in the docs):

```
ENABLE=loop
SHOW_PLUGINS=loop
SHOW_FORECAST=loop
```

</br>

#### `LANGUAGE` (`en`)

Language of Nightscout. If not available English is used.

Currently supported language codes are: `bg` (Български), `cs` (Čeština), `de` (Deutsch), `dk` (Dansk), `el` (Ελληνικά), `en` (English), `es` (Español), `fi` (Suomi), `fr` (Français), `he` (עברית), `hr` (Hrvatski), `it` (Italiano), `ko` (한국어), `nb` (Norsk (Bokmål)), `nl` (Nederlands), `pl` (Polski), `pt` (Português (Brasil)), `ro` (Română), `ru` (Русский), `sk` (Slovenčina), `sv` (Svenska), `tr` (Turkish), `zh_cn` (中文（简体)), `zh_tw` (中文（繁體))

</br>

#### `SCALE_Y` (`log`)

The type of scaling used for the Y axis of the charts system wide.

The default `log` (logarithmic) option will let you see more detail towards the lower range, while still showing the full CGM range.

<img src="/nightscout/img/SetupNS40.png" width="400px" />

The `linear` option has equidistant tick marks; the range used is dynamic so that space at the top of chart isn't wasted.

<img src="/nightscout/img/SetupNS39.png" width="400px" />

The `log-dynamic` is similar to the default `log` options, but uses the same dynamic range and the `linear` scale.

<img src="/nightscout/img/SetupNS41.png" width="400px" />

</br>

#### `EDIT_MODE` (`on`)

Possible values `on` or `off`. Enables the icon allowing for editing of treatments in the main view. More about edit [here](/nightscout/discover.md#edit-mode-edit).

<img src="/nightscout/img/SetupNS42.png" width="200px" />

</br>

#### `BOLUS_RENDER`

Settings to configure Bolus rendering

`BOLUS_RENDER_OVER` (`0`) - U value over which the bolus labels use the format defined in `BOLUS_RENDER_FORMAT`. This value can be an integer or a float, e.g. `0.3`, `1.5`, `2`, etc.

`BOLUS_RENDER_FORMAT` (`default`) - Possible values are `hidden`, `default` (with leading zero and U), `concise` (with U, without leading zero), and `minimal` (without leading zero and U).

`BOLUS_RENDER_FORMAT_SMALL` (`default`) - Possible values are `hidden`, `default` (with leading zero and U), `concise` (with U, without leading zero), and `minimal` (without leading zero and U).

<img src="/nightscout/img/SetupNS43.png" width="600px" />

</br>

------

### Split View

Some users will need easy access to multiple Nightscout views at the same time. We have a special view for this case, accessed on /split path on your Nightscout URL. The view supports any number of sites between 1 to 8 way split, where the content for the screen can be loaded from multiple Nightscout instances. Note you still need to host separate instances for each Nightscout being monitored including the one that hosts the split view page - these variables only add the ability to load multiple views into one browser page. To set the URLs from which the content is loaded, set:

`FRAME_URL_1` - URL where content is loaded, for the first view (increment the number up to 8 to get more views)

`FRAME_NAME_1` - Name for the first split view portion of the screen (increment the number to name more views)

</br>

For example:

`FRAME_URL_1`	`https://janecgm.myurl.fqd`

`FRAME_NAME_1`	`Jane`

`FRAME_URL_2`	`https://joecgm.myurl.fqd`

`FRAME_NAME_2`	`Joe`

</br>

To display the split view browse to:

`https://myAppName.myurl.fqd/split`

</br>

8 split view example:

<img src="/nightscout/img/SetupNS30.png" width="800px" />

</br>

------

## Plugins

Plugins are used to extend the way information is displayed, how notifications are sent, alarms are triggered, and more.

If you want the `ENABLE`'d plugins to **show by default on any browser**, you should put them in the `SHOW_PLUGINS` variable.

If you want to specifically disable a plugin (mainly a default plugin) you should place it in the `DISABLE` variable.

You also can decide to visualize them or not on your Nightscout view with the drawer menu. `Authenticate` and `Save` the settings on your browser. Your site variables will not be modified and only default view will be seen on a new browser window.

<img src="/nightscout/img/SetupNS09.png" width="400px" />

</br>

### Default Plugins

Below some default plugins: `timeago`, `upbat`, `direction` and `delta`.

<img src="/nightscout/img/SetupNS11.png" width="500px" />

</br>

Hovering the mouse on (computer) or touching (touch screen) some plugins will give you additional information.

#### `delta` (BG Delta)

Calculates and displays the change between the last 2 BG values. Delta shows a `*` if time difference is more than 5 minutes.

#### `direction` (BG Direction)

Displays the trend direction, the arrow change is only based on the difference from the current to the latest measurement.

#### `upbat` (Uploader Battery)

Displays the most recent battery status from the uploader phone(s) and bridge. Use these extended setting to adjust behavior:

`UPBAT_ENABLE_ALERTS` (`false`) - Set to `true` to enable uploader battery alarms via Pushover and IFTTT.

`UPBAT_WARN` (`30`) - Minimum battery percent to trigger warning.

`UPBAT_URGENT` (`20`) - Minimum battery percent to trigger urgent alarm.

</br>

#### `timeago` (Time Ago)

Displays the time since last CGM entry. Use these extended setting to adjust behavior:

`TIMEAGO_ENABLE_ALERTS` (`false`) - Set to `true` to enable stale data alarms via Pushover and IFTTT.

`ALARM_TIMEAGO_WARN` (`on`) - possible values `on` or `off`

`ALARM_TIMEAGO_WARN_MINS` (`15`) - minutes since the last reading to trigger a warning

`ALARM_TIMEAGO_URGENT` (`on`) - possible values `on` or `off`

`ALARM_TIMEAGO_URGENT_MINS` (`30`) - minutes since the last reading to trigger a urgent alarm

</br>

#### `devicestatus` (Device Status)

Used by `upbat` and other plugins to display device status info. Supports the `DEVICESTATUS_ADVANCED="true"` extended setting to send all device statuses to the client for retrospective use and to support other plugins.

Example: `upbat` information using `devicestatus`.

<img src="/nightscout/img/SetupNS20.png" width="300px" />

</br>

#### `errorcodes` (CGM Error Codes)

Generates alarms for CGM codes `9` (hourglass) and `10` (???).

Use extended settings to adjust what errorcodes trigger notifications and alarms:

- `ERRORCODES_INFO` (`1 2 3 4 5 6 7 8`) - By default the needs calibration (blood drop) and other codes below 9 generate an info level notification, set to a space separate list of number or `off` to disable

- `ERRORCODES_WARN` (`off`) - By default there are no warning configured, set to a space separate list of numbers or `off` to disable

- `ERRORCODES_URGENT` (`9 10`) - By default the hourglass and ??? generate an urgent alarm, set to a space separate list of numbers or `off` to disable

  </br>

#### `ar2` (AR2 Forecasting)

Generates alarms based on forecasted values.

- Enabled by default if no thresholds are set **OR** `ALARM_TYPES` includes `predict`.
  - You can permanently disable AR2 setting the `SHOW_FORECAST` variable to `false` (or removing `ar2` if you use it for `openaps` or `loop`).

- `AR2` forecasting display can be enabled/disabled from `... `
- Use extended settings to adjust AR2 behavior:
  - `AR2_CONE_FACTOR` (`2`) - to adjust size of cone, use `0` for a single line.

<img src="/nightscout/img/SetupNS10.png" width="700px" />

</br>

#### `simplealarms` (Simple BG Alarms)

- Uses `BG_HIGH`, `BG_TARGET_TOP`, `BG_TARGET_BOTTOM`, `BG_LOW` thresholds to generate alarms.

  Simple alarms are enabled by default if one of the `BG_HIGH`, `BG_TARGET_TOP`, `BG_TARGET_BOTTOM`, `BG_LOW` thresholds is set or `ALARM_TYPES` includes `simple`.

  You'll find the plugin in the drawer menu. You can change thresholds in `Profile editor`.

  You can click the loudspeaker icon to test the alarms volume or to snooze an active alarm. If you want to use sound alarms, you should click the icon to enable playback at least once after opening your Nightscout page in order to allow the browser to play it.

<img src="/nightscout/img/SetupNS12.png" width="400px"/>

</br>

#### `profile` (Treatment Profile)

Add a link in the drawer menu to [Profile Editor](/nightscout/profile_editor/) and allows to enter treatment profile settings. Also uses the extended setting:

- `PROFILE_HISTORY` (`off`) - possible values `on` or `off`. Enable/disable NS ability to keep history of your profiles (still experimental)
- `PROFILE_MULTIPLE` (`off`) - possible values `on` or `off`. Enable/disable NS ability to handle and switch between multiple treatment profiles

More variables of your profile will be used by Nightscout plugins like treatments, see below or [here](https://github.com/nightscout/cgm-remote-monitor#treatment-profile). 

<img src="/nightscout/img/SetupNS13.png" width="800px"/>

</br>

#### `dbsize` (Database Size)

Show size of Nightscout Database, as a percentage of declared available space or in MiB.

<img src="/nightscout/img/SetupNS15.png" width="400px"/>

</br>

Many deployments of Nightscout use free tier of MongoDB Atlas on Heroku, which is limited in size to 512MiB. After some time, as volume of stored data grows, it may happen that this limit is reached and system is unable to store new data. This plugin provides pill that indicates size of Database and shows (when configured) alarms regarding reaching space limit.

```{admonition} IMPORTANT
This plugin can only check how much space database already takes, *but cannot infer* max size available on server for it. To have correct alarms and realistic percentage, `DBSIZE_MAX` need to be properly set - according to your own mongoDB hosting configuration.
```

**NOTE:** This plugin rely on db.stats() for reporting *logical* size of database, which may be different than *physical* size of database on server. It may work for free tier of MongoDB on Atlas, since it calculate quota according to logical size too, but may fail for other hostings or self-hosted database with quota based on physical size.

**NOTE:** MongoDB Atlas quota is for **all** databases in cluster, while each instance will get only size of **its own database only**. It is ok when you only have **one** database in cluster (most common scenario) but will not work for multiple parallel databases. In such case, spliting known quota equally beetween databases and setting `DBSIZE_MAX` to that fraction may help, but wont be precise.

All sizes are expressed as integers, in *Mebibytes* `1 MiB == 1024 KiB == 1024*1024 B`

Extended settings available:

- `DBSIZE_MAX` (`496`) - Maximal allowed size of database on your mongoDB server, in MiB. You need to adjust that value to match your database hosting limits - default value is for standard Heroku mongoDB free tier.
- `DBSIZE_WARN_PERCENTAGE` (`60`) - Threshold to show first warning about database size. When database reach this percentage of `DBSIZE_MAX` size - pill will show size in yellow.
- `DBSIZE_URGENT_PERCENTAGE` (`75`) - Threshold to show urgent warning about database size. When database reach this percentage of `DBSIZE_MAX` size, it is urgent to do backup and clean up old data. At this percentage info pill turns red.
- `DBSIZE_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications about database size.
- `DBSIZE_IN_MIB` (`false`) - Set to `true` to display size of database in MiB-s instead of default percentage.

</br>

------

### Advanced Plugins:

#### `careportal` (Careportal)

An optional form to enter treatments.

Care Portal is an important plugin that gives access to the `Log a treatment` interface. Unlock it entering your API secret with the lock icon top right, then use the `+` icon to log a treatment.  More information [here](/nightscout/discover.md#add-a-treatment-careportal).

<img src="/nightscout/img/SetupNS14.png" width="600px" />

</br>

#### `boluscalc` (Bolus Wizard)

Bolus Wizard plugin gives access to the `Bolus Wizard` interface. You can access it with the calculator icon top right. 

<img src="/nightscout/img/SetupNS16.png" width="600px" />

</br>

#### `food` (Custom Foods)

Custom Foods enabled by the variable `food` allows to to customize your food database and adds a `Food Editor` entry in the menu.

<img src="/nightscout/img/SetupNS17.png" width="1000px" />

</br>

#### `rawbg` (Raw BG)

Calculates BG using sensor and calibration records from and displays an alternate BG values and noise levels. Defaults that can be adjusted with extended setting. Raw BG will only display if your sensor provides this data, your bridge device transfers it and your uploader sends it to Nightscout.

- `DISPLAY`(`unsmoothed`) - Allows the user to control which algorithm is used to calculate the displayed raw BG values using the most recent calibration record.

  - ​	`unfiltered` - Raw BG is calculated by applying the calibration to the glucose record's unfiltered value.

  - `filtered` - Raw BG is calculated by applying the calibration to the glucose record's filtered value. The glucose record's filtered values are generally produced by the CGM by a running average of the unfiltered values to produce a smoothed value when the sensor noise is high.

  - `unsmoothed` - Raw BG is calculated by first finding the ratio of the calculated filtered value (the same value calculated by the `filtered` setting) to the reported glucose value. The displayed raw BG value is calculated by dividing the calculated unfiltered value (the same value calculated by the `unfiltered` setting) by the ratio. The effect is to exaggerate changes in trend direction so the trend changes are more noticeable to the user. This is the legacy raw BG calculation algorithm.

<img src="/nightscout/img/SetupNS21.png" width="400px" />

</br>

#### `iob` (Insulin-on-Board) - `cob` (Carbs-on-Board)

<img src="/nightscout/img/SetupNS18.png" width="200px" />

</br>

#### `iob` (Insulin-on-Board)

Adds the IOB pill visualization in the client and calculates values that used by other plugins. Uses treatments with insulin doses and the `dia` and `sens` fields from the treatment profile.

#### `cob` (Carbs-on-Board)

Adds the COB pill visualization in the client and calculates values that used by other plugins. Uses treatments with carb doses and the `carbs_hr`, `carbratio`, and `sens` fields from the treatment profile.

When you enter the information with the Care Portal or Nightscout receives if from the uploader, you can see remaining insulin on board and carbs. 

</br>

#### `bwp` (Bolus Wizard Preview)

This plugin in intended for the purpose of automatically snoozing alarms when the CGM indicates high blood sugar but there is also insulin on board (IOB) and secondly, alerting to user that it might be beneficial to measure the blood sugar using a glucometer and dosing insulin as calculated by the pump or instructed by trained medicare professionals. ***The values provided by the plugin are provided as a reference based on CGM data and insulin sensitivity you have configured, and are not intended to be used as a reference for bolus calculation.*** The plugin calculates the bolus amount when above your target, generates alarms when you should consider checking and bolusing, and snoozes alarms when there is enough IOB to cover a high BG. Uses the results of the `iob` plugin and `sens`, `target_high`, and `target_low` fields from the [treatment profile](/nightscout/profile_editor/). Defaults that can be adjusted with extended settings

- `BWP_WARN` (`0.50`) - If `BWP` is > `BWP_WARN` a warning alarm will be triggered.
- `BWP_URGENT` (`1.00`) - If `BWP` is > `BWP_URGENT` an urgent alarm will be triggered.
- `BWP_SNOOZE_MINS` (`10`) - minutes to snooze when there is enough IOB to cover a high BG.
- `BWP_SNOOZE` - (`0.10`) If BG is higher then the `target_high` and `BWP` < `BWP_SNOOZE` alarms will be snoozed for `BWP_SNOOZE_MINS`.

<img src="/nightscout/img/SetupNS19.png" width="400px" />

</br>

#### Age pills

<img src="/nightscout/img/SetupNS23.png" width="600px"/>

</br>

#### `cage` (Cannula Age)

Calculates the number of hours since the last `Site Change` treatment that was recorded.

- `CAGE_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications to remind you of upcoming cannula change.
- `CAGE_INFO` (`44`) - If time since last `Site Change` matches `CAGE_INFO`, user will be warned of upcoming cannula change
- `CAGE_WARN` (`48`) - If time since last `Site Change` matches `CAGE_WARN`, user will be alarmed to to change the cannula
- `CAGE_URGENT` (`72`) - If time since last `Site Change` matches `CAGE_URGENT`, user will be issued a persistent warning of overdue change.
- `CAGE_DISPLAY` (`hours`) - Possible values are `hours` or `days`. If `days` is selected and age of canula is greater than 24h number is displayed in days and hours

#### `sage` (Sensor Age)

Calculates the number of days and hours since the last `Sensor Start` and `Sensor Change` treatment that was recorded.

- `SAGE_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications to remind you of upcoming sensor change.
- `SAGE_INFO` (`144`) - If time since last sensor event matches `SAGE_INFO`, user will be warned of upcoming sensor change
- `SAGE_WARN` (`164`) - If time since last sensor event matches `SAGE_WARN`, user will be alarmed to to change/restart the sensor
- `SAGE_URGENT` (`166`) - If time since last sensor event matches `SAGE_URGENT`, user will be issued a persistent warning of overdue change.

#### `iage` (Insulin Age)

Calculates the number of days and hours since the last `Insulin Change` treatment that was recorded.

- `IAGE_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications to remind you of upcoming insulin reservoir change.
- `IAGE_INFO` (`44`) - If time since last `Insulin Change` matches `IAGE_INFO`, user will be warned of upcoming insulin reservoir change
- `IAGE_WARN` (`48`) - If time since last `Insulin Change` matches `IAGE_WARN`, user will be alarmed to to change the insulin reservoir
- `IAGE_URGENT` (`72`) - If time since last `Insulin Change` matches `IAGE_URGENT`, user will be issued a persistent warning of overdue change.

#### `bage` (Battery Age)

Calculates the number of days and hours since the last `Pump Battery Change` treatment that was recorded.

- `BAGE_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications to remind you of upcoming pump battery change.

- `BAGE_DISPLAY` (`days`) - Set to `hours` to display time since last `Pump Battery Change` in hours only.

- `BAGE_INFO` (`312`) - If time since last `Pump Battery Change` matches `BAGE_INFO` hours, user will be warned of upcoming pump battery change (default of 312 hours is 13 days).

- `BAGE_WARN` (`336`) - If time since last `Pump Battery Change` matches `BAGE_WARN` hours, user will be alarmed to to change the pump battery (default of 336 hours is 14 days).

- `BAGE_URGENT` (`360`) - If time since last `Pump Battery Change` matches `BAGE_URGENT` hours, user will be issued a persistent warning of overdue change (default of 360 hours is 15 days).

  </br>

#### `treatmentnotify` (Treatment Notifications)

Generates notifications when a treatment has been entered and snoozes alarms minutes after a treatment. Default snooze is 10 minutes, and can be set using the `TREATMENTNOTIFY_SNOOZE_MINS` extended setting.

</br>

#### `basal` (Basal Profile)

<img src="/nightscout/img/SetupNS26.png" width="200px"/>

</br>

Adds the Basal pill visualization to display the basal rate for the current time. Also enables the `bwp` plugin to calculate correction temp basal suggestions. Uses the `basal` field from the [treatment profile](https://github.com/nightscout/cgm-remote-monitor#treatment-profile). Also uses the extended settings:

- `BASAL_RENDER` (`none`) 

Possible values are `none`, 

`default`,

<img src="/nightscout/img/SetupNS29.png" width="600px"/>

or `icicle` (inverted)

<img src="/nightscout/img/SetupNS28.png" width="600px"/>

</br>

#### `bridge` (Share2Nightscout bridge)

Glucose reading directly from the Dexcom Share service, uses these extended settings (***** mandatory):

- `BRIDGE_USER_NAME` - Your username for the Share service. *****
- `BRIDGE_PASSWORD` - Your password for the Share service. *****
- `BRIDGE_INTERVAL` (`150000` *2.5 minutes*) - The time (in milliseconds) to wait between each update.
- `BRIDGE_MAX_COUNT` (`1`) - The number of records to attempt to fetch per update.
- `BRIDGE_FIRST_FETCH_COUNT` (`3`) - Changes max count during the very first update only.
- `BRIDGE_MAX_FAILURES` (`3`) - How many failures before giving up.
- `BRIDGE_MINUTES` (`1400`) - The time window to search for new data per update (the default value is one day in minutes).
- `BRIDGE_SERVER` (`US`) - Set to `US` to fetch data from Dexcom servers in the US. Set to (`EU`) to fetch from non US servers instead. *****

- `OBSCURED` (`bridge`) - Obscure data source when using `bridge` uploader.
- `OBSCURE_DEVICE_PROVENANCE` (`dexcom-dont-own-my-body-data`) - Self explanatory.

</br>

#### `mmconnect` (MiniMed Connect bridge)

```{warning}
This plugin is **NOT** functional with 7xx pumps do not enable it.
```

Transfer real-time MiniMed Connect data from the Medtronic CareLink server into Nightscout ([read more](https://github.com/nightscout/minimed-connect-to-nightscout)) (***** mandatory) with the following extended settings:

- `MMCONNECT_USER_NAME` - Your user name for CareLink Connect. *****
- `MMCONNECT_PASSWORD` - Your password for CareLink Connect. *****
- `MMCONNECT_INTERVAL` (`60000` *1 minute*) - Number of milliseconds to wait between requests to the CareLink server.
- `MMCONNECT_MAX_RETRY_DURATION` (`32`) - Maximum number of total seconds to spend retrying failed requests before giving up.
- `MMCONNECT_SGV_LIMIT` (`24`) - Maximum number of recent sensor glucose values to send to Nightscout on each request.
- `MMCONNECT_VERBOSE` - Set this to "true" to log CareLink request information to the console.
- `MMCONNECT_STORE_RAW_DATA` - Set this to "true" to store raw data returned from CareLink as `type: "carelink_raw"` database entries (useful for development).
- `MMCONNECT_SERVER` - Set this to `EU` if you're using the European Medtronic services *****

</br>

#### `pump` (Pump Monitoring)

<img src="/nightscout/img/SetupNS24.png" width="270px"/>

</br>

Generic Pump Monitoring for OpenAPS, MiniMed Connect, RileyLink, t:slim, ...

- Requires `DEVICESTATUS_ADVANCED="true"` to be set
- `PUMP_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications for Pump battery and reservoir.
- `PUMP_WARN_ON_SUSPEND` (`false`) - Set to `true` to get an alarm when the pump is suspended.
- `PUMP_FIELDS` (`reservoir battery`) - The fields to display by default. Any of the following fields: `reservoir`, `battery`, `clock`, `status`, and `device`
- `PUMP_RETRO_FIELDS` (`reservoir battery clock`) - The fields to display in retro mode. Any of the above fields.
- `PUMP_WARN_CLOCK` (`30`) - The number of minutes ago that needs to be exceed before an alert is triggered.
- `PUMP_URGENT_CLOCK` (`60`) - The number of minutes ago that needs to be exceed before an urgent alarm is triggered.
- `PUMP_WARN_RES` (`10`) - The number of units remaining, a warning will be triggered when dropping below this threshold.
- `PUMP_URGENT_RES` (`5`) - The number of units remaining, an urgent alarm will be triggered when dropping below this threshold.
- `PUMP_WARN_BATT_P` (`30`) - The % of the pump battery remaining, a warning will be triggered when dropping below this threshold.
- `PUMP_URGENT_BATT_P` (`20`) - The % of the pump battery remaining, an urgent alarm will be triggered when dropping below this threshold.
- `PUMP_WARN_BATT_V` (`1.35`) - The voltage (if percent isn't available) of the pump battery, a warning will be triggered when dropping below this threshold.
- `PUMP_URGENT_BATT_V` (`1.30`) - The voltage (if percent isn't available) of the pump battery, an urgent alarm will be triggered when dropping below this threshold.

</br>

------

#### `openaps` (OpenAPS)

<img src="/nightscout/img/SetupNS36.png" width="270px"/>

</br>

Integrated OpenAPS loop monitoring, uses these extended setting:

- Requires `DEVICESTATUS_ADVANCED="true"` to be set
- `OPENAPS_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications when OpenAPS isn't looping. If OpenAPS is going to offline for a period of time, you can add an `OpenAPS Offline` event for the expected duration from Careportal to avoid getting alerts.
- `OPENAPS_WARN` (`30`) - The number of minutes since the last loop that needs to be exceed before an alert is triggered
- `OPENAPS_URGENT` (`60`) - The number of minutes since the last loop that needs to be exceed before an urgent alarm is triggered
- `OPENAPS_FIELDS` (`status-symbol status-label iob meal-assist rssi`) - The fields to display by default. Any of the following fields: `status-symbol`, `status-label`, `iob`, `meal-assist`, `freq`, and `rssi`
- `OPENAPS_RETRO_FIELDS` (`status-symbol status-label iob meal-assist rssi`) - The fields to display in retro mode. Any of the above fields.
- `OPENAPS_PRED_IOB_COLOR` (`#1e88e5`) - The color to use for IOB prediction lines. Colors can be in `#RRGGBB` format, but [other CSS color units](https://www.w3.org/TR/css-color-3/#colorunits) may be used as well.
- `OPENAPS_PRED_COB_COLOR` (`#FB8C00`) - The color to use for COB prediction lines. Same format as above.
- `OPENAPS_PRED_ACOB_COLOR` (`#FB8C00`) - The color to use for ACOB prediction lines. Same format as above.
- `OPENAPS_PRED_ZT_COLOR` (`#00d2d2`) - The color to use for ZT prediction lines. Same format as above.
- `OPENAPS_PRED_UAM_COLOR` (`#c9bd60`) - The color to use for UAM prediction lines. Same format as above.
- `OPENAPS_COLOR_PREDICTION_LINES` (`true`) - Enables / disables the colored lines vs the classic purple color.

Also see [Pushover](https://github.com/nightscout/cgm-remote-monitor#pushover) and [IFTTT Maker](https://github.com/nightscout/cgm-remote-monitor#ifttt-maker).

</br>

------

#### `loop` (Loop)

<img src="/nightscout/img/SetupNS25.png" width="300px"/>

</br>

iOS Loop app monitoring, uses these extended settings:

- Requires `DEVICESTATUS_ADVANCED="true"` to be set
- `LOOP_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications when Loop isn't looping.
- `LOOP_WARN` (`30`) - The number of minutes since the last loop that needs to be exceeded before an alert is triggered
- `LOOP_URGENT` (`60`) - The number of minutes since the last loop that needs to be exceeded before an urgent alarm is triggered
- Add `loop` to `SHOW_FORECAST` to show forecasted BG.

For remote overrides, the following extended settings must be configured:

- `LOOP_APNS_KEY` - Apple Push Notifications service (APNs) Key, created in the Apple Developer website.
- `LOOP_APNS_KEY_ID` - The Key ID for the above key.
- `LOOP_DEVELOPER_TEAM_ID` - Your Apple developer team ID.
- `LOOP_PUSH_SERVER_ENVIRONMENT` - (optional) Set this to `production` if you are using a provisioning profile that specifies production aps-environment, such as when distributing builds via TestFlight.

</br>

#### `override` (Override Mode)

Additional monitoring for DIY automated insulin delivery systems to display real-time overrides such as Eating Soon or Exercise Mode:

- Requires `DEVICESTATUS_ADVANCED="true"` to be set

</br>

#### `xdripjs` (xDrip-js)

Integrated xDrip-js monitoring, uses these extended settings:

- Requires `DEVICESTATUS_ADVANCED="true"` to be set

- `XDRIPJS_ENABLE_ALERTS` (`false`) - Set to `true` to enable notifications when CGM state is not OK or battery voltages fall below threshold.

- `XDRIPJS_STATE_NOTIFY_INTRVL` (`0.5`) - Set to number of hours between CGM state notifications

- `XDRIPJS_WARN_BAT_V` (`300`) - The voltage of either transmitter battery, a warning will be triggered when dropping below this threshold.

  </br>

#### `alexa` (Amazon Alexa)

Integration with Amazon Alexa, [detailed setup instructions](https://github.com/nightscout/cgm-remote-monitor/blob/master/docs/plugins/alexa-plugin.md)

</br>

#### `googlehome` (Google Home/DialogFlow)

Integration with Google Home (via DialogFlow), [detailed setup instructions](https://github.com/nightscout/cgm-remote-monitor/blob/master/docs/plugins/googlehome-plugin.md)

</br>

#### `speech` (Speech)

Speech synthesis plugin. When enabled, speaks out the blood glucose values, IOB and alarms. Note you have to set the LANGUAGE setting on the server to get all translated alarms.

</br>

#### `cors` (CORS)

Enabled [CORS](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing) so other websites can make request to your Nightscout site, uses these extended settings:

- `CORS_ALLOW_ORIGIN` (`*`) - The list of sites that are allow to make requests

</br>

------

## Extended Settings

Some plugins support additional configuration using extra environment variables. These are prefixed with the name of the plugin and a `_`. For example setting `MYPLUGIN_EXAMPLE_VALUE=1234` would make `extendedSettings.exampleValue` available to the `MYPLUGIN` plugin.

Plugins only have access to their own extended settings, all the extended settings of client plugins will be sent to the browser.

- `DEVICESTATUS_ADVANCED` (`true`) - Defaults to true. Users who only have a single device uploading data to Nightscout can set this to false to reduce the data use of the site.
- `DEVICESTATUS_DAYS` (`1`) - Defaults to 1, can optionally be set to 2. Users can use this to show 48 hours of device status data for in retro mode, rather than the default 24 hours. Setting this value to 2 will roughly double the bandwidth usage of nightscout, so users with a data cap may not want to update this setting.

</br>

### [Pushover](/nightscout/pushover)

In addition to the normal web based alarms, there is also support for [Pushover](https://pushover.net/) based alarms and notifications.

To get started install the Pushover application on your iOS or Android device and create an account.

Using that account login to [Pushover](https://pushover.net/), in the top left you’ll see your User Key, you’ll need this plus an application API Token/Key to complete this setup.

You’ll need to [Create a Pushover Application](https://pushover.net/apps/build). You only need to set the Application name, you can ignore all the other settings, but setting an Icon is a nice touch. Maybe you'd like to use [this one](https://raw.githubusercontent.com/nightscout/cgm-remote-monitor/master/static/images/large.png)?

Pushover is configured using the following Environment Variables:

```
* `ENABLE` - `pushover` should be added to the list of plugin, for example: `ENABLE="pushover"`.
* `PUSHOVER_API_TOKEN` - Used to enable pushover notifications, this token is specific to the application you create from in [Pushover](https://pushover.net/), ***[additional pushover information](#pushover)*** below.
* `PUSHOVER_USER_KEY` - Your Pushover user key, can be found in the top left of the [Pushover](https://pushover.net/) site, this can also be a pushover delivery group key to send to a group rather than just a single user.  This also supports a space delimited list of keys.  To disable `INFO` level pushes set this to `off`.
* `PUSHOVER_ALARM_KEY` - An optional Pushover user/group key, will be used for system wide alarms (level > `WARN`).  If not defined this will fallback to `PUSHOVER_USER_KEY`.  A possible use for this is sending important messages and alarms to a CWD that you don't want to send all notification too.  This also support a space delimited list of keys.  To disable Alarm pushes set this to `off`.
* `PUSHOVER_ANNOUNCEMENT_KEY` - An optional Pushover user/group key, will be used for system wide user generated announcements.  If not defined this will fallback to `PUSHOVER_USER_KEY` or `PUSHOVER_ALARM_KEY`.  This also support a space delimited list of keys. To disable Announcement pushes set this to `off`.
* `BASE_URL` - Used for pushover callbacks, usually the URL of your Nightscout site, use https when possible.
* `API_SECRET` - Used for signing the pushover callback request for acknowledgments.

If you never want to get info level notifications (treatments) use `PUSHOVER_USER_KEY="off"`
If you never want to get an alarm via pushover use `PUSHOVER_ALARM_KEY="off"`
If you never want to get an announcement via pushover use `PUSHOVER_ANNOUNCEMENT_KEY="off"`

If only `PUSHOVER_USER_KEY` is set it will be used for all info notifications, alarms, and announcements

For testing/development try [localtunnel](http://localtunnel.me/).
```

</br>

### [IFTTT Maker](/nightscout/ifttt)

In addition to the normal web based alarms, and pushover, there is also integration for [IFTTT Webhooks](https://ifttt.com/maker_webhooks).

With Maker you are able to integrate with all the other [IFTTT Services](https://ifttt.com/services). For example you can send a tweet when there is an alarm, change the color of hue light, send an email, send and sms, and so much more.

1. Setup IFTTT account: [login](https://ifttt.com/login) or [create an account](https://ifttt.com/join)
2. Follow the [Detailed IFTTT setup Instructions](https://github.com/nightscout/cgm-remote-monitor/blob/master/docs/plugins/maker-setup.md)
3. Configure Nightscout by setting these webpage environment variables:

- `ENABLE` - `maker` should be added to the list of plugins, for example: `ENABLE="maker"`.
- `MAKER_KEY` - Set this to your secret key (see [[Detailed Instructions](https://github.com/nightscout/cgm-remote-monitor/blob/master/docs/plugins/maker-setup.md) ) `MAKER_KEY="abcMyExampleabc123defjt1DeNSiftttmak-XQb69p"` This also supports a space delimited list of keys.
- `MAKER_ANNOUNCEMENT_KEY` - An optional Maker key, will be used for system wide user generated announcements. If not defined this will fallback to `MAKER_KEY`. A possible use for this is sending important messages and alarms to another device that you don't want to send all notification too. This also support a space delimited list of keys.

Plugins can create custom events, but all events sent to IFTTT webhooks will be prefixed with `ns-`. The core events are:

- `ns-event` - This event is sent to the maker service for all alarms and notifications. This is good catch all event for general logging.
- `ns-allclear` - This event is sent to the maker service when an alarm has been acknowledged or when the server starts up without triggering any alarms. For example, you could use this event to turn a light to green.
- `ns-info` - Plugins that generate notifications at the info level will cause this event to also be triggered. It will be sent in addition to `ns-event`.
- `ns-warning` - Alarms at the warning level with cause this event to also be triggered. It will be sent in addition to `ns-event`.
- `ns-urgent` - Alarms at the urgent level with cause this event to also be triggered. It will be sent in addition to `ns-event`.
- see the [full list of events](https://github.com/nightscout/cgm-remote-monitor/blob/master/docs/plugins/maker-setup.md#events)

</br>

### Treatment Profile

Some of the [plugins](#plugins) make use of a treatment profile that can be edited using the [Profile Editor](/nightscout/profile_editor/).

Treatment Profile Fields:

- `timezone` (Time Zone) - time zone local to the patient. *Should be set.*
- `units` (Profile Units) - blood glucose units used in the profile, either "mg/dl" or "mmol"
- `dia` (Insulin duration) - value should be the duration of insulin action to use in calculating how much insulin is left active. Defaults to 3 hours.
- `carbs_hr` (Carbs per Hour) - The number of carbs that are processed per hour, for more information see [#DIYPS](http://diyps.org/2014/05/29/determining-your-carbohydrate-absorption-rate-diyps-lessons-learned/).
- `carbratio` (Carb Ratio) - grams per unit of insulin.
- `sens` (Insulin sensitivity) How much one unit of insulin will normally lower blood glucose.
- `basal` The basal rate set on the pump.
- `target_high` - Upper target for correction boluses.
- `target_low` - Lower target for correction boluses.
