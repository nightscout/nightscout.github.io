# Discover your Nightscout site

</br>

```{admonition} Privacy
:class: tip
Having the URL of your Nightscout site, anybody can view your BG and run reports of your data. It it strongly recommended that you [secure](/nightscout/security) your site. 
```

</br>

It should look very similar to this when your [uploader](/uploader/setup.md) has added some data.

<img src="/nightscout/img/UseNS00.png" width="600px" />

</br>

The central part will show your recent BG, you can select how many hours you want to be displayed with `Hours: 2 3 4 6 12 24`.  The pale blue dots are the AR2 prevision as explained [here](/nightscout/setup_variables.md#ar2-ar2-forecasting). The lower part will display the last 48 hours and you can use the lower right selection to browse your old data.

<img src="/nightscout/img/UseNS01.png" width="600px" />

</br>

In the upper part you'll see the current time of your site, your current BG (and how long ago it was measured) plus the delta with the previous measurement and a trend arrow. More explanations [here](/nightscout/setup_variables.md#default-plugins).

Optionally you will see other indications (pills) that can be personalized in your variables and plugins like detailed [here](/nightscout/setup_variables.md#plugins). 

<img src="/nightscout/img/UseNS03.png" width="600px" />

</br>

## Authenticate yourself

By default you site opens read only, you need to authenticate using your [API secret](api-secret) in order to modify settings and add treatments. Click on the lock icon, enter your API secret and click `Update`.

<img src="/nightscout/img/UseNS04.png" width="400px" />

This will unlock your `careportal` ([if enabled](/nightscout/setup_variables.md#careportal-careportal)) and `edit` ([if enabled](/nightscout/setup_variables.md#edit_mode-on)).

<img src="/nightscout/img/UseNS05.png" width="200px" />

</br>

## Add a treatment (`careportal`)

Some uploaders will send treatments to Nightscout but others won't. If you whish to do this manually, `careportal` is here for that.

`+` will open an interface to manually enter treatments.

<img src="/nightscout/img/UseNS06.png" width="300px" />

</br>

In the `Event Type` drop down menu, you can select the treatment type you want to add. Additional available entries will depend on the [plugins you enabled](/nightscout/setup_variables.md#advanced-plugins) like Loop and OpenAPS/AAPS.

### BG Check

`BG check` allows you to enter a blood glucose reading value from your `Meter`. With a CGM using `Sensor` reading doesn't add much value.

Keep in mind the value will be inserted now (unless you modify the event time) and might not match your CGM value for non stable BG due to capillary time lag.

<img src="/nightscout/img/UseNS07.png" width="400px" />

</br>

### Correction Bolus

`Correction Bolus` allows you to enter the amount of insulin units injected for a correction.

It will show as a circle with the lower half blue, with its size depending on the amount of units, UI indicated below (depending on [bolus rendering](/nightscout/setup_variables.md#bolus_render) setting).

<img src="/nightscout/img/UseNS08.png" width="400px" />

</br>

### Meal Bolus

### Carb Correction

### Snack Bolus

These treatments allow you to enter the amount of food you eat (and eventually the matching insulin treatment).

It will show as a circle with the higher half white (if including carbs), with its size depending on the amount of food. Without carbs the upper half will not be filled with the white color. If you add proteins and fat, the amount will display in this order: `carbs/proteins/fat`. With insulin the lower half of the circle will fill in blue and units will be indicated below.

You can select the timing of carbs absorption in `Carb Time` (i.e. when did you or will you actually eat these carbs) 

<img src="/nightscout/img/UseNS09.png" width="600px" />

</br>

### Combo Bolus

Combo bolus allows you to insert the corresponding bolus if you use a pump. Insert the total amount of insulin in `Insulin Given` then break down in `Split` with the percentage administered `now` and the `extended` amount. Enter the`Duration` of the extended bolus below.

It will display as a classic bolus at treatment time and [basal](/nightscout/setup_variables.md#basal-basal-profile) will reflect the extended amount for the selected duration.

<img src="/nightscout/img/UseNS10.png" width="500px" />

</br>

### Announcement

Announcements are used to change your page title in order to alert viewers.

Entering another treatment will acknowledge the announcement and return your page title to [default](/nightscout/setup_variables.md#custom_title-nightscout). 

<img src="/nightscout/img/UseNS11.png" width="600px" />

</br>

### Note

### Question

Notes and questions are a way to add comments and interact with others using your Nightscout page. 

<img src="/nightscout/img/UseNS12.png" width="600px" />

</br>

### Exercise

You can log physical activities and specify the duration. 

<img src="/nightscout/img/UseNS13.png" width="500px" />

</br>

### Pump Site Change `cage`

### CGM Sensor Start `sage`

### CGM Sensor Insert

### CGM Sensor Stop

### Pump Battery Change `bage`

### Insulin Cartridge Change `iage`

Logging these events will help you remember various expirations dates and will update the [corresponding pills](/nightscout/setup_variables.md#age-pills) if enabled. 

<img src="/nightscout/img/UseNS14.png" width="500px" />

</br>

### Temp Basal Start

### Temp Basal Stop

You can indicate temporary basal rate changes using either a percentage change in `Percent` or the absolute rate in `Basal value`. You need [basal](/nightscout/setup_variables.md#basal-basal-profile) to be enabled to visualize it.

<img src="/nightscout/img/UseNS15.png" width="600px" />

</br>

### Profile Switch

If you have more than one profile stored, you can switch profile to keep your profile parameters synchronized.

For a temporary switch (like for physical activities) you can select the duration.

<img src="/nightscout/img/UseNS16.png" width="500px" />

</br>

### D.A.D. Alert

Log a Diabetic Alert Dog event.

<img src="/nightscout/img/UseNS20.png" width="300px" />

</br>

## Edit Mode (`edit`)

For values still present on your display (last 48 hours), you can use Edit to move or delete bolus and correction treatments.

<img src="/nightscout/img/UseNS17.png" width="50px"/> will change color to red in edit mode <img src="/nightscout/img/UseNS18.png" width="50px">.

1. Drag the treatment in the past or future in the black area to move both food and insulin.
2. If you want to move only insulin drop in the blue area. 
3. For carbs only, in the white area. 
4. To delete a complete treatment drop it in the red delete area.

Once done, exit the edit mode by de-selecting it (white on black background). <img src="/nightscout/img/UseNS17.png" width="50px"/> 

<img src="/nightscout/img/UseNS19.png" width="1000px"/>

</br>

## Drawer Menu

Once authenticated (click the lock icon up right) you'll find many features in the drawer menu like access to advanced plugins and customizations of your web page (local view only, in order to modify the default view look into your Heroku variables [here](/nightscout/setup_variables/)).

<img src="/nightscout/img/UseNS21.png" width="300px"/> 

`Reports` will drive you to a powerful reporting toolset detailed [here](/nightscout/reports/).

`Profile Editor` will allow you to modify and add profiles, see [here](/nightscout/profile_editor/).

`Food Editor` handles your customized [food database](/nightscout/setup_variables.md#food-custom-foods).

`Admin Tools` gives you access control and database tools, see [here](/nightscout/admin_tools).

</br>

### Simple views:

<img src="/nightscout/img/UseNS22.png" width="300px"/> 

</br>

- `Clock` - Shows current BG, trend arrow, and time of day. Grey text on a black background.

<img src="/nightscout/img/SetupNS32.png" width="300px" />

- `Color` - Shows current BG and trend arrow. White text on a color background.

<img src="/nightscout/img/SetupNS33.png" width="300px" />

- `Simple` - Shows current BG. Grey text on a black background.

- `[+]` -  Create custom, simplified views using a predefined set of elements.

<img src="/nightscout/img/SetupNS34.png" width="300px" />

</br>

List of available items:

- `SGV` - Sensor Glucose Value
- `SGV age` - time since the last SGV read
- `SGV delta` - change of SGV in the last 5 minutes
- `Trend arrow` - icon of the SG trend
- `Time` - current time
- `Line break` - invisible item that will move following items to the next line (by default all are showing on the same level)

All visible items have `Size` property which allows to customize the view even more. Also, all items may appear multiple times on the view.

Apart from adding items, it is possible to customize other aspects of the views, like selecting `Color` or `Black` background. The first one will indicate current BG threshold (green = in range; blue = below range; yellow = above range; red = urgent below/above). `Show SGV age` option will make `SGV age` item appear `Always` or only if the predefined threshold is reached: `Only after threshold`. Breaching `SGV age threshold` will also make `Color` background turn grey and strike through `SGV`. `Clock view configurator` will generate an URL (available under `Open my clock view!` link) that could be bookmarked.

If you launch one of these views in a fullscreen view in iOS, you can use a left-to-right swipe gesture to exit the view.

</br>

### Settings:

<img src="/nightscout/img/UseNS23.png" width="300px"/> 

</br>

You can customize your view using Settings. Changes will only be applied to your current browser view, if you want to make these settings default for any browser you need to change directly the corresponding [system variables](/nightscout/setup_variables) indicated below and add the corresponding plugins in [`SHOW_PLUGINS`](/nightscout/setup_variables.md#plugins).

You need to [authenticate](#authenticate-yourself) to save your settings. 

#### [**Units `DISPLAY_UNITS`**](display-units)

#### [**Date Format `TIME_FORMAT`**](/nightscout/setup_variables.md#time_format-12)

#### [**Language `LANGUAGE`**](/nightscout/setup_variables.md#language-en)

#### [**Scale `SCALE_Y`**](/nightscout/setup_variables.md#scale_y-log)

#### [**Render Basal `BASAL_RENDER`**](/nightscout/setup_variables.md#basal-basal-profile)

#### [**Render Bolus Amount `BOLUS_RENDER`**](/nightscout/setup_variables.md#bolus_render)

#### [**Alarms `ALARM`**](/nightscout/setup_variables.md#alarms)

</br>

<img src="/nightscout/img/UseNS24.png" width="300px"/> 

</br>

#### [**Edit Mode `EDIT`**](/nightscout/discover.md#edit-mode-edit)

#### [**Show Raw BG Data `rawbg`**](/nightscout/setup_variables.md#rawbg-raw-bg)

#### [**Custom Title `CUSTOM_TITLE`**](/nightscout/setup_variables.md#custom_title-nightscout)

#### [**Theme `THEME`**](/nightscout/setup_variables.md#theme-colors)

#### [**Show Plugins `SHOW_PLUGINS`**](/nightscout/setup_variables.md#plugins)

</br>

<img src="/nightscout/img/UseNS25.png" width="300px"/> 

</br>

In order to `Save` your changes you need to Authenticate, click `Authenticate` and enter your [API Secret](api-secret).

`Reset, and use defaults` will reverse your changes to defaults from your [config variables](/nightscout/setup_variables.md#nightscout-config-vars).

In `About` you'll see your current Nightscout version.

</br>

### API

You can find information about your site API at:

https://{url}/api-docs[?token=TOKEN]

https://{url}/api/v2/properties.json[?token=TOKEN]
