# Multiple sites and support

</br>

You might need to have access to multiple accounts without having to juggle between logins and passwords. Below are described some centralizing methods reducing the administrative burden.

</br>

## Remote support and security

Giving username and passwords to someone in order to obtain help to fix Nightscout raises serious security issues. Malicious code can be added to your Nightscout project by ill-intentioned people. Always make sure the version deployed is a fork of the official project. After receiving help, good practice is to change your passwords (if shared) and your API secret.

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

You can setup multiple Nightscout sites per Heroku account. You be charged the Eco/Basic plan fee for **each app**.

You can setup collaborators in Heroku. This is very useful for remote support.

</br>

### Invite someone as a collaborator

- Log into your Heroku account and select your app.  

<img src="/vendors/heroku/img/MultiNS00.png" width="800px" >

</br>

-  Select `Access`.

<img src="/vendors/heroku/img/MultiNS01.png" width="800px" >

</br>

- Click `Add collaborator` and enter the email address of the person supporting you (that is the email address he used to setup his own Heroku account).

<img src="/vendors/heroku/img/MultiNS02.png" width="800px" >

</br>

- You will now see it as a collaborator. Using the pen icon you can modify it or delete it (useful when asking for support, once everything is working).

<img src="/vendors/heroku/img/MultiNS03.png" width="800px" >

</br>

### Being a collaborator

*Note: you will receive an email with the invitation.*

- Log in your Heroku account. You will see the apps you are collaborating to in the same list than your primary app. You can now perform most tasks directly in that one Heroku account (deploys, change variables, ...).

<img src="/vendors/heroku/img/MultiNS07.png" width="800px" >

</br>

## Atlas

You can invite another user in your organization in order to manage several organizations from the same Atlas account. This is very useful for remote support.

### Invite another user

[Log into](https://account.mongodb.com/account/login) your Atlas account.

</br>

- Top menu, click `Access Manager` and select `Organization Access` from the drop down menu

<img src="/vendors/mongodb/img/MultiNS08.png" width="600px" >

</br>

- Click `Invite Users`

<img src="/vendors/mongodb/img/MultiNS09.png" width="800px" >

</br>

- Enter the email address of the person supporting you (that is the email address he used to setup his own Atlas account).

<img src="/vendors/mongodb/img/MultiNS10.png" width="600px" >

</br>

- Select `Organization Owner` then click `Invite to Organization`.

```{warning}
**Make sure you enable `Organization Owner` for the invited user!**
```

<img src="/vendors/mongodb/img/MultiNS11.png" width="600px" >

</br>

### Being invited

*Note: you will receive an email with the invitation.*

- Log  in your own Atlas account.

- Top left, from the drop down menu click the caret and select `View all Organizations`

<img src="/vendors/mongodb/img/MultiNS12.png" width="600px" >

</br>

- In the left menu, click `Invitations` then click `ACCEPT` the invitation.

<img src="/vendors/mongodb/img/MultiNS13.png" width="800px" >

</br>

- Going back to all your organizations you can now see and administer both of them from this account. In the example below `Nightscout` is your own organization and `My Org 2020-09-20` is a guest organization.

<img src="/vendors/mongodb/img/MultiNS14.png" width="800px" >

</br>

```{hint}
You can rename your organizations from the top left cog (Settings) then clicking the pen icon.
```

<img src="/vendors/mongodb/img/MultiNS15.png" width="600px" >

</br>

## Northflank

You can setup two Nightscout sites per Northflank account. The 20$ per month credit applies.

You can setup teammates in Northflank.

</br>

### Invite a teammate

- Log into your Northflank account and select `Overview`, in `Members` click **`+`** to add a teammate.  

<img src="/vendors/northflank/img/NorthflankS1.png" width="600px" >

</br>

- Enter the email address of the person supporting you (that is the email address he used to setup his own Northflank account). Add `Admin` privileges if you want him to interact with your data, leave `Default` for an observer.

<img src="/vendors/northflank/img/NorthflankS2.png" width="400px" >

</br>

- You can manage teammates in `Members`: change privileges and delete them, or revoke invitations.

</br>

### Being invited

You will receive an email with the invitation.

You will see the invitee project with yours.

</br>

## Railway

- Open your Railway [dashboard](https://railway.app/dashboard) and select your project.

<img src="/vendors/railway/img/RailwayM15.png" width="400px" >

</br>

- Top right select `Settings` and `Members`.
- Enter the email address of the person supporting you (that is the email address he used to setup his own Railway account). Select `Can Edit` privileges if you want him to interact with your data, leave `Can View` for an observer.

<img src="/vendors/railway/img/RailwayS1.png" width="800px" >

- Confirm the invite with `Invite to project`.

<img src="/vendors/railway/img/RailwayS2.png" width="400px" >

</br>

### Being invited

You will receive an email with the invitation.

You will see the invitee project with yours.

</br>
