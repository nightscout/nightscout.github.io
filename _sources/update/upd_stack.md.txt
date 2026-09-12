# Update the Heroku stack

</br>

AAPS users: mind the [compatibility matrix](../nightscout/close_loop.md#aaps)!

</br>

It is good practice to maintain your Heroku stack up to date. Either when you receive an email from Heroku or when you [update your Nightscout site](/update/update) (which is also a good habit).

</br>

- Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login)

</br>

<img src="/vendors/heroku/img/UpdateNS15.png" width="400px" >

</br>

- Select your app

<img src="/vendors/heroku/img/SetupNS00.png" width="800px" >

</br>

- Click `Settings`

<img src="/vendors/heroku/img/SetupNS01.png" width="800px" >

</br>

- If present select `Upgrade Stack`

<img src="/vendors/heroku/img/UpdateHK01.png" width="600px" >

</br>

- `Confirm` the upgrade

<img src="/vendors/heroku/img/UpdateHK02.png" width="600px" >

</br>

- Now you need to deploy to upgrade the stack

<img src="/vendors/heroku/img/UpdateHK03.png" width="600px" >

</br>

- Click on `Deploy`

<img src="/vendors/heroku/img/UpdateNS17.png" width="600px" >

</br>

- Scroll down to the bottom of the page, select the `master` branch and click `Deploy Branch`

```{hint}
If you can't select the `master` branch or `Deploy Branch` doesn't do anything [reconnect GitHub](heroku-nogit).
```

<img src="/vendors/heroku/img/UpdateNS23.png" width="800px" >

</br>

- Build will start and information will scroll in the log window. Do not leave the page, do not interfere and wait for completion. It might take more than 10 minutes. Interrupting the process will lead to a broken site and you'll need to restart deployment.

<img src="/vendors/heroku/img/UpdateNS24.png" width="800px" >

</br>

- Wait until the deploy process completes and click `View` (if nothing happens click `Manage App` then upper right `Open App`)

<img src="/vendors/heroku/img/UpdateNS25.png" width="600px" >

</br>

You have upgraded your Heroku stack.