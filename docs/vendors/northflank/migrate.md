# Migrate from Heroku to Northflank keeping your MongoDB Atlas database

<span style="font-size:smaller;">**APPLIES TO:**</span>  <img src="../../img/Heroku.png" style="zoom:80%;" /> + <img src="../../img/Atlas.png" style="zoom:80%;" />  ⟹   <img src="../../img/Northflank.png" style="zoom:80%;" /> + <img src="../../img/Atlas.png" style="zoom:80%;" />

---

!!!info "Cost"

You can migrate from Heroku to Northflank and **keep your Nightscout site for free** (maintaining your MongoDB Atlas database).

</br>

Keep in mind the free M0 MongoDB Atlas database size is limited to 512MB and you will eventually need to perform [cleanup](../../../nightscout/admin_tools/#database-maintenance), make sure you add [`dbsize`](../../../nightscout/setup_variables/#dbsize-database-size) in `enable` to avoid unexpected Nightscout failure. You can increase database size with an [M2 shared cluster](https://www.mongodb.com/docs/atlas/manage-clusters/#shared-clusters), the additional cost is 9$ per month.

<span style="font-size:larger;">Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.</span>

</br>

**WORK IN PROGRESS DO NOT USE**

<img src="../../../img/WIP.png" style="zoom:80%;" />

</br>

## Step 1 - Log into Northflank

a) Sign-up to [Northflank](https://app.northflank.com/signup) in a new browser tab. Login with GitHub (click on the logo).

<img src="../img/Northflank00.png" style="zoom:80%;" />

</br>

b) Confirm your GitHub account if required.

<img src="../img/Northflank01.png" style="zoom:80%;" />

</br>

c) Click `Authorize northflank`.

<img src="../img/Northflank02b.png" style="zoom:80%;" />

</br>

c) Enter a user name, your email address and invent a password (type it twice to confirm). Accept the TOS and Privacy Policy then click  `Continue `.

<img src="../img/Northflank03.png" style="zoom:80%;" />

</br>

d) Click `Choose theme`.

<img src="../img/Northflank04.png" style="zoom:80%;" />

</br>

e) Select `Skip for now`.

<img src="../img/Northflank05.png" style="zoom:80%;" />

</br>

f) Select `Create free project`.

<img src="../img/Northflank06.png" style="zoom:80%;" />

</br>

g) Enter a project name (for example Nightscout) and select a region (you can make it geographically close to where you live) then click `Create project`.

<img src="../img/Northflank07.png" style="zoom:80%;" />

</br>

## Step 2 - Link Heroku and import

a) Go to your `Account` `Dashboard` - `Settings` and scroll down to `Import`.  
Select Heroku.

<img src="../img/NorthflankM01.png" style="zoom:80%;" />

!!!note  "If you don't see this option, send a mail to Northflank support to request access to the feature."

</br>

b) Click `Link Heroku`.

<img src="../img/NorthflankM02.png" style="zoom:80%;" />

</br>

c) Login in Heroku.

<img src="../img/NorthflankM03.png" style="zoom:80%;" />

</br>

d)  Click `Allow`.

<img src="../img/NorthflankM04.png" style="zoom:80%;" />

</br>

e)  Select your Nightscout Heroku app then click `Continue`.

<img src="../img/NorthflankM05.png" style="zoom:80%;" />

</br>

f)  Select your project (the one you created in **Step 1.g**) then click `Continue`.

<img src="../img/NorthflankM06.png" style="zoom:80%;" />

</br>

g)  Verify the branch you want to migrate, usually it's `master` unless you know why you need another one.

<img src="../img/NorthflankM07.png" style="zoom:80%;" />

</br>

h)  **Optional** if your Heroku wasn't on stack 22 select  `heroku/builder-classic:22` unless you know why you want to use another one.

<img src="../img/NorthflankM08.png" style="zoom:80%;" />

</br>

i)  Modify your compute plan to the smallest **`nf-compute-10`** and click `Continue`.

<img src="../img/NorthflankM09.png" style="zoom:80%;" />

</br>

j)  Wait until import completes then return to your Dashboard (top left).

<img src="../img/NorthflankM10.png" style="zoom:80%;" />

</br>

Congratulations. You migrated from Heroku to Northflank.

Click the site name to open Nightscout.

<img src="../img/NorthflankM11.png" style="zoom:80%;" />

</br>

## Step 3 - Update your uploaders and downloaders

Now you will need to update all the devices connected to Nightscout with the new web address.

!!!warning "Change the URL!"  
    Note that Northflank will display he same information than Heroku even if you don't do so, but this will stop when Heroku will shutdown the free service.  
    **Make sure you update the [uploader](../../../uploader/setup/) and [follower](../../../nightscout/downloaders/) devices with the new code.run address!**

#### Uploaders

For Dexcom users, if you use the bridge plugin you should be set.  
xDrip+ users (including Medtronic CareLink followers) should update the uploader as shown [here](../../../uploader/setup/#xdrip).  
xDrip4iOS users [here](https://xdrip4ios.readthedocs.io/en/latest/connect/cgm/#nightscout-upload).  
[AAPS](https://androidaps.readthedocs.io/en/latest/Configuration/Preferences.html#nsclient) and [Loop](https://loopkit.github.io/loopdocs/operation/loop-settings/services/): consult the relative documentation to change your site name.

</br>

To fully test your new Northflank Nightscout app: put your Heroku app in [maintenance mode](../../../troubleshoot/heroku/#maintenance-mode).  
If things don't go as expected, you can disable it and return to Heroku whilst you fix it.  
**Better test it now than once Heroku will shutdown your app.**

</br>
