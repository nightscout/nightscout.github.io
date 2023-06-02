---
orphan: true
---

c) Open a new browser tab or window and Log in [Heroku](https://id.heroku.com/login), select your app

<img src="/vendors/heroku/img/SetupNS00.png" width="800px" /></br>

</br>

d) Click `Settings`

<img src="/vendors/heroku/img/SetupNS01.png" width="800px" /></br>

</br>

e) Scroll down and click `Reveal Config Vars`

<img src="/vendors/heroku/img/SetupNS02.png" width="800px" /></br>

</br>

f) Put the two windows Heroku and Azure side by side

<img src="/vendors/azure/img/Azure16.png" width="800px" /></br>

</br>

Now for every (no, not necessarily, read until **i** and come back) variable you need to do the following:

g) Click + New application setting

<img src="/vendors/azure/img/Azure35.png" width="300px" /></br>

</br>

h) In Name write the variable name from the first column in Heroku  
Then, in the line below, Value, paste the value from the second column in Heroku.

<img src="/vendors/azure/img/Azure38.png" width="300px" /></br>

Then click OK and go for the next one.

</br>

You might not need to copy ALL the values, if you know which ones you need you can go ahead.  
If you don't really know which ones you want to copy there's only few that are strictly necessary:

**`API_SECRET`**  
**`MONGODB_URI`**  *Note: if you don't see `MONGODB_URI` but see `MONGO_CONNECTION` (NOT `MONGO_COLLECTION`) use its value.*  
**`DISPLAY_UNITS`**

in `ENABLE` paste this:

If you don't use Dexcom Share to get your BG data in Nightscout, copy the line below to Value:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors`

If you want to use Dexcom Share as a data source copy this one (it includes the keyword `bridge`):

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge`

If you have your data coming directly from Dexcom share those three:

`BRIDGE_USER_NAME`  
`BRIDGE_PASSWORD`  
`BRIDGE_SERVER`

<img src="/vendors/azure/img/Azure15.png" width="600px" /></br>

</br>

i) When you're done copying, click Save, then Continue.

<img src="/vendors/azure/img/Azure39.png" width="400px" /></br>

</br>