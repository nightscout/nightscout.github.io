
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
Fly.io proposes a [simple migration wizard from Heroku](/vendors/fly.io/migrate.md) and you can create your new Nightscout site in Fly.io. Using a computer is mandatory with Fly.io as managing your site will require the use of a command line utility. **Not recommended for beginners.**

**Pros**:  
* Nightscout fits in the free tier  
* Easy to migrate an existing site from Heroku 

**Cons**:  
* **Maintaining your site requires the use of a computer with command line instructions, not very intuitive**  
* Migrated Heroku sites store variables as secrets  
* Relying on the MongoDB Atlas database
```

</br>

## Step 0: Create a database

```{admonition} Fly.io doesn't include a database
:class: note
Make sure you [created one](/nightscout/database) before starting your Nightscout web app creation with Fly.io.
Come back here when you have a `MONGODB_URI` connection string.
```



```{admonition} Migrating?
:class: tip
Copy the connection string from your previous platform: [edit the variables](/nightscout/setup_variables.md#nightscout-configuration) and look for `MONGODB_URI`.
If you don't see `MONGODB_URI` but see `MONGO_CONNECTION` (**NOT** `MONGO_COLLECTION`): use its value.
```

</br>

## Step 1: Create a GitHub account and fork the Nightscout project

```{tab-set}

:::{tab-item} I don't have a GitHub Account
### Create a GitHub account
::: {include} /vendors/github/create.md
### Fork the Nightscout project
:::{include} /vendors/github/fork.md
:::

:::{tab-item} I already have a GitHub Account
### Update your Nightscout fork
:::{include} /vendors/github/update_b.md
:::

```

</br>

## Step 2: Download fly.io Command Line Interface (CLI)

Fly.io is mainly managed through a command line interface (CLI). The first step will be installing the CLI [which is documented here](https://fly.io/docs/flyctl/installing/). 

<br>

## Step 3: Create a fly.io account

a) `flyctl auth signup` will begin the signup process, alternatively go to [https://fly.io/app/sign-up](https://fly.io/app/sign-up) to login.  
Sign up with Github.

</br>

b) `Authorize Fly.io` for GitHub:

<img src="/vendors/fly.io/img/FlyIOA3.png" width="400px" />

</br>

c) You don't need to input card information to get Nightscout running so click the `Try fly.io for free` button:

<img src="/vendors/fly.io/img/FlyIOA1.png" width="400px" />

</br></br>

## Step 4: Locally fork and deploy cgm-remote-monitor

a) Clone the `cgm-remote-monitor` repository locally:

If necessary install [Git](https://git-scm.com/downloads) on your computer (pick your own OS in Downloads).

Open a PowerShell (Windows) or a terminal (OSX/Linux), and type (replace `yourGitHubNameHere` by your own GitHub account name):

`git clone https://github.com/yourGitHubNameHere/cgm-remote-monitor`

<img src="/vendors/fly.io/img/FlyIO01.png" width="600px" />

</br>

b) Navigate to the directory where you code has been cloned locally

`cd cgm-remote-monitor`

</br>

c) Download this [**fly.toml template**](/_static/fly.toml) deployment file and save it/copy it into your `cgm-remote-monitor` folder.

</br>

```{warning}
Do NOT sync your local fly,toml with GitHub to avoid exposing all your passwords on GitHub!!!
```

</br>

## Step 5: Setting Variables

Open the `fly.toml` configuration file in your `cgm-remote-monitor` folder and customize it.

a) `API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

```{warning}
The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**.
```

</br>

b) Set the units to use for Nightscout where acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`). 

</br>

c) Now you need the connection string you defined during the Atlas cluster creation (as the example below, but not the string below).

Make sure it looks like this one below and NOTE: THERE ARE NO < AND > CHARACTERS:

Example for MongoDB Atlas:

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority`

Example for a MongoDB database:

`mongodb://nightscout:soo5ecret@mydbhosting.fqd/mydatabase`

```{hint}
Ensure you have `" "` surrounding your URI to make sure all of it is captured within the variable.
```

</br>

d) If you want to link your Dexcom Share account as a data source, complete the following lines: `BRIDGE_USER_NAME`, `BRIDGE_PASSWORD` and `BRIDGE_SERVER`.

```{note}
If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing using Dexcom Share and the `bridge` plugin.
```

</br>

```{admonition} MOST COMMON ERRORS
:class: hint
The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead. See [here](/troubleshoot/dexcom_bridge/) for troubleshooting tips and information on your Dexcom account.
```

