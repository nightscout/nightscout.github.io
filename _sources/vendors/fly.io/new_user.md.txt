
# Nightscout in Fly.io

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{card}
## Fly.io
![Fly.io](/vendors/img/Fly.io.png)
^^^
You can create your new Nightscout site in Fly.io.

**Pros**:  
* Nightscout fits in the free tier  

**Cons**:  
* **Maintaining your site requires the use of command line instructions, not very intuitive**  
* Fly.io stores variables as secrets: you cannot read them  
* Relying on the MongoDB Atlas database
```

</br></br>

## Step 0: Create a database

```{tab-set}

:::{tab-item} I don't have a database yet
</br>Make sure you [create one](/nightscout/database) before starting your Nightscout web app creation with Fly.io.</br></br>
Come back here when you have a `MONGODB_URI` connection string.</br></br>
:::

:::{tab-item} I already have a database
</br>Copy the connection string from your previous platform: [edit the variables](/nightscout/setup_variables.md#nightscout-configuration) and look for `MONGODB_URI`.</br></br>
If you don't see `MONGODB_URI` but see `MONGO_CONNECTION` (**NOT** `MONGO_COLLECTION`): use its value.</br></br>
:::

```

</br></br>

## Step 1: Create a fly.io account

[Sign up](https://fly.io/app/sign-up) to Fly.io.

</br>

You will need to add credit card information to get Nightscout running.  
Whenever requested, add one to prove you're a real person:

<img src="/vendors/fly.io/img/FlyIOA1.png" width="400px" />

<img src="/vendors/fly.io/img/FlyM10.png" width="400px" />

</br>

Nightscout should run for free within the [allowances](https://fly.io/docs/about/pricing/#free-allowances). If you get billed, please report costs [here](https://github.com/nightscout/nightscout.github.io/issues/new) to have the documentation updated.

</br></br>

## Step 2: Install `flyctl`

```{warning}
The web terminal feature was removed from Fly.io.
You need a computer with flyctl.
```

Follow [these instructions](https://fly.io/docs/hands-on/install-flyctl/) to install `flyctl` on your computer.

*Note for Windows: you might experience issues with Git Bash or PowerShell, try an elevated command prompt.*

</br></br>

## Step 3: Prepare the Nightscout project

Type (or copy and paste) the following command in the terminal:</br>

a) Authenticate in Fly.io:

`flyctl auth login`

Clone the official Nightscout repository:

`git clone https://github.com/nightscout/cgm-remote-monitor`

</br>

b) Navigate to the Nightscout code directory copied locally with:

`cd cgm-remote-monitor`

</br>

c) Deploy your site with Fly.io.

`flyctl launch`

<img src="/vendors/fly.io/img/FlyIO06.png" width="600px" />

</br>

To the question `Would you like to tweak these setting before proceeding?` answer `Y` (yes).

A web page to your new project will open in Fly.io.

 d) Type your new Nightscout site name, make sure it is valid and isn't already used by someone else.

<img src="/vendors/fly.io/img/FlyIO07.png" width="600px" />

</br>

e) Select the region closest to where you live, but make sure it doesn't require a paid plan.

<img src="/vendors/fly.io/img/FlyIO08.png" width="600px" />

<img src="/vendors/fly.io/img/FlyIO09.png" width="600px" />

</br>

f) In services set the port to `1337`.

<img src="/vendors/fly.io/img/FlyIO10.png" width="600px" />

</br>

g) Make sure to select a `shared CPU 1x` with only `256MB` of memory to remain within the [free allowances](https://fly.io/docs/about/pricing/#free-allowances) limits.

<img src="/vendors/fly.io/img/FlyIO11.png" width="600px" />

</br>

h) Don't select any database and `Confirm Settings`.

<img src="/vendors/fly.io/img/FlyIO12.png" width="600px" />

</br>

i) Deployment will start. Wait until it completes.

<img src="/vendors/fly.io/img/FlyIO13.png" width="600px" />

<img src="/vendors/fly.io/img/FlyIO14.png" width="600px" />

</br></br>

## Step 5: Set your Nightscout secrets

a) Compile the information below.

File all necessary fields, click on the Validate button at the bottom of the form, if no error is seen you will have all variables displayed in the text box at the bottom, click on the Copy All button.

</br>

### **Mandatory variables**

These three variables below must have a value.

**MONGODB_URI**

