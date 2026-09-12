# Heroku Eco plan

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{card}
## Heroku
![Heroku Eco](/vendors/img/Heroku.png)
^^^
Since the [beginning](https://github.com/nightscout/cgm-remote-monitor/pull/98) Heroku has been a very popular platform for Nightscout. Most of the documentation was based on a Heroku Nightscout.  
On August 25th 2022, Salesforce decided to [drop the free plan](https://blog.heroku.com/next-chapter). 
You can create your new Nightscout site with Heroku using an Eco plan (5$/month).

**Pros**:  
* Large platform with a reliable history
* Well documented, well known by the community

**Cons**:  
* The Eco plan has the same limitations than the previous Free plan, for 5$ per month
* For a Nightscout site a 7$ per month Basic plan is not really worth it (compared to hosted solutions)
* Relying on the MongoDB Atlas database
```

</br>

## Enable a 5$/month Eco Plan

</br>

```{warning}
Heroku billing is monthly.</br>
One minute of Eco plan will be billed 5$ in the current month.</br>
Switching billable plan during the same month with add another plan billing for the whole month.
```

</br>

- Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login)

<img src="/vendors/heroku/img/UpdateNS15.png" width="400px" >

</br>

- Select your app (hidden in yellow)

<img src="/vendors/heroku/img/UpdateNS16.png" width="600px" >

</br>

- Click `Resources` then select `Change Dyno Type`

<img src="/vendors/heroku/img/HerokuH01.png" width="600px" >

</br>

- Select `Eco ($5 for 1000 Dyno Hours/Month)` then click `Save`

<img src="/vendors/heroku/img/HerokuE02.png" width="600px" >

</br>

- Your Nightscout Heroku app is now using an `Eco` plan.

<img src="/vendors/heroku/img/HerokuH03.png" width="600px" >

- **Make sure your credit card information is up to date!**  
  Go to your `Account settings`.

<img src="/vendors/heroku/img/NewNS13.png" width="600px" >

- `Billing`

<img src="/vendors/heroku/img/NewNS14.png" width="600px" >

- Verify the credit card you used is still valid, in case of doubt `Change credit card` and enter a valid credit card.

<img src="/vendors/heroku/img/HerokuH04.png" width="600px" >

</br>

</br>

### Prevent your Nightscout app from falling asleep

```{admonition} Use with caution
:class: warning
If an app fails and crashes at startup (database full), if you entered wrong credentials and the app stops for missing data activity, using this trick to keep it alive will not help. It might even make things worse in the case of wrong Dexcom credentials and lead to a locked account.
```

This is necessary if you don't have an uploader sending data to Nightscout, or a follower polling data from it.  
For example using the bridge plugin.

- You can use monitoring webapps like Uptime Robot, New Relic, ...

</br>