```{admonition} Password
:class: note
*Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*
```

```{hint}
You need to have at least one follower to use Dexcom Share. See [here](/uploader/setup.md#dexcom).
```

 </br>

e) In [`ENABLE`](/nightscout/setup_variables.md#enable), copy and paste the following words (separated by a space) so that won't have to think about which you want now:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors`

**If you are using your Dexcom share account as a data source** also add `bridge` at the end, after a space like this:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge`


```{hint}
Ensure you have `" "` surrounding your words to make sure all of them are captured within the variable.
```

</br>

f) You can customize other variables or leave default values.

</br>

g) You can now deploy your site with Fly.io.  
Type the following command:

`flyctl launch`

</br>

To the question `Would you like to copy its configuration to the new app?` answer `Y` (yes). 

To the question: `App Name (leave blank to use an auto-generated name):` answer with the same same you've put in the `fly.toml` file in the top line `app = ""`.

To the question  `Select region: ` select the region closer to where you live (using the up and down arrows).

<img src="/vendors/fly.io/img/FlyIO03.png" width="600px" />

To the question `Would you like to set up an Postgresql database now?` answer `N` (no).

To the question `Would you like to set up an Upstash Redis database now?` answer `N` (no).

To the question `Would you like to deploy now?` answer `Y` (yes). 

<img src="/vendors/fly.io/img/FlyIO02.png" width="600px" />

</br>

Deploy will take some time. Do not interrupt the process.

<img src="/vendors/fly.io/img/FlyIO04.png" width="600px" />

</br>

If you see the following text:

`1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]`

You have successfully deployed Nightscout in Fly.io. Congratulations.

If you see an unhealthy condition, check your `fly.toml` configuration (for missing " " for example) and type:

`flyctl deploy`

</br>

h) Once your site has processed the variables and redeployed itself it will be ready to use. In your fly.io dashboard at [https://fly.io/dashboard](https://fly.io/dashboard) click on the application (not the builder):

<img src="/vendors/fly.io/img/FlyIOA2.png" width="700px" />

</br>

i) Inside your app you should see that it is running and has a clickable hostname.

<img src="/vendors/fly.io/img/FlyIO05.png" width="500px" />

</br>

```{include} /nightscout/first_setup.md

```

</br>

<!-- Somhow this natural anchor link doesn't work -->

## Editing Config Vars in Fly.io

</br>

You will find your Nightscout variables under different forms depending on your deployment method.

If you migrated using the wizard, they will be secrets.

If you deployed a new site as explained in this documentation they will be environment variables.

</br>

### Env variables

Environment variables can be viewed with [flyctl](https://fly.io/docs/hands-on/install-flyctl) using the following command:

`flyctl config env`

If you want to modify a configuration variable you need to edit the `fly.toml` file in your local `cgm-remote-monitor` copy (the one you created at [step 5](#step-5-setting-variables) above).

Once variable(s) modified, save the file and run the following command (from inside your `cgm-remote-monitor`).

`flyctl deploy`

</br>

### Secrets

Your variables are stored as secrets if you used the migration wizard.

```{admonition} Secrets
:class: warning
You **cannot see the values of your secret variables as they are secret**.
You can only delete them and set them: you **cannot edit them**.
Please make sure you write them down somewhere!
```

</br>

**Once Nightscout deployed, you need to install [flyctl](https://fly.io/docs/hands-on/install-flyctl/) to access your variables in order to change or customize your site.**
Variables are described [here](/nightscout/setup_variables.md#nightscout-config-vars).

[Sign in with GitHub](https://fly.io/docs/hands-on/sign-in/) in your CLI interface (Powershell/Terminal).  
A new browser will open. Select the entry with your email address.  
If required, authenticate through GitHub.

<img src="/vendors/fly.io/img/FlyM16.png" style="zoom:80%;" />

</br>

Fly.io variables are named `Secrets` and you cannot visualize them.  
Look [here](https://fly.io/docs/getting-started/working-with-fly-apps/#working-with-secrets) for more details.

</br>

If you want to create a new variable or modify an existing one you need to use the `flyctl secrets set` command.  
For example if you want to set your Nightscout site vertical scale to linear:

`flyctl secrets set SCALE_Y="linear" -a yourappname`

If your `SCALE_Y` variable was already set to `linear` you will see the following message:  
`Error No change detected to secrets. Skipping release.`

When changing a variable, the app will automatically redeploy. You will see this sequence (it will take a few minutes):

```
Release v1 created
==> Monitoring deployment

 1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]
--> v1 deployed successfully
```

</br>