The MongoDB Connection String to connect to your MongoDB cluster. If you don't have this from your Mongo database, please re-read installation instructions at [Nightscout database](https://nightscout.github.io/nightscout/database) before continuing

<input type="text" id="MONGODB_URI" value="" size="100"></br>

**API_SECRET**

<input type="text" id="API_SECRET" value="" size="40"></br>

A passphrase that must be at least 12 characters long. Avoid special characters, which can cause problems in some cases

**DISPLAY_UNITS**

<select id="DISPLAY_UNITS">
    <option value="MGDL" selected="selected">mg/dl</option>
	<option value="MMOL">mmol/l</option></select></br>


</br>Preferred BG units for the site: `mg/dl` or `mmol/l` (or just `mmol`)

</br>

### **Customizations**

Leave default values if you don't want to change them

**CUSTOM_TITLE**

<input type=text id=CUSTOM_TITLE value="Nightscout" size=40></br>

The display name for the Nightscout site. Appears in the upper left of the main view. Often set to the name of the CGM wearer

**THEME**

<select id="THEME">
      <option value="COLORS" selected="selected">colors</option>
      <option value="DEFAULT">default</option>
      <option value="COLORBLINDFRIENDLY">colorblindfriendly</option></select></br>


</br>Default setting for new browser views for the color theme of the CGM graph. (`default` `colors` or `colorblindfriendly`)

**ENABLE**

<input type=text id=ENABLE value="careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors" size=100></br>

Plugins to enable for your site. Must be a space-delimited lower-case list. Include the word `bridge` here if you are receiving data from the Dexcom Share service

**SHOW_PLUGINS**

<input type=text id=SHOW_PLUGINS value="careportal dbsize" size=100></br>

Default setting for whether or not these plugins are checked (active) by default not merely enabled. Include plugins here as in the ENABLE line; space-separated and lower-case

**TIME_FORMAT**

<select id="TIME_FORMAT">
        <option value="TWELVE" selected="selected">12</option>
        <option value="TWENTYFOUR">24</option></select></br>


</br>Default setting for new browser views for the time mode. (`12` or `24`)

**NIGHT_MODE**

<select id="NIGHT_MODE">
        <option value="OFF" selected="selected">off</option>
    <option value="ON">on</option></select></br>


</br>Default setting for new browser views for whether Night Mode should be enabled. (`on` or `off`)

**BOLUS_RENDER_OVER**

<input type=text id=BOLUS_RENDER_OVER value="1" size=10></br>

U value over which the bolus values are rendered on the chart if the `x U and Over` option is selected

</br>

### **Dexcom Share**

If you want Nightscout to import directly from Dexcom Share

**BRIDGE_USER_NAME**

 <input type=text id=BRIDGE_USER_NAME value="" size=40></br>

Your Dexcom account username to receive CGM data from the Dexcom Share service. Also make sure to include `bridge` in your ENABLE line.

**BRIDGE_PASSWORD**

<input type=text id=BRIDGE_PASSWORD value="" size=40></br>

Your Dexcom account password to receive CGM data from the Dexcom Share service. Also make sure to include `bridge` in your ENABLE line

**BRIDGE_SERVER**

<select id="BRIDGE_SERVER">
    <option value="US" selected="selected">US</option>
    <option value="EU">EU</option></select></br>


</br>If you are bridging from the Dexcom Share service and are anywhere *outside* the US change this to EU. (`US` or `EU`)

</br>

### **Alarms**

You can customize alarms or leave them to default values

**ALARM_TYPES**

<select id="ALARM_TYPES">
    <option value="SIMPLE" selected="selected">simple</option>
    <option value="PREDICT">predict</option>
    <option value="SIMPLEPREDICT">simple predict</option></select></br>


</br>`simple` and/or `predict`v. Simple alarms trigger when BG crosses the various thresholds set below. Predict alarms use a formula that forecasts where the BG is going based on its trend. You will *not* get warnings when crossing the BG thresholds set below when using the predict type

**ALARM_URGENT_HIGH**

<select id="ALARM_URGENT_HIGH">
    <option value="ON" selected="selected">on</option>
    <option value="OFF">off</option></br>
</br>Default setting for new browser views for the Urgent High alarm (triggered when BG crosses BG_HIGH). (`on` or `off`)



**BG_HIGH**

<input type=text id=BG_HIGH value="260" size=20></br>

