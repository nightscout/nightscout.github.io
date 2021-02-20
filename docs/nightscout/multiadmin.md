# Support and Administration of multiple sites

</br>

Either by necessity or to support others, you might want to have access to multiple accounts without having to juggle between logins and passwords. Below are described some centralizing methods reducing the administrative burden.

</br>

## Remote support and security

Giving username and passwords to someone in order to obtain help to fix Nightscout issues raises serious security issues. Malicious code can be added to your Nightscout project by ill-intentioned people. Always make sure the version deployed is a fork of the official project. After receiving help a good practice is to change your account passwords (GitHub, Heroku, mongoDB Atlas, Clarity, CareLink, ...) and your API secret. 

!!!note
    Inviting Heroku [collaborators](./#heroku) is extremely efficient for remote support.

</br>

## Github

You need only one Github account since you can connect multiple Heroku apps and accounts to the same GitHub account.

Using this strategy you only need to update one GitHub account when a new Nightscout version is released and you will be able to deploy it in all your Heroku accounts and apps.

!!!note
    You must use the [standard update method](../../update/update/). Not redeploy.

</br>

#### Enable Automatic Deploys in Heroku

Automatic deploys will allow you to update automatically your Heroku apps when you update the GitHub repository: you will not need to login into Heroku and perform Manual Deploy, as soon as a new version will be merged into GitHub an automated deploy will trigger in all enabled Heroku apps.

- To enable automatic deploy, [log in Heroku](https://dashboard.heroku.com/apps/) and select your app, then `Deploy`. Verify GitHub and your `cgm-remote-monitor` app are connected.

<img src="../img/MultiNS06.png" style="zoom:80%;" >

</br>

- Verify the `master` branch is selected and click `Enable Automatic Deploys`.

<img src="../img/MultiNS04.png" style="zoom:80%;" >

</br>

- Your Heroku site will update automatically every time you update the GitHub repository.

<img src="../img/MultiNS05.png" style="zoom:80%;" >

</br>

## Heroku

For free dynos purposes (1000 dynos hours per month with a credit card information present in your Heroku account) you should setup only one Nightscout site per Heroku account. This requires you to log out and in every time you need to work on an app.

You can setup collaborators in Heroku to avoid having to switch accounts. First decide on which will be your main Heroku account. Then add the email address you used to register as collaborator to the other(s) one(s).

</br>

- Log into your other Heroku account and select your app.  

<img src="../img/MultiNS00.png" style="zoom:80%;" >

</br>

-  Select `Access`.

<img src="../img/MultiNS01.png" style="zoom:80%;" >

</br>

- Click `Add collaborator` and enter the email address you used to create your main Heroku account.

<img src="../img/MultiNS02.png" style="zoom:80%;" >

</br>

- You will now see it as a collaborator. Using the pen icon you can modify it or delete it.

<img src="../img/MultiNS03.png" style="zoom:80%;" >

</br>

- Log in your main Heroku account. You will see the apps you are collaborating to in the same list than your primary app. You can now perform most tasks directly in that one Heroku account (deploys, change variables, ...).

<img src="../img/MultiNS07.png" style="zoom:80%;" >

</br>

## Atlas

You can invite another user in your organization in order to manage several organizations from the same Atlas account.

[Log into](https://account.mongodb.com/account/login) your **secondary** Atlas account: that is the other account you want to administer from your first (main) Atlas account.

</br>

- Top menu, click `Access Manager` and select `Organization Access` from the drop down menu

<img src="../img/MultiNS08.png" style="zoom:80%;" >

</br>

- Click `Invite Users`

<img src="../img/MultiNS09.png" style="zoom:80%;" >

</br>

- Enter the email address you used to create your **main** Atlas account.

<img src="../img/MultiNS10.png" style="zoom:80%;" >

</br>

- Select `Organization Owner` then click `Invite to Organization`.
- Make sure you enable `Organization Owner` for the invited user.

<img src="../img/MultiNS11.png" style="zoom:80%;" >

</br>

- Log out of your **secondary** Atlas account and log in your **main** Atlas account.

- Top left, from the drop down menu click the caret and select `View all Organizations`

<img src="../img/MultiNS12.png" style="zoom:80%;" >

</br>

- In the left menu, click `Invitations` then click `ACCEPT` the invitation you performed from your **secondary** Atlas account.

<img src="../img/MultiNS13.png" style="zoom:80%;" >

</br>

- Going back to all your organizations you can now see and administer both of them from this account. In the example below `Nightscout` is the **main** organization and `My Org 2020-09-20` is a **secondary** organization.

<img src="../img/MultiNS14.png" style="zoom:80%;" >

</br>

!!!note
    You can rename your organizations from the top left cog (Settings) then clicking the pen icon.

<img src="../img/MultiNS15.png" style="zoom:80%;" >



