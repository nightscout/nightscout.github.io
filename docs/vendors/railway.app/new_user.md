# Railway Nightscout

---

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../img/railway-app-logo.png" style="zoom:80%;" />+<img src="../../../vendors/img/Atlas.png" style="zoom:80%;" />

---

!!!info "Cost"  
 [Railway.app](https://railway.app/) offers 500 free hours of execution usage per month for the [Starter plan](https://docs.railway.app/reference/plans#starter-plan), that is not enough for loopers, but can be great for a few weeks evaluation or for light users of Nightscout.
The [Developer plan](https://docs.railway.app/reference/plans#developer-plan-offering) should be sufficient for loopers and anyone depending on Nightscout as a mission critical app. Costs will vary depending on your use (We expect the amount to be below or around $5 per month).  
 Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.

</br>

## Set up new Nightscout

### Create your Railway and GitHub accounts from a computer.

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

### Step 2: Create a Railway account

Open [railway](https://railway.app) in a new browser tab and click `login`.

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

### Step 3: Deploy cgm-remote-monitor

</br>

Click on the `Deploy on Railway` button below:

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/XvAfVW)

Click `Configure`

<img src="../img/Railway07.png" style="zoom:80%;" />

---

Note: if you are asked to verify your account, follow these instructions:

1. click verify account

<img src="../img/Railway18.png" style="zoom:80%;" />

1. provide a payment method (don't worry, they are just verifying your card with a temporary charge)

<img src="../img/Railway19.png" style="zoom:80%;" />

1. wait until the payment card is verified successfully

<img src="../img/Railway20.png" style="zoom:80%;" />

Now click on the `Deploy on Railway` button below:

[![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/new/template/XvAfVW)

---

Click `Install & Authorize`

<img src="../img/Railway08.png" style="zoom:80%;" />

You will then see this page, scroll down to define the [required variables](../../../nightscout/setup_variables/#required-variables) for creating your Nightscout site.

<img src="../img/Railway09.png" style="zoom:80%;" />

Mind if you see this you will need to [delete the`cgm-remote-monitor` fork in GitHub](#step-1-create-a-github-account) and retry `Deploy` afterwards.

<img src="../img/Railway17.png" style="zoom:80%;" />

`API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

!!!warning "The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**."

<img src="../img/Railway10.png" style="zoom:80%;" />

Leave MONGODB_URI blank for now.

<img src="../img/Railway21.png" style="zoom:80%;" />

Three optional variables are already setup for you, open the caret to see them (recommended).

<img src="../img/Railway15.png" style="zoom:80%;" />

If you want to ensure that ONLY someone with permission to view your site (e.g., a token or the `API_SECRET`) is able to view the data, you should configure the [`AUTH_DEFAULT_ROLES`](../setup_variables/#auth_default_roles) variable in as `denied`.  
If you want your site to be visible to anybody set it as `readable`.

<img src="../img/Railway11.png" style="zoom:80%;" />

A common list of [`enable`](../../../nightscout/setup_variables/#enable) variables is predefined, you can change them if you know why.  
It's recommended that you leave them like this for now.

<img src="../img/Railway14.png" style="zoom:80%;" />

Select the units you’re using in `DISPLAY_UNITS` acceptable choices are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="../img/Railway13.png" style="zoom:80%;" />

Once all your variables defined you can `Deploy`, and wait until it is complete.

<img src="../img/Railway16.png" style="zoom:80%;" />

Once your app is deployed, we need to set the MONGODB_URI.

<img src="../img/Railway22.png" style="zoom:80%;" />

Click the Mongo service, and then click on the connect tab

<img src="../img/Railway23.png" style="zoom:80%;" />

<img src="../img/Railway24.png" style="zoom:80%;" />

Copy the connection url

<img src="../img/Railway25.png" style="zoom:80%;" />

click on the nightscout service and click on the environment tab

<img src="../img/Railway26.png" style="zoom:80%;" />
<img src="../img/Railway27.png" style="zoom:80%;" />

Add a new variable by clicking `New Variable`

<img src="../img/Railway28.png" style="zoom:80%;" />

For the variable name, enter MONGODB_URI

<img src="../img/Railway29.png" style="zoom:80%;" />

For the variable value, paste the connection url we copied from the mongo service. It will look like this:

`mongodb://mongo:secret@containers-us-west-19.railway.app:6450`

<img src="../img/Railway30.png" style="zoom:80%;" />

Click add, and you should now see the MONGODB_URI is set

<img src="../img/Railway31.png" style="zoom:80%;" />
<img src="../img/Railway32.png" style="zoom:80%;" />

Now lets deploy nightscout. We can trigger a deployment by modifying our fork, or via the [railway cli](https://docs.railway.app/develop/cli) by running [railway up](https://docs.railway.app/develop/cli#deploy)

</br></br>

## Migrate Nightscout

Coming soon.