Urgent High BG threshold triggers the `ALARM_URGENT_HIGH` alarm. Set in mg/dL or mmol/L as set in `DISPLAY_UNITS` variable

**ALARM_URGENT_LOW**

<select id="ALARM_URGENT_LOW">
    <option value="ON" selected="selected">on</option>
    <option value="OFF">off</option></br>
</br>Default setting for new browser views for the Urgent Low alarm (triggered when BG crosses `BG_LOW`). (`on` or `off`)



**BG_LOW**

<input type=text id=BG_LOW value="55" size=20></br>

Urgent Low BG threshold triggers the `ALARM_URGENT_LOW` alarm. Set in mg/dL or mmol/L as set in `DISPLAY_UNITS` variable

**ALARM_HIGH**

<select id="ALARM_HIGH">
    <option value="ON" selected="selected">on</option>
    <option value="OFF">off</option></br>
</br>Default setting for new browser views for the High alarm (triggered when BG crosses `BG_TARGET_TOP`). (`on` or `off`)



**BG_TARGET_TOP**

<input type=text id=BG_TARGET_TOP value="180" size=20></br>

High BG threshold triggers the `ALARM_HIGH` alarm. Set in mg/dL or mmol/L as set in `DISPLAY_UNITS` variable

**ALARM_LOW**

<select id="ALARM_LOW">
    <option value="ON" selected="selected">on</option>
    <option value="OFF">off</option></br>
</br>Default setting for new browser views for the Low alarm (triggered when BG crosses `BG_TARGET_BOTTOM`). (`on` or `off`)



**BG_TARGET_BOTTOM**

<input type=text id=BG_TARGET_BOTTOM value="70" size=20></br>

Low BG threshold triggers the `ALARM_LOW` alarm. Set in mg/dL or mmol/L as set in `DISPLAY_UNITS` variable

**ALARM_TIMEAGO_URGENT**

<select id="ALARM_TIMEAGO_URGENT">
    <option value="ON" selected="selected">on</option>
    <option value="OFF">off</option></br>
</br>Default setting for new browser views for an urgent alarm when CGM data hasn't been received in the number of minutes set in `ALARM_TIMEAGO_URGENT_MINS`. (`on` or `off`)



**ALARM_TIMEAGO_URGENT_MINS**

<input type=text id=ALARM_TIMEAGO_URGENT_MINS value="30" size=20></br>

Default setting for new browser views for the number of minutes since the last CGM reading to trigger an `ALARM_TIMEAGO_URGENT` alarm

**ALARM_TIMEAGO_WARN**

<select id="ALARM_TIMEAGO_WARN">
    <option value="ON" selected="selected">on</option>
    <option value="OFF">off</option></br>
</br>Default setting for new browser views for a warning alarm when CGM data hasn't been received in the number of minutes set in `ALARM_TIMEAGO_WARN_MINS`. (`on` or `off`)



**ALARM_TIMEAGO_WARN_MINS**

<input type=text id=ALARM_TIMEAGO_WARN_MINS value="15" size=20></br>

Default setting for new browser views for the number of minutes since the last CGM reading to trigger an `ALARM_TIMEAGO_WARN` alarm

