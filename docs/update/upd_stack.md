# Updating the Heroku stack

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />

------

</br>

It is good practice to maintain your Heroku stack up to date. Either when you receive an email from Heroku or when you [update your Nightscout site](../update) (which is also a good habit).

</br>

- Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login)

!!! note
    Salesforce requires two-factor-authentication for more Heroku security, this is mandatory starting Feb 2022. For an overview of possible methods see [here](../../vendors/heroku).

</br>

<img src="../../update/img/UpdateNS15.png" style="zoom:70%;" >

</br>

- Select your app

<img src="../../nightscout/img/SetupNS00.png" style="zoom:80%;" >

</br>

- Click `Settings`

<img src="../../nightscout/img/SetupNS01.png" style="zoom:80%;" >

</br>

- If present select `Upgrade Stack`

<img src="../../update/img/UpdateHK01.png" style="zoom:80%;" >

</br>

- `Confirm` the upgrade

<img src="../../update/img/UpdateHK02.png" style="zoom:80%;" >

</br>

- Now you need to deploy to upgrade the stack

<img src="../../update/img/UpdateHK03.png" style="zoom:80%;" >

</br>

- Click on `Deploy`

<img src="../../update/img/UpdateNS17.png" style="zoom:80%;" >

</br>

- Scroll down to the bottom of the page, select the `master` branch and click `Deploy Branch`

*Note: if you can't select the `master` branch or `Deploy Branch` doesn't do anything [update your Nightscout site](../update).*

<img src="../../update/img/UpdateNS23.png" style="zoom:80%;" >

</br>

- Build will start and information will scroll in the log window. Do not leave the page, do not interfere and wait for completion. It might take more than 10 minutes. Interrupting the process will lead to a broken site and you'll need to restart deployment.

<img src="../../update/img/UpdateNS24.png" style="zoom:80%;" >

</br>

- Wait until the deploy process completes and click `View` (if nothing happens click `Manage App` then upper right `Open App`)

<img src="../../update/img/UpdateNS25.png" style="zoom:80%;" >

</br>

You have upgraded your Heroku stack.