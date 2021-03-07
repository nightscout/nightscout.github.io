

# New Nightscout Users

</br>

Nightscout is DIY (Do It Yourself), if you don’t feel confident that you have the necessary skills, give it a try. You’ll find people that is willingly to help you setting it up in many Facebook groups. For free. Paying it forward.

If you want to [sell installations](https://github.com/nightscout/nightscout.github.io/wiki/Can-I-sell-Nightscout), keep in mind you will be legally liable and can easily be sued by your buyers should anything bad happen to them because of Nightscout. Nightscout is not approved by FDA, CE, ... this is the reason why it's DIY.

</br>

### Security and safekeeping

It's **highly important** you understand you have to take computer security seriously when setting up Nightscout. We assume you have full legal ownership of all data being stored in your installation of Nightscout and that there are thus no liabilities you'd need to respond to regarding the data. Depending on how you use Nightscout, an unauthorized user could cause harm by for example changing the CGM data shown by Nightscout. We have no evidence of this having ever happened to anyone, but to keep it that way, take the following guidelines to heart:

- Use the same email address for all accounts to ensure you have access to the accounts going forward. Do not use a disposable email address.
- Do not use the same password for all your accounts, and choose passwords that are not easy to guess.
- Do not use the API_SECRET for the Atlas database password.
- Do not use your Dexcom or CareLink user name or password for Nightscout components.
- Do not share the API_SECRET or other passwords to your accounts to others.
- Do not use Nightscout or any related applications on rooted and/or otherwise compromized devices, and ensure you always have the latest operating system and virus protection updates installed.

If you want to read more about Nightscout security, including about additional configuration options to make your installation more secure, please check our [security guide](../security/).

Print this [document](./NightscoutDataRecord.pdf) to record all information during installation. Store it together securely with your diabetes documentation.

</br>

#### **Here is a step-by-step guide for completing your own Nightscout site DIY style.**

</br>

### Create your Heroku, GitHub, and Atlas accounts from a computer.

Do not change device/computer/browser during the setup process!

!!! note
    If you have unexpected issues when creating your site, restart with another browser.

!!! warning "If this is not your first attempt to deploy Nightscout"
    You might want to do some [cleanup](../../troubleshoot/cleanup/) before.

</br></br>


## Step 1: Create a GitHub account

</br>

!!! warning "If you already have a GitHub account and previously forked cgm-remote-monitor"
    Make sure you delete your current cgm-remote-monitor fork using [Step 1 of this guide (ONLY STEP1!)](../../update/redeploy/#step-1-cleanup-github).

!!! note
    You do not need several GitHub accounts for several Nightscout sites. You can connect one GitHub account to multiple Heroku apps and accounts.

</br>

- Click this link to create a GitHub account: [https://github.com/](https://github.com/)
- Enter a username (anything you want and that is accepted, not very important), email, and password.
- Then click `Sign up for GitHub`

<img src="..\img\NewNS00.png" style="zoom:80%;" />

</br>

- Play and solve the puzzle then click `Join a free plan`.

<img src="..\img\NewNS01.png" style="zoom:80%;" />

</br>

- Type your interests (not important) then click `Complete setup`.



<img src="..\img\NewNS02.png" style="zoom:80%;" />

</br>


- GitHub will send you a verification email, open your mail and check your inbox (check your spam-folder if not received after a couple of minutes).

<img src="..\img\NewNS03.png" style="zoom:80%;" />

</br>

- Click `Verify email address` in the verification email from GitHub.

<img src="..\img\NewNS04.png" style="zoom:80%;" />

</br>



- This will open a new page in your browser, click `Skip this for now`.

<img src="..\img\NewNS05.png" style="zoom:80%;" />

</br>

- Leave the page open as it is.

<img src="..\img\NewNS06.png" style="zoom:80%;" />

</br></br>

## Step 2: Create a Heroku account

</br>

- Click this link to create an Heroku account: [https://signup.heroku.com/login](https://signup.heroku.com/login)

- Enter mandatory data (*) and click `CREATE FREE ACCOUNT`

<img src="..\img\NewNS07.png" style="zoom:80%;" />

</br>


- Heroku will send a confirmation email, open your mail and check your inbox (check your spam-folder if not received after a couple of minutes).

<img src="..\img\NewNS09.png" style="zoom:70%;" />

</br>

- Click on the activation link

<img src="..\img\NewNS10.png" style="zoom:80%;" />

</br>

- Create a password, it is important that you write it down for later usage. Click `SET PASSWORD AND LOG IN`

<img src="..\img\NewNS11.png" style="zoom:80%;" />

</br>

- Click `CLICK HERE TO PROCEED`

<img src="..\img\NewNS12.png" style="zoom:70%;" />

</br>

- Your Heroku page will open, click on your profile picture, in the top right corner, and select `Account Settings`

<img src="..\img\NewNS13.png" style="zoom:80%;" />

</br>

- Click on `Billing`

<img src="..\img\NewNS14.png" style="zoom:80%;" />

</br>

- Click `Add credit card`

<img src="..\img\NewNS15.png" style="zoom:80%;" />

</br>

- Enter your credit card information and click `Save Details`

!!! note "Note"
    Unless you voluntarily select billable features, your credit card information is only used for verifications and you will not be charged anything. Worst case you’ll be charged $0.00</br>

<img src="..\img\NewNS16.png" style="zoom:80%;" />

</br>

- You should now have 2 pages open: Heroku and GitHub. Leave them open.</br></br>

## Step 3: Create an Atlas account

</br>

- Open another tab at: [https://www.mongodb.com/cloud/atlas](https://www.mongodb.com/cloud/atlas) and click `Start Free`



<img src="..\img\NewNS17.png" style="zoom:70%;" />

</br>

- Enter your information and then click `Get Started Free`

<img src="..\img\NewNS18.png" style="zoom:80%;" />

</br>

- Select `Create a cluster in Shared Clusters (FREE)`

<img src="..\img\NewNS19.png" style="zoom:80%;" />

</br>

- Leave all default values and click `Create Cluster`

<img src="..\img\NewNS20.png" style="zoom:80%;" />

</br>

Atlas will create your default cluster, wait until it is complete... (can take more than 3 minutes)

<img src="..\img\NewNS21.png" style="zoom:80%;" />

</br>

- Click on `CONNECT`

<img src="..\img\NewNS22.png" style="zoom:100%;" />

</br>

- Click on `Allow Access from Anywhere`

!!!warning "If you don't allow access from anywhere (IP 0.0.0.0/0) Nightscout will not be able to access your database."

<img src="..\img\NewNS23.png" style="zoom:80%;" />

</br>

- Click on `Add IP Address`

<img src="..\img\NewNS24.png" style="zoom:80%;" />

</br>

- Add a database username (for example `nightscout`) and a database password (in the example below `soo5ecret`).

!!! warning "Database credentials: Do not use your Atlas account credentials. Do not use special characters: only letters and numbers."

Write down these credentials in the boxes below (yes, in this browser window you're reading now, unless you're reading a printed version). You’ll need them later.

Database password: <input type="text" id="myPwd" value="soo5ecret" size="20">

Database username: <input type="text" id="myUsr" value="nightscout" size="20">

</br>

- Then click `Create Database User`.

<img src="..\img\NewNS25.png" style="zoom:80%;" />

</br>

- Click on `Choose a connection method`

<img src="..\img\NewNS26.png" style="zoom:80%;" />

</br>

- Select `Connect your application`

<img src="..\img\NewNS27.png" style="zoom:80%;" />

</br>

- Copy the connection string: click `Copy` and paste it somewhere to edit it (like Notepad).

<img src="..\img\NewNS28.png" style="zoom:100%;" />

</br>

- Paste the string in the box below (yes, in this browser window you're reading now, unless you're reading a printed version).

<input type="text" id="myAtlas" value="" size="100">

</br>

!!!info "It should be similar to this (`xxxxx` will be different):"
    `mongodb+srv://nightscout:<password>@cluster0.xxxxx.mongodb.net/<dbname>?retryWrites=true&w=majority`
</br>

- Invent a name for your database, this is not a critical information (for example `mycgmic`).

Database Name: <input type="text" id="mydB" value="mycgmic" size="20">

</br>

- Click the `Generate` button (just here below this line: in this browser window you're reading):

<button onclick="Generate()">Generate</button>

<p style="font-size:25px" id="result">The connection string will appear here</p>

<script>
var bAtlas;
var sdB, sPwd;
var sFinalString = "Not defined yet";

function Generate()
{
  var sString = sFinalString;

  bAtlas=0;
  var sString = "Looks good!";
  var sAtlas = document.getElementById("myAtlas").value;
  sPwd = document.getElementById("myPwd").value;
  sdB = document.getElementById("mydB").value;
  var iAS = sAtlas.search("://");
  if(iAS!=11) { sString = "Atlas URI should start with mongodb+srv://"; }
  else
  {
    var iAP = sAtlas.search("<password>");
    if(iAP==-1) { sString = "Atlas URI should contain &lt;password&gt;"; }
    else
    {
      var iAD = sAtlas.search("<dbname>");
      if(iAD==-1) { sString = "Atlas URI should contain &lt;dbname&gt;"; }
      else
      {
      	bAtlas=1;
        sString = sAtlas.substring(0,iAP);
        sFinalString = sString.concat(sPwd, sAtlas.substring(iAP+10, iAD));
        sString = sAtlas.substring(iAP+10, iAD);
        sFinalString = sFinalString.concat(sdB, sAtlas.substring(iAD+8));
      }
    }
  }

  if(bAtlas) document.getElementById("result").innerHTML = sFinalString;
  else document.getElementById("result").innerHTML = sString;
}
</script>

</br>

!!!warning
    Keep this string safely aside, it is called your `MONGODB_URI`

</br>

- If you want to do it manually: replace `<password>` with your database password as noted previously (in the example below `soo5ecret`) and `<dbname>` by any text you want, say `mycgmic` for example. The result will be like this:

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority`

!!! note
    There are no < and > characters in the final string, neither for password nor for database name.

</br></br>



## Step 4: Fork and deploy cgm-remote-monitor

</br>

!!! warning "If you previously forked cgm-remote-monitor before reaching this step, you should delete the existing cgm-remote-monitor repository before proceeding"
    Delete your current cgm-remote-monitor fork using [Step 1 of this guide (ONLY STEP1!)](../../update/redeploy/#step-1-cleanup-github). </br>


- You should now have 3 pages opened in your browser: Heroku, Atlas, and Github, Make sure you are logged-in on each one
   (i.e. not asking you to login) before you continue.

- Click this link [https://github.com/nightscout/cgm-remote-monitor](https://github.com/nightscout/cgm-remote-monitor), a new GitHub page will open. Click on `Fork`

  

  <img src="..\img\NewNS29.png" style="zoom:80%;" />

  </br>

- Wait for a moment

<img src="..\img\NewNS30.png" style="zoom:80%;" />

</br>

- Scroll down and click `Deploy to Heroku`

<img src="..\img\NewNS31.png" style="zoom:80%;" />

<img src="..\img\NewNS32.png" style="zoom:80%;" />

</br>

!!! note "You're getting into the core setup of your site"

    Below you'll see the minimum required configuration, you can modify the variables later in Heroku. You will find a more complete list here: [Setup](..\setup_variables)

</br>

- Enter your CGM in the Cloud site name: invent a name you will use to see your BG in the cloud. Confirm that the name is available.

- Don’t change the region.

<img src="..\img\NewNS33.png" style="zoom:80%;" />

</br>

Scroll down and setup the following variables:

 </br>

- `API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces and @ or ! symbols**: it is recommended to use only letters and digits.

!!!warning "The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**."

<img src="..\img\NewNS34.png" style="zoom:80%;" />

</br>

- If you want to link your Dexcom Share account as a data source, complete the following lines:

<img src="..\img\NewNS35.png" style="zoom:80%;" />

</br>

!!!info "MOST COMMON ERRORS"
    The `BRIDGE_PASSWORD` and `BRIDGE_USER_NAME` are NOT visible from within your Dexcom app or online account. These values are what you entered into your Dexcom mobile app when you logged into that app for the VERY FIRST time. The `BRIDGE_USER_NAME` is not an email address. The most common error on initial Nightscout setups is that people incorrectly use an old account or an old password. To test your username and password, go to Dexcom's Clarity page (check [here for USA accounts](https://clarity.dexcom.com) and [here for the others](https://clarity.dexcom.eu)) and try logging in to your Dexcom account. If your account info isn't valid, or you don't see any data in your Clarity account... you need to figure out your actual credentials before moving ahead.

!!! note "Password"
    *Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.*

!!! info
    You need to have at least one follower to use Dexcom Share. See [here](../../uploader/setup/#dexcom).

</br>

- If you want to link your CareLink account as a data source, complete the following lines:

<img src="..\img\NewNS36.png" style="zoom:80%;" />

</br>

- Select the units you’re using in `DISPLAY_UNITS` acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="..\img\NewNS37.png" style="zoom:80%;" />

</br>

- In `ENABLE`, copy and paste the following words (separated by a space) so that won't have to think about which you want now:

`careportal basal dbsize rawbg iob maker bridge cob bwp cage iage sage boluscalc pushover treatmentnotify mmconnect loop pump profile food openaps bage alexa override speech cors`

<img src="..\img\NewNS38.png" style="zoom:80%;" />

!!! note "`ENABLE` words"
    You find more information about the `ENABLE` words on the: [Setup page](..\setup_variables)

</br>

- Now you need the connection string you defined during the Atlas cluster creation (as the example below, but not the string below). Copy and paste it in the `MONGODB_URI` variable field.

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/mycgmic?retryWrites=true&w=majority`

<img src="..\img\NewNS39.png" style="zoom:80%;" />

</br>

- Scroll down to the end of the list and click `Deploy app`

<img src="..\img\NewNS40.png" style="zoom:80%;" />

</br>

- **WAIT** until completion (will take some time). Do not interrupt the process until it's complete.

<img src="..\img\NewNS41.png" style="zoom:80%;" />

</br>

- Then click `View` (if nothing happens, click `Manage App` -> `Open App`, in upper right corner)

<img src="..\img\NewNS42.png" style="zoom:80%;" />

</br>

- Your Nightscout site should open and direct you to a new profile creation.

<img src="..\img\NewNS50.png" style="zoom:100%;" />

</br>

- Setup your `Time zone` and eventually all other fields. Do not leave any fields empty. If you don't know which value to use, just use the default value. You can change these values later at any time.

<img src="..\img\NewNS44.png" style="zoom:80%;" />

</br>

- Browse down to `Authentication status` and click `Authenticate`. Enter your API secret. Click `Update`.

<img src="..\img\NewNS45.png" style="zoom:80%;" />

</br>

- Click `Save`.

<img src="..\img\NewNS46.png" style="zoom:80%;" />

</br>

- If the following pop-up shows up click `OK`, and check status (upper right of the window).

<img src="..\img\NewNS47.png" style="zoom:80%;" />

</br>

- If you need to modify your profile after this, authenticate with the lock icon (top right of the page): enter your API secret. Then click on the hamburger menu and select `Profile Editor`.

<img src="..\img\NewNS43.png" style="zoom:80%;" />

</br>

!!!warning "Privacy warning"
    Anyone with access to the URL of your Nightscout site, can view your BG and run reports of your data. It it strongly recommended that you enable [security](../security) to your site once you're done with the setup.  

</br>

- Dexcom Share and CareLink users should see data flowing in after some minutes. Other uploaders like xDrip+, Spike, xDrip4iOS, etc will need to be setup with the Nightscout address and API secret in the app.

<img src="..\img\NewNS48.png" style="zoom:80%;" />

</br>

##### Papertrail

- Finally, you might want to modify the `PAPERTRAIL_API_TOKEN` line. Heroku offers a free, tiny amount of Papertrail service (this is like a logging service for how the site is running), but this generates a lot of confusion to most people later on, when they get a message that their "Free Papertrail Service has run out of room". Papertrail is not needed, edit the line and add `DISABLED` at the end, so that you can recover the function if you need it later.

<img src="..\img\NewNS49.png" style="zoom:80%;" />

</br></br>



## Step 5: Uploader setup

</br>

Continue to [uploader](../../uploader/setup/) setup.