<script>
function Validate()
{
  var s, e1, e2, e3;
  e1 = "";
  e2 = "";
  e3 = "";
  s = document.getElementById("MONGODB_URI").value;
  if(s.search("mongodb")==-1) { e1 = "Bad MONGODB_URI: it should be a mongodb connection string."}
  else if(s.search("://")==-1) { e1 = "Bad MONGODB_URI: it should be a mongodb connection string."}
  else if(s.search(" ")!=-1) {e1 = "MONGODB_URI should not contain spaces."}
  else if(s.search("<")!=-1) {e1 = "MONGODB_URI should not contain < or > characters."}
  else if(s.search(">")!=-1) {e1 = "MONGODB_URI should not contain < or > characters."}
  else if(s.indexOf("@")!=s.lastIndexOf("@")) {e1 = "Do not use the character @ in your MONGODB_URI password or user name."};
  document.getElementById("result1").innerHTML = e1;
  s = document.getElementById("API_SECRET").value;
  if(s.search("@")!=-1) { e2 = "Problematic API_SECRET: do not use special characters."}
  else if(s.search(":")!=-1) { e2 = "Problematic API_SECRET: do not use special characters."}
  else if(s.search("/")!=-1) { e2 = "Problematic API_SECRET: do not use special characters."}
  else if(s.search(" ")!=-1) { e2 = "Bad API_SECRET: do not use spaces."}
  else if(s.length<12) { e2 = "Bad API_SECRET: too short - minimum 12 characters."}
  document.getElementById("result2").innerHTML = e2;
  s = document.getElementById("BRIDGE_USER_NAME").value;
  if(s.length) { s = document.getElementById("BRIDGE_PASSWORD").value;
  if(s.length) { s = document.getElementById("ENABLE").value;
  if(s.search("bridge")==-1) { e3 = "Add bridge in ENABLE to get values from Dexcom Share." } } }
  s = document.getElementById("BRIDGE_USER_NAME").value;
  if(!s.length) { s = document.getElementById("BRIDGE_PASSWORD").value;
  if(!s.length) { s = document.getElementById("ENABLE").value;
  if(s.search("bridge")!=-1) { e3 = "Remove bridge from ENABLE if you don't use Dexcom Share directly to Nightscout." } } }
  document.getElementById("result3").innerHTML = e3;
  if((e1.length + e2.length + e3.length)<1)
  {
    document.getElementById("result1").innerHTML = "Validation is PASS.";
    document.getElementById("result3").innerHTML = "Click on the Copy All button below the text box.";
    CopyAll();
  }
};
function CopyAll()
{
  var sBuffer, sLine, sel;
  sBuffer = "#\n";
sel = document.getElementById("ALARM_LOW");
  sLine = "fly secrets set ALARM_LOW=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("ALARM_TIMEAGO_URGENT");
  sLine = "fly secrets set ALARM_TIMEAGO_URGENT=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("ALARM_TYPES");
  sLine = "fly secrets set ALARM_TYPES=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("ALARM_TIMEAGO_WARN");
  sLine = "fly secrets set ALARM_TIMEAGO_WARN=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("ALARM_URGENT_HIGH");
  sLine = "fly secrets set ALARM_URGENT_HIGH=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("ALARM_URGENT_LOW");
  sLine = "fly secrets set ALARM_URGENT_LOW=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("BRIDGE_SERVER");
  sLine = "fly secrets set BRIDGE_SERVER=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("DISPLAY_UNITS");
  sLine = "fly secrets set DISPLAY_UNITS=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("NIGHT_MODE");
  sLine = "fly secrets set NIGHT_MODE=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("THEME");
  sLine = "fly secrets set THEME=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sel = document.getElementById("TIME_FORMAT");
  sLine = "fly secrets set TIME_FORMAT=\"" + sel.options[sel.selectedIndex].text; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set ALARM_TIMEAGO_URGENT_MINS=\"" + document.getElementById("ALARM_TIMEAGO_URGENT_MINS").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set ALARM_TIMEAGO_WARN_MINS=\"" + document.getElementById("ALARM_TIMEAGO_WARN_MINS").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set API_SECRET=\"" + document.getElementById("API_SECRET").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set BG_HIGH=\"" + document.getElementById("BG_HIGH").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set BG_LOW=\"" + document.getElementById("BG_LOW").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set BG_TARGET_BOTTOM=\"" + document.getElementById("BG_TARGET_BOTTOM").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set BG_TARGET_TOP=\"" + document.getElementById("BG_TARGET_TOP").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set BOLUS_RENDER_OVER=\"" + document.getElementById("BOLUS_RENDER_OVER").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set BRIDGE_PASSWORD=\"" + document.getElementById("BRIDGE_PASSWORD").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set BRIDGE_USER_NAME=\"" + document.getElementById("BRIDGE_USER_NAME").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set CUSTOM_TITLE=\"" + document.getElementById("CUSTOM_TITLE").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set ENABLE=\"" + document.getElementById("ENABLE").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set MONGODB_URI=\"" + document.getElementById("MONGODB_URI").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n";
sLine = "fly secrets set SHOW_PLUGINS=\"" + document.getElementById("SHOW_PLUGINS").value; sBuffer = sBuffer + sLine;
  sBuffer = sBuffer + "\"\n#\n";
  document.getElementById("NSVARS").innerHTML = sBuffer;
};
function CopyToClipboard() {
  var copyText = document.getElementById("NSVARS");
  copyText.select();
  copyText.setSelectionRange(0, 99999); // For mobile devices
  navigator.clipboard.writeText(copyText.value);
   alert("Secrets configuration copied.");
}
</script>




