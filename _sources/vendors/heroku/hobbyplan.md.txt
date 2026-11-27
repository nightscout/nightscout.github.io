# Heroku Basic plan

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

## Upgrade to 7$/month Basic Plan

</br>

```{admonition} 5$/month Eco Plan
You can also select a more economic [eco plan upgrade](/vendors/heroku/ecoplan).
```

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

- Select `Basic ($7/dyno/month)` then click `Save`

<img src="/vendors/heroku/img/HerokuH02.png" width="600px" >

</br>

- Your Nightscout Heroku app is now using a `Basic` plan.

<img src="/vendors/heroku/img/HerokuH03.png" width="600px" >

- **Make sure your credit card information is up to date!**  
  Go to your `Account settings`.

<img src="/vendors/heroku/img/NewNS13.png" width="600px" >

- `Billing`

<img src="/vendors/heroku/img/NewNS14.png" width="600px" >

- Verify the credit card you used is still valid, in case of doubt `Change credit card` and enter a valid credit card.

<img src="/vendors/heroku/img/HerokuH04.png" width="600px" >

</br>

