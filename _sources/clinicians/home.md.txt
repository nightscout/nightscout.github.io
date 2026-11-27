# Nightscout for clinicians

</br>

```{tip}
Unless specified, links within the text are for advanced explanation of the underlying mechanisms but don't necessarily add value for clinicians use of Nightscout.
```

## What is Nightscout?

Nightscout is an open-source cloud application used to visualize, store and share in real-time: 

- data from continuous glucose monitoring sensors
- manually or automatically logged treatments
- basal rates from pumps (optional)

</br>

## How can I access patient data?

Your patient should share a unique web URL with you, it will look like `https://name.domain.ext`.

Since the URL is open for viewing to anybody having internet access to it, patients or caregivers can decide to make the access [secure](/nightscout/security.md#how-to-turn-off-unauthorized-access) and will share a [tokened](/nightscout/security.md#create-authentication-tokens-for-users) read-only access URL looking like `https://name.domain.ext?token=clinic-48aed625abb0ec86`.  
You need to use the full URL provided to access your patient Nightscout site.

Any device connected to the internet can be used to visualize patient data.

```{admonition} Cannot access patient URL
:class: tip
Should you experience issues to access the Nightscout site, check with your IT team if the domain used by your patient is not blocked by a local internet safety rule. Many patients or caregivers who build their own Nightscout site rely on platforms as a service or free DNS providers that can get classified as unsafe by cybersecurity systems.</br>
Ask your IT and cybersecurity teams to perform all necessary verifications to allow access to your patient site: Nightscout itself is safe for infrastructures, it doesn't contain any sort of cyberthread or malware.
```

Since Nightscout can be hosted in a large variety of [platforms](/nightscout/new_user.md#building-nightscout-diy-in-a-cloud-platform), you can expect the site domain to be (but not only) in the following list:

`heroku.com`, `azurewebsites.net`, `railway.app`, `fly.dev`, `onrender.com`, `t1pal.com`, `ns10be.de`, `nightscout.pro`, `mooo.com`, `chickenkiller.com`, `crabdance.com`, `strangled.net`, `code.run`, `nightscout4u.com` ...

```{admonition} Read only access
Writing data into Nightscout is protected with a password called API_SECRET that should not be shared with you by the patient.
```

 </br>

## What should I see when I open a Nightscout site?

What will display should be similar to this:

![Nightscout](/images/nightscout_screenshot_600.png)

If you see this, it means your patient forgot to send you the link with a read-only token:

<img src="/nightscout/img/Admin02.png" width="600px" />

</br>

## Next steps:

Follow the links below.

- [Setup the main view](setup) to add or view all available information.
- [Generate reports](reports).
