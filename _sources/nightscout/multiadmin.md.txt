# Multiple sites and support

</br>

Either by necessity or to support others, you might want to have access to multiple accounts without having to juggle between logins and passwords. Below are described some centralizing methods reducing the administrative burden.

</br>

## Remote support and security

Giving username and passwords to someone in order to obtain help to fix Nightscout issues raises serious security issues. Malicious code can be added to your Nightscout project by ill-intentioned people. Always make sure the version deployed is a fork of the official project. After receiving help, good practice is to change your passwords and your API secret.

When possible prefer inviting collaborators (see below) and remove them once the issue is fixed.

</br>

## Github

You need only one Github account since you can connect multiple web apps to the same GitHub account.

Using this strategy you only need to update one GitHub account when a new Nightscout version is released and you will be able to deploy it in all your web apps.

```{hint}
If you have several web apps connected to the same GitHub repository you must use the [standard update method](/update/update/).
**Not redeploy** (else you'll break all the links to the repository).
```

</br>

### Enable automatic deploys in Heroku

Automatic deploys will allow you to update automatically your Heroku apps when you update the GitHub repository: you will not need to login into Heroku and perform Manual Deploy, as soon as a new version will be merged into GitHub an automated deploy will trigger in all enabled Heroku apps.

- To enable automatic deploy, [log in Heroku](https://dashboard.heroku.com/apps/) and select your app, then `Deploy`. Verify GitHub and your `cgm-remote-monitor` app are connected.

<img src="/vendors/heroku/img/MultiNS06.png" width="800px" >

</br>

- Verify the `master` branch is selected and click `Enable Automatic Deploys`.

<img src="/vendors/heroku/img/MultiNS04.png" width="800px" >

</br>

- Your Heroku site will update automatically every time you update the GitHub repository.

<img src="/vendors/heroku/img/MultiNS05.png" width="800px" >

</br>

### Automatic deploys in Railway and Northflank

You don't need to do anything as all your web apps will upgrade automatically when you upgrade GitHub.

</br>

## Heroku

You can setup multiple Nightscout sites per Heroku account. You be charged the Eco/Basic plan fee for each app.

You can setup collaborators in Heroku to avoid having to switch accounts. First decide on which will be your main Heroku account. Then add the email address you used to register as collaborator to the other(s) one(s).

</br>

- Log into your other Heroku account and select your app.  

<img src="/vendors/heroku/img/MultiNS00.png" width="800px" >

</br>

-  Select `Access`.

<img src="/vendors/heroku/img/MultiNS01.png" width="800px" >

</br>

- Click `Add collaborator` and enter the email address you used to create your main Heroku account.

<img src="/vendors/heroku/img/MultiNS02.png" width="800px" >

</br>

- You will now see it as a collaborator. Using the pen icon you can modify it or delete it.

<img src="/vendors/heroku/img/MultiNS03.png" width="800px" >

</br>

- Log in your main Heroku account. You will see the apps you are collaborating to in the same list than your primary app. You can now perform most tasks directly in that one Heroku account (deploys, change variables, ...).

<img src="/vendors/heroku/img/MultiNS07.png" width="800px" >

</br>

## Atlas

You can invite another user in your organization in order to manage several organizations from the same Atlas account.

[Log into](https://account.mongodb.com/account/login) your **secondary** Atlas account: that is the other account you want to administer from your first (main) Atlas account.

</br>

- Top menu, click `Access Manager` and select `Organization Access` from the drop down menu

<img src="/vendors/mongodb/img/MultiNS08.png" width="600px" >

</br>

- Click `Invite Users`

<img src="/vendors/mongodb/img/MultiNS09.png" width="800px" >

</br>

- Enter the email address you used to create your **main** Atlas account.

<img src="/vendors/mongodb/img/MultiNS10.png" width="600px" >

</br>

- Select `Organization Owner` then click `Invite to Organization`.

```{warning}
Make sure you enable `Organization Owner` for the invited user!
```

<img src="/vendors/mongodb/img/MultiNS11.png" width="600px" >

</br>

- Log out of your **secondary** Atlas account and log in your **main** Atlas account.

- Top left, from the drop down menu click the caret and select `View all Organizations`

<img src="/vendors/mongodb/img/MultiNS12.png" width="600px" >

</br>

- In the left menu, click `Invitations` then click `ACCEPT` the invitation you performed from your **secondary** Atlas account.

<img src="/vendors/mongodb/img/MultiNS13.png" width="800px" >

</br>

- Going back to all your organizations you can now see and administer both of them from this account. In the example below `Nightscout` is the **main** organization and `My Org 2020-09-20` is a **secondary** organization.

<img src="/vendors/mongodb/img/MultiNS14.png" width="800px" >

</br>

```{hint}
You can rename your organizations from the top left cog (Settings) then clicking the pen icon.
```

<img src="/vendors/mongodb/img/MultiNS15.png" width="600px" >



