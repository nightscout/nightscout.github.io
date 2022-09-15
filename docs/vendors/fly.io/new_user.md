
# Fly.io Nightscout

<span style="font-size:smaller;">**APPLIES TO:**</span> <img src="../../../vendors/img/flyio-logo.png" style="zoom:60%;" />+<img src="../../../vendors/img/Atlas.png" style="zoom:80%;" />

!!!info "Cost"  
Nightscout is expected to run without charges in the [free tier](https://fly.io/docs/about/pricing/#free-tier).  
Most operations involve CLI and are rather complex.  
Consider [Nightscout as a service](/#nightscout-as-a-service) as an option.

</br>

## Set up a new Nightscout

Fly.io is managed through a command line app.

!!!warning "**Not documented yet.**"

</br>

## Editing Secrets in Fly.io

</br>

!!!warning "Secrets"  
    You **cannot see the values of your secret variables as they are secret**.  
    You can only delete them and set them: you **cannot edit them**.  
    Please make sure you write them down somewhere!

</br>

**Once Nightscout deployed, you need to install [flyctl](https://fly.io/docs/hands-on/install-flyctl/) to access your variables in order to change or customize your site.**
Variables are described [here](../../../nightscout/setup_variables/#nightscout-config-vars).

[Sign in with GitHub](https://fly.io/docs/hands-on/sign-in/) in your CLI interface (Powershell/Terminal).  
A new browser will open. Select the entry with your email address.  
If required, authenticate through GitHub.

<img src="../img/FlyM16.png" style="zoom:80%;" />

</br>

Fly.io variables are named `Secrets` and you cannot visualize them.  
Look [here](https://fly.io/docs/getting-started/working-with-fly-apps/#working-with-secrets) for more details.

</br>

If you want to create a new secret or modify an existing one you need to use the `flyctl secrets set` command.  
For example if you want to set your Nightscout site API Secret to **Th1515MyP455w0rd**, type:

```
flyctl secrets set API_SECRET="Th1515MyP455w0rd" -a yourappname
```

*Note: replace `yourappname` in the example with the real name of your Fly.io Nightscout app.*

If your `API_SECRET` secret was already set to `Th1515MyP455w0rd` you will see the following message:  
`Error No change detected to secrets. Skipping release.`

Now put back your original API Secret password with the same command.

When changing a secret, the app will automatically redeploy. You will see this sequence (it will take a few minutes):

```
Release v1 created
==> Monitoring deployment

 1 desired, 1 placed, 1 healthy, 0 unhealthy [health checks: 1 total, 1 passing]
--> v1 deployed successfully
```

</br>