Now click on the Validate button below

  <button onclick="Validate()">-> Validate</button>

If errors show up below, please correct them and click Validate again.

<p id="result1">Click the button Validate above.</p>
<p id="result2"></p>
<p id="result3"></p>

<textarea id="NSVARS" name="NSVARS" rows="27" cols="100">
Once validated you will see the fly.toml configuration file contents in this box.
</textarea></br>
</br></br>
<button onclick="CopyToClipboard()">Copy All</button>
</br></br>

```{admonition} Save this!
:class: warning
What you just copied is the secrets configuration used to build your site.</br>
This is important information to maintain your Nightscout.</br>
**Make sure you keep a copy of it somewhere safe.**
```

</br>

b) Click on the `Copy all` button above.

```{tip}
Now do not copy anything else!</br>
If you do another copy/paste after you clicked the `Copy All` button, click again **now** before pasting the configuration! 
```

</br>

c) Then, in the terminal, paste what you copied above, hit `Enter`

<img src="/vendors/fly.io/img/FlyIO21.png" width="600px" />

</br>

Wait until setting secrets complete.

<img src="/vendors/fly.io/img/FlyIO22.png" width="600px" />

</br></br>

## Step 6: Deploy Nightscout

a) In the terminal type:

`flyctl deploy`

You app will deploy. It will take time (about 10 minutes).

<img src="/vendors/fly.io/img/FlyIO17.png" width="600px" />

</br>

Do not interrupt the process.

</br>

When deploy completes you should see your new Nightscout site name.

<img src="/vendors/fly.io/img/FlyIO18.png" width="600px" />

</br>

b) Last but not least: downscale your app typing the following command (replace *`myflynightscout`* with your own name): 

`flyctl scale --app `*`myflynightscout`*` count 1`

Confirm with `y` when asked.

<img src="/vendors/fly.io/img/FlyIO15.png" width="800px" />

</br>

c) You can now see your site in the fly.io dashboard at [https://fly.io/dashboard](https://fly.io/dashboard) click on the application (not the builder):

<img src="/vendors/fly.io/img/FlyIOA2.png" width="700px" />

</br>

d) Inside your app you should see that it is running and has a clickable hostname.

<img src="/vendors/fly.io/img/FlyIO05.png" width="500px" />

</br></br></br>

```{include} /nightscout/first_setup.md

```

</br>

(editing-config-vars-in-fly-io)=

## Editing Config Vars in Fly.io

```{warning}
The web terminal feature was removed from Fly.io.
You need a computer with flyctl.
```

Follow [these instructions](https://fly.io/docs/hands-on/install-flyctl/) to install `flyctl` on your computer.

*Note for Windows: do not use Git Bash on your PC, prefer a PowerShell terminal.*

Authenticate in Fly.io:

`flyctl auth login`

</br></br>

```{admonition} Secrets
:class: warning
Fly.io variables are `Secrets`, you **cannot see the values of your secret variables**.</br>
You can only delete them and set them: you **cannot edit them**.</br>
Please make sure you write them down somewhere!
```

</br>

If you want to create a new secret or modify an existing one you need to use the `flyctl secrets set` command.

In the command line below replace `yourappname` by the app name (usually your Nightscout site name: **`yourappname`**`.fly.dev`). 
For example if you want to set your Nightscout site vertical scale to linear:

`flyctl secrets set SCALE_Y="linear" -a `*`yourappname`*`

If your `SCALE_Y` secret was already set to `linear` you will see the following message:  

```
Error No change detected to secrets. Skipping release.
```

When changing a secret, the app will automatically redeploy. You will see this sequence (it will take a few minutes):

```
Release v1 created
==> Monitoring deployment

 1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]
--> v1 deployed successfully
```

</br>

```{hint}
If you know you will change several secrets, add `--stage` to all the lines except the last one.
</br></br>
`flyctl secrets set SCALE_Y="linear" -a yourappname --stage`
</br>
`flyctl secrets set SCALE_Y="linear" -a yourappname --stage`
</br>
...
</br>
`flyctl secrets set SCALE_Y="linear" -a yourappname`
</br></br>
This will avoid your app to redeploy every time.
```

</br>

If the app didn't deploy automatically continue [here](#step-6-deploy-nightscout).
