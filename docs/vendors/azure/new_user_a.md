---
orphan: true
---

c) Click + New application setting

<img src="/vendors/azure/img/Azure35.png" width="400px" /></br>

</br>

d) In Name write `MONGODB_URI`  

**Mind your database type!**

```{tab-set}

:::{tab-item} I have an Atlas/Railway/Northflank database</br>
In the line below, Value, paste the connection string you obtained after creating your database.</br></br>
:::

:::{tab-item} I have a Cosmos database</br>
In the line below, Value, paste the connection string **with socketTimeoutMS**.</br></br>
:::

```

<img src="/vendors/azure/img/Azure36.png" width="800px" /></br></br>
Then click OK.

</br>

e) Click again + New application setting (like in c. above) and write `API_SECRET` in Name.  
`API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

```{warning}
The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**.
```

<img src="/vendors/azure/img/Azure37.png" width="300px" /></br>

Click OK.

</br>

f) Click again + New application setting and write `DISPLAY_UNITS` in Name.  
Acceptable choices for the units used in Nightscout are `mg/dl` or `mmol/L` (or just `mmol`).

<img src="/vendors/azure/img/Azure38.png" width="300px" /></br>

Click OK.

</br>

g) Click again + New application setting and write `ENABLE` in Name.  
If you don't use Dexcom Share to get your BG data in Nightscout, copy the line below to Value:

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors`

If you want to use Dexcom Share as a data source copy this one (it includes the keyword `bridge`):

`careportal basal dbsize rawbg iob maker cob bwp cage iage sage boluscalc pushover treatmentnotify loop pump profile food openaps bage alexa override speech cors bridge`

Click OK.

</br>

h) If you want to use Dexcom Share to have your data in Nightscout directly, you will need to add these three variable Names:

`BRIDGE_USER_NAME`   Your Dexcom account username to receive CGM data from the Dexcom Share service.  
`BRIDGE_PASSWORD`     Your Dexcom account password to receive CGM data from the Dexcom Share service.  
`BRIDGE_SERVER`          US if your Dexcom account is in the US, or, if you are bridging from the Dexcom Share service and are anywhere *outside* the US change this to EU.

!!!note  
    If you use a DIY closed loop system it is recommended that you let it upload to Nightscout instead of importing using Dexcom Share and the `bridge` plugin.

<img src="/vendors/azure/img/Azure15.png" width="600px" /></br>

</br>

**Remember to add `bridge` at the end of the `enable` variable in the list below.**

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

i) Click Save, then Continue.

<img src="/vendors/azure/img/Azure39.png" width="400px" /></br>

</br>