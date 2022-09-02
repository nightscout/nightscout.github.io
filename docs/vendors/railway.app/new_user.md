# Railway Nightscout

------

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../img/railway-app-logo.png" style="zoom:80%;" />+<img src="../../../vendors/img/Atlas.png" style="zoom:80%;" />

------

!!!info "Cost"  
    [Railway.app](https://railway.app/) offers 500 free hours of execution usage per month for the [Starter plan](https://docs.railway.app/reference/plans#starter-plan), that is not enough for loopers, but can be great for a few weeks evaluation or for light users of Nightscout.
    The [Developer plan](https://docs.railway.app/reference/plans#developer-plan-offering) should be sufficient for loopers and anyone depending on Nightscout as a mission critical app. Costs will vary depending on your use (We expect the amount to be below or around $5 per month).  
    Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.

</br>

This page is under construction. Do not follow these instructions yet.

<img src="/img/WIP.png" align="center">

</br>

## Set up new Nightscout

### Create your Railway, GitHub and Atlas accounts from a computer.

Do not change device/computer/browser during the setup process!

!!! note
    If you have unexpected issues when creating your site, restart with another browser.

</br></br>


### Step 1: Create a GitHub account

</br>

!!! warning "If you already have a GitHub account and previously forked cgm-remote-monitor"
    [Delete your current cgm-remote-monitor fork.](../../../update/redeploy/#step-1-cleanup-github)

If you don't have a GitHub account [create one](../../../nightscout/github/#create-a-github-account) and come back.

</br></br>

### Step 2: Create an Atlas account

Follow [these steps](../../../vendors/mongodb/atlas/#create-an-atlas-database) and come back.

</br></br>

### Step 3: Create a Railway account

Open a new browser tab in [https://railway.app/new](https://railway.app/new) and select `GitHub`.

<img src="../img/Railway01.png" style="zoom:80%;" />

Select `Authorize Railway App`.

<img src="../img/Railway02.png" style="zoom:80%;" />

Click on `Please agree to the new terms to keep on using Railway`.

<img src="../img/Railway03.png" style="zoom:80%;" />

Scroll down and click `I agree with Railway's Terms of Service`.

<img src="../img/Railway04.png" style="zoom:60%;" />

Scroll down and click `I will not deploy any of that`.

<img src="../img/Railway05.png" style="zoom:60%;" />

You should now see this. You've created your Railway account,

<img src="../img/Railway06.png" style="zoom:80%;" />

</br></br>

### Step 4: Fork and deploy cgm-remote-monitor

</br>

Click on the `Deploy on Railway` button below:

[ ![]( https://railway.app/button.svg) ](https://railway.app/new/template?template=https%3A%2F%2Fgithub.com%2Fnightscout%2Fcgm-remote-monitor&plugins=mongodb&envs=API_SECRET%2CAUTH_DEFAULT_ROLES%2Cenable%2CMONGODB_URI%2CDISPLAY_UNITS&optionalEnvs=MONGODB_URI&API_SECRETDesc=A+passphrase+that+must+be+at+least+12+characters+long.&AUTH_DEFAULT_ROLESDesc=Possible+values+readable%2C+denied%2C+or+any+valid+role+name.+When+readable%2C+anyone+can+view+Nightscout+without+a+token.+Setting+it+to+denied+will+require+a+token+from+every+visit%2C+using+status-only+will+enable+api-secret+based+login.&enableDesc=Plugins+to+enable+for+your+site.+Must+be+a+space-delimited%2C+lower-case+list.&MONGODB_URIDesc=The+connection+string+required+to+access+your+database+%28where+all+your+data+is+stored+in+the+cloud%29.&DISPLAY_UNITSDesc=Preferred+BG+units+for+the+site%3A+mg%2Fdl+or+mmol%2FL+%28or+just+mmol%29.+Setting+to+mmol%2FL+puts+the+entire+server+into+mmol%2FL+mode+by+default%2C+no+further+settings+needed.&AUTH_DEFAULT_ROLESDefault=denied&enableDefault=careportal+basal+dbsize+rawbg+iob+maker+cob+bwp+cage+iage+sage+boluscalc+pushover+treatmentnotify+loop+pump+profile+food+openaps+bage+alexa+override+speech+cors)

Click `Configure`

<img src="../img/Railway07.png" style="zoom:80%;" />

Click `Install & Authorize`

<img src="../img/Railway08.png" style="zoom:80%;" />

You will then see this page, scroll down to define the [required variables](../../../nightscout/setup_variables/#required-variables) for creating your Nightscout site.

<img src="../img/Railway09.png" style="zoom:80%;" />

Mind if you see this you will need to [delete the`cgm-remote-monitor` fork in GitHub](#step-1-create-a-github-account) and retry `Deploy` afterwards.

<img src="../img/Railway17.png" style="zoom:80%;" />

`API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

!!!warning "The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**."

<img src="../img/Railway10.png" style="zoom:80%;" />

Now you need the connection string you defined during the [Atlas cluster creation](../../../vendors/mongodb/atlas/) (as the example below, but not the string below). Copy and paste it in the `MONGODB_URI` variable field.

It will look like this:

`mongodb+srv://nightscout:soo5ecret@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority`

<img src="../img/Railway12.png" style="zoom:80%;" />

Select the units you’re using in `DISPLAY_UNITS` acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="../img/Railway13.png" style="zoom:80%;" />

Two optional variables are already setup for you, open the caret to see them (recommended).

<img src="../img/Railway15.png" style="zoom:80%;" />

If you want to ensure that ONLY someone with permission to view your site (e.g., a token or the `API_SECRET`) is able to view the data, you should configure the [`AUTH_DEFAULT_ROLES`](../setup_variables/#auth_default_roles) variable in as `denied`.  
If you want your site to be visible to anybody set it as `readable`.

<img src="../img/Railway11.png" style="zoom:80%;" />

A common list of [`enable`](../../../nightscout/setup_variables/#enable) variables is predefined, you can change them if you know why.  
It's recommended that you leave them like this for now.

<img src="../img/Railway14.png" style="zoom:80%;" />

Once all your variables defined you can `Deploy`.

<img src="../img/Railway16.png" style="zoom:80%;" />

</br></br>


## Migrate Nightscout

Coming soon.
