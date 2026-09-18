# Heroku MFA

Multiple factor authentication (MFA) also called 2 factors authentication (2FA) is a safety feature preventing malicious access to an account. Once authenticated with your login and password you will be required to confirm your identity with another method, a second factor authentication.

```{admonition} Losing access
:class: warning
It is recommended to setup at least two MFAs, **one being a copy of the recovery codes**. Salesforce take security very seriously and recovering your account after losing access might range from very complex to impossible. For increased safety, setup more than one authentication method on more than one device.
```

</br>

To setup MFA and secure your account select `Continue`.  
If you don't want to secure your account, select `Later`.

If you want to enter your account without setting MFA just select `Later`.

<img src="/vendors/heroku/img/MFA01.png" width="400px" />

</br>

You will also find the possibility to perform this operation from your Heroku account settings.

<img src="/vendors/heroku/img/MFA00.png" width="500px" />

<img src="/vendors/heroku/img/MFA00a.png" width="500px" />

</br>

You will be proposed various authentication options, see the explanation below.

You should select at least one (Salesforce Authenticator is recommended) but might use more than one (registering a build in authenticator like a fingerprint reader is also a good idea) and you should print your Recovery Codes and keep them together with your Nightscout information.

<img src="/vendors/heroku/img/MFA02.png" width="500px" />

</br>

## Salesforce Authenticator

Salesforce Authenticator relies on an additional app you will need to install on your phone. It is available in the [Google Play Store](https://play.google.com/store/apps/details?id=com.salesforce.authenticator) and the [Apple Store](https://apps.apple.com/us/app/salesforce-authenticator/id782057975).

```{admonition} Losing or removing the Authenticator app
It is recommended to setup at least two MFAs, **one being a copy of the recovery codes**. If your only authentication method is this app you will lose access if you remove it or lose/change phone! 
```

If you select this option (use the `Add` button) you will need to install the app to get the passcode called Two-Word Phrase

Install the app and `Add an Account`.

<img src="/vendors/heroku/img/MFA03b.png" width="300px" />

</br>

The app will give you a Two-Word Phrase (`perfect guide` in the example below)

<img src="/vendors/heroku/img/MFA03c.png" width="300px" />

</br>

Copy it or type it into the authentication connection window in Salesforce Heroku and select `Connect`.

<img src="/vendors/heroku/img/MFA03.png" width="400px" />

</br>

In the app, confirm with `Connect` then `Got It`.

<img src="/vendors/heroku/img/MFA03d.png" width="400px" />

<img src="/vendors/heroku/img/MFA03e.png" width="300px" />

</br>

You will now see Heroku in the app, with a single use code (that you usually won't need).

<img src="/vendors/heroku/img/MFA03f.png" width="400px" />

</br>

Now, every time you will log into Heroku, you will have to confirm using your phone. Just accept the access.

</br>

Once the account added into Salesforce Authenticator you will be able to add another option that is Built-In Authenticator (like a fingerprint reader).

<img src="/vendors/heroku/img/MFA03g.png" width="500px" />

</br>

## Built-In Authenticator

You need Salesforce Authenticator setup in order to use this method (see above).

Adding a built in authenticator will allow you to use your device biometric devices like a fingerprint reader.

Select `Register` to add this identification method as a second factor. You will not be required to use the Salesforce Authenticator after registration. You can now remove it if you wish (not recommended).

<img src="/vendors/heroku/img/MFA08.png" width="400px" />

Note that you won't be able to use your fingerprint if created on a computer to unlock your account when using your phone and vice versa. You should add one fingerprint per device type.

</br>

## One-Time Password Generator

You can use other apps to create your second factor, like Google Authenticator or Microsoft Authenticator apps. You will find both these apps in the Google Play Store and the Apple Store.

First install one of these apps on your mobile device, then select `Add`.

Scan the QR code with the app and `Connect`.

<img src="/vendors/heroku/img/MFA04.png" width="400px" />

</br>

Your Heroku will now be connected to this second factor authentication method and you will have to approve access, when logging into Heroku, with the app you selected.

<img src="/vendors/heroku/img/MFA04a.png" width="300px" />

</br>

## Security Key

Security key authentication requires you to use a hardware key. You probably won't be reading this if you own one.

<img src="/vendors/heroku/img/MFA05.png" width="400px" />

</br>

## Recovery Codes

You should enable and keep a copy of your recovery codes. This might eventually be the only way to recover your account access if something goes wrong with the other authentication method. Print a copy and keep it with your Nightscout information together with your diabetes documentation.

<img src="/vendors/heroku/img/MFA06.png" width="400px" />

<img src="/vendors/heroku/img/MFA07.png" width="400px" />
