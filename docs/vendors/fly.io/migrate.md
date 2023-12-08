---
orphan: true
---

# Migrate from Heroku to Fly.io

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
Fly.io proposes a simple migration wizard from Heroku] and you can create your new Nightscout site in Fly.io. Managing your site will require the use of a command line utility.

**Pros**:  
* Nightscout fits in the free tier  
* Easy to migrate an existing site from Heroku 

**Cons**:  
* **Maintaining your site requires the use command line instructions, not very intuitive**  
* Migrated Heroku sites store variables as secrets  
* Relying on the MongoDB Atlas database
```

</br>

## Step 1 - Migrate your Heroku app to Fly.io

a) Open the Fly.io Heroku migration page [https://fly.io/launch/heroku](https://fly.io/launch/heroku).

<img src="/vendors/fly.io/img/FlyM01.png" width="400px" />

</br>

b) Click `Sign in to Heroku`.

<img src="/vendors/fly.io/img/FlyM02.png" width="400px" />

</br>

c) Enter your Heroku credentials and `Log In`.

<img src="/vendors/heroku/img/UpdateNS15.png" width="400px" >

</br>

d) `Allow` Fly.io to access your Heroku account.

<img src="/vendors/fly.io/img/FlyM03.png" width="400px" />

</br>

e) In `Configure Heroku` you should see your name in the organization.

<img src="/vendors/fly.io/img/FlyM04.png" width="400px" />

</br>

f) For `PICK AN APP NAME` put the name of your new Fly.io Nightscout site (you can put the same than Heroku if you want).

<img src="/vendors/fly.io/img/FlyM05.png" width="400px" />

</br>

g) [`REGION`](https://fly.io/docs/reference/regions/) is the physical location closer to you where the app will run. Leave default.

<img src="/vendors/fly.io/img/FlyM06.png" width="400px" />

</br>

h) The Heroku app you need to choose here is your Heroku Nightscout app.

<img src="/vendors/fly.io/img/FlyM07.png" width="400px" />

</br>

i) Click `Deploy Heroku app!`

<img src="/vendors/fly.io/img/FlyM08.png" width="400px" />

</br>

j) You need to enter a physical identification (to demonstrate you're not a robot) this will be done using a credit card.  
Select `Click here to add a payment method...`

<img src="/vendors/fly.io/img/FlyM09.png" width="400px" />

</br>

k) Enter you credit card information and click `Save Card`. You will be billed 0$ or a bank fee.

<img src="/vendors/fly.io/img/FlyM10.png" width="400px" />

</br>

l) You should be driven back to the screen shown on step i.  
If you're not, retry from the beginning and now Fly.io shouldn't ask for a credit card anymore.

Deploy will start. Be patient and don't click anything until it's complete. It might take up to 20 minutes.

<img src="/vendors/fly.io/img/FlyM11.png" width="200px" />

</br>

m) When deployment is complete you will see the information of your new Fly.io Nightscout site.  
The App URL is your Nightscout site web address, only it's ending by `.fly.dev` instead of `.herokuapp.com`.

<img src="/vendors/fly.io/img/FlyM12.png" width="400px" />

</br>

n) If you open this URL you will see it's replicating real time your Heroku Nightscout with the exact same settings.

</br>

```{warning}
Migrated sites will use a dedicated IP, that is a billable feature ($1.90/month).
You will need to release the address and get a shared one. See [here](/troubleshoot/fly.io.md#obtain-a-free-shared-ip) how to proceed.
```

</br>

## Step 2 - Remove the Heroku webhook to Fly.io

a) By defaut Fly.io has made a link to Heroku so that whatever happens in Heroku (updates, variables changes, etc...) is mirrored to Fly.io.  
**You don't want this.  
You need to detach Fly.io from Heroku now.**

Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login)

<img src="/vendors/heroku/img/UpdateNS15.png" width="400px" >

</br>

b) Select your Nightscout app, top right `More`, then `View Webhooks`.

<img src="/vendors/fly.io/img/FlyM13.png" width="800px" />

</br>

c) Scroll down to your webhook, open the menu at the end of the line and `Remove` it.

<img src="/vendors/fly.io/img/FlyM14.png" width="800px" />

</br>

d) Confirm with `Delete`.

<img src="/vendors/fly.io/img/FlyM15.png" width="500px" />

</br>

Your Fly.io Nightscout is now independent from Heroku.

</br>

## Step 3 - Backup your Heroku variables

```{admonition} Heroku Variables
:class: warning
You cannot see your variables values in Fly.io.</br>
You cannot edit them.</br>
You MUST have a backup of your Heroku variables for maintenance purposes.</br>
```

Reveal your Heroku Nightscout app [Config Vars](/vendors/heroku/new_user.md#editing-config-vars-in-heroku) and copy all variables names and values in a spreadsheet.

```{warning}
Save this information in a safe place!
```

</br>

## Step 4 - Downscale your webapp

You app will most probably be deployed on several virtual resources and this will generate costs!

Follow [these guidelines](/troubleshoot/fly.io.md#downscale-your-app) to downscale it to one machine only.

</br>

## Step 5 - Update your uploaders and downloaders

Now you will need to update all the devices connected to Nightscout with the new web address.

```{admonition} Change the URL!
:class: warning
**Make sure you update the [uploader](/uploader/setup/) and [follower](/nightscout/downloaders/) devices with the new `fly.dev` address!**
```

</br>

To fully test your new Fly.io Nightscout app: put your Heroku app in [maintenance mode](/troubleshoot/heroku.md#maintenance-mode).  
If things don't go as expected, you can disable it and return to Heroku whilst you fix it.  
</br>
