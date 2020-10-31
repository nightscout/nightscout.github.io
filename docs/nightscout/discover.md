# Welcome to your site

</br>

It should look very similar to this when your uploader has added some data.

<img src="..\img\UseNS00.png" style="zoom:80%;" />

</br>

The central part will show your recent BG, you can select how many hours you want to be displayed with `Hours: 2 3 4 6 12 24`.  The pale blue dots are the AR2 prevision as explained [here](../setup_variables/#ar2-ar2-forecasting). The lower part will display the last 48 hours and you can use the lower right selection to browse your old data.

<img src="..\img\UseNS01.png" style="zoom:80%;" />

</br>

In the upper part you'll see the current time of your site, your current BG (and how long ago it was measured) plus the delta with the previous measurement and a trend arrow. More explanations [here](../setup_variables/#default-plugins).

Optionally you will see other indications (pills) that can be personalized in your variables and plugins like detailed [here](../setup_variables/#plugins). 

<img src="..\img\UseNS03.png" style="zoom:80%;" />

</br>

## Authenticate yourself

By default you site opens read only, you need to authenticate using your [API secret](../../nightscout/setup_variables/#api_secret) in order to modify settings and add treatments. Click on the lock icon, enter your API secret and click `Update`.

<img src="..\img\UseNS04.png" style="zoom:80%;" />

This will unlock your `careportal` ([if enabled](../../nightscout/setup_variables/#careportal-careportal)) and `edit` ([if enabled](../../nightscout/setup_variables/#edit_mode-on)).

<img src="..\img\UseNS05.png" style="zoom:80%;" />

</br>

## Add a treatment (`careportal`)

Some uploaders will send treatments to Nightscout but others won't. If you whish to do this manually, `careportal` is here for that.

`+` will open an interface to manually enter treatments.

<img src="..\img\UseNS06.png" style="zoom:80%;" />

</br>

In the `Event Type` drop down menu, you can select the treatment type you want to add. Additional available entries will depend on the [plugins you enabled](../../nightscout/setup_variables/#advanced-plugins) like Loop and OpenAPS/AAPS.

##### BG Check

`BG check` allows you to enter a blood glucose reading value from your `Meter`. With a CGM using `Sensor` reading doesn't add much value.

Keep in mind the value will be inserted now (unless you modify the event time) and might not match your CGM value for non stable BG due to capillary time lag.

<img src="..\img\UseNS07.png" style="zoom:80%;" />

</br>

##### Correction Bolus

`Correction Bolus` allows you to enter the amount of insulin units injected for a correction.

It will show as a circle with the lower half blue, with its size depending on the amount of units, UI indicated below (depending on [bolus rendering](../../nightscout/setup_variables/#bolus_render_over-1) setting).

<img src="..\img\UseNS08.png" style="zoom:80%;" />

</br>

##### Meal Bolus

##### Carb Correction

##### Snack Bolus

These treatments allow you to enter the amount of food you eat (and eventually the matching insulin treatment).

It will show as a circle with the higher half white (if including carbs), with its size depending on the amount of food. Without carbs the upper half will not be filled with the white color. If you add proteins and fat, the amount will display in this order: `carbs/proteins/fat`. With insulin the lower half of the circle will fill in blue and units will be indicated below.

You can select the timing of carbs absorption in `Carb Time` (i.e. when did you or will you actually eat these carbs) 

<img src="..\img\UseNS09.png" style="zoom:80%;" />

</br>

##### Combo Bolus

Combo bolus allows you to insert the corresponding bolus if you use a pump. Insert the total amount of insulin in `Insulin Given` then break down in `Split` with the percentage administered `now` and the `extended` amount. Enter the`Duration` of the extended bolus below.

It will display as a classic bolus at treatment time and [basal](../../nightscout/setup_variables/#basal-basal-profile) will reflect the extended amount for the selected duration.

<img src="..\img\UseNS10.png" style="zoom:80%;" />

</br>

##### Announcement

Announcements are used to change your page title in order to alert viewers.

Entering another treatment will acknowledge the announcement and return your page title to [default](../../nightscout/setup_variables/#custom_title-nightscout). 

<img src="..\img\UseNS11.png" style="zoom:80%;" />

</br>

##### Note

##### Question

Notes and questions are a way to add comments and interact with others using your Nightscout page. 

<img src="..\img\UseNS12.png" style="zoom:80%;" />

</br>

##### Exercise

You can log physical activities and specify the duration. 

<img src="..\img\UseNS13.png" style="zoom:80%;" />

</br>

##### Pump Site Change `cage`

##### CGM Sensor Start `sage`

##### CGM Sensor Insert

##### CGM Sensor Stop

##### Pump Battery Change `bage`

##### Insulin Cartridge Change `iage`

Logging these events will help you remember various expirations dates and will update the [corresponding pills](../../nightscout/setup_variables/#cage-cannula-age-sage-sensor-age-iage-insulin-age-bage-battery-age) if enabled. 

<img src="..\img\UseNS14.png" style="zoom:80%;" />

</br>

##### Temp Basal Start

##### Temp Basal Stop

You can indicate temporary basal rate changes using either a percentage change or the absolute rate. You need basal to be enabled to visualize it.

<img src="..\img\UseNS15.png" style="zoom:80%;" />

</br>

##### Profile Switch

If you have more than one profile store, you can switch profile to keep your profile parameters synchronized.

For a temporary switch (like for physical activities) you can select the duration.

<img src="..\img\UseNS16.png" style="zoom:80%;" />

</br>

## Edit Mode (`edit`)

For values still present on your display (last 48 hours), you can use Edit to move or delete bolus and correction treatments.

<img src="..\img\UseNS17.png" /> will change color to red in edit mode <img src="..\img\UseNS18.png">.

1. Drag the treatment in the past or future in the black area to move both food and insulin.
2. If you want to move only insulin drop in the blue area. 
3. For carbs only, in the white area. 
4. To delete a complete treatment drop it in the red delete area.

Once done, exit the edit mode by de-selecting it (white on black background). <img src="..\img\UseNS17.png" /> 

<img src="..\img\UseNS19.png"/>

</br>

*More to come soon...*

