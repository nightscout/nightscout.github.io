# Dexcom `bridge` troubleshooting

## Username and password

Your Dexcom account is the one that identifies you to access all services: Store, Clarity and mobile apps. In order to make sure you're accessing the right account, log into Clarity to check your credentials are valid.

For US account: [https://clarity.dexcom.com/](https://clarity.dexcom.com/)   
For all others: [https://clarity.dexcom.eu/](https://clarity.dexcom.eu/)

<img src="../img/DexShare01.png" style="zoom:60%;" >

In the case you have linked accounts, check you are using the right credentials for the profile you want to `bridge` to Nightscout.

<img src="../img/DexShare05.png" style="zoom:60%;" >

Also verify you actually have current data in this profile/account.

!!! note "Password"
    Some people have had problems with their bridge connecting when their Dexcom passwords are entirely numeric. If you have connection issues in that case, try changing your password to something with a mix of numbers and letters.

!!!Warning "Changing password"
    Before you decide to change your password, make sure to put your Nightscout site in [maintenance mode](../cleanup/#maintenance-mode), [update `BRIDGE` variables](../../uploader/setup/#dexcom) accordingly and make sure you have recent data in Clarity before exiting maintenance mode.

</br>

## Username is an email

Newly created Dexcom users do not have an username but only an email address.

<img src="../img/DexShare01b.png" style="zoom:60%;" >

This can be an issue if you want to use `bridge` to have your data directly in Nightscout. Make sure you're using the [latest release](../../update/update/) if you experience problems.

Common symptoms are:

- no data in Nightscout even with correct credentials
- account locking once or more per day even with correct credentials

</br>

## Obtaining a username

Dependent accounts can have a username.

<img src="../img/DexShare02.png" style="zoom:60%;" >

You can create your Dexcom account and add dependent accounts for children, wife, ...

Some dependent accounts with an email address can generate problems when trying to connect directly to Nightscout.

</br>

## Account lock

You can check if your account is locked by trying to log into Clarity.

<img src="../img/DexShare00.png" style="zoom:60%;" >

If you see this message, you must disable (enter an empty username for example) all devices and apps trying to get data from or push data into Dexcom share.

In order to recover from an account lock, it is usually enough to wait for 10-15 minutes after you disabled all devices and apps trying to access the account with a wrong password.

Do not forget any app or device!

- Nightscout
- Smartwatches apps
- Sugarmate, Happy Bob, xDrip+,...
- ...

You can identify an account lock browsing your Heroku logs as described [here](../troublehoot/#authentication-errors).