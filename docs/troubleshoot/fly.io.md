# Troubleshoot Fly.io

</br>

If you've got IT knowledge you can install the [`flyctl`](https://fly.io/docs/hands-on/install-flyctl/) utility on your computer.

If it's too complex for you the web terminal is an easy alternative.

## Use a web terminal

a) In a new browser tab, [sign-in](https://fly.io/app/sign-in) with your fly.io account,then open a web [terminal](https://fly.io/terminal).
If you just closed the terminal, you might need to wait some time (20 minutes) before you can open a new session (the message below appears).

<img src="/vendors/fly.io/img/FlyIO07.png" width="600px" />

</br>

b) Click on the image with code (`Launch Web CLI`).

<img src="/vendors/fly.io/img/FlyIO06.png" width="500px" />

</br>

c) Wait until the web terminal is ready.

<img src="/vendors/fly.io/img/FlyIO08.png" width="600px" />

</br>

d) A command prompt will open.

<img src="/vendors/fly.io/img/FlyIO09.png" width="600px" />

</br>

## Cleanup

After several failed attempts to deploy or migrate, you might need to delete some apps.

Log into Fly.io [https://fly.io/app/sign-in](https://fly.io/app/sign-in) (GitHub recommended)

<img src="/vendors/fly.io/img/FlyIO00.png" width="400px" />

In normal running condition you will see only two apps on your dashboard:  
The first one is your Nightscout site and the second one the builder (necessary).  
If you used the migration wizard you will see another builder (three apps).

<img src="/vendors/fly.io/img/FlyT01.png" width="600px" />

</br>

Clicking on your site you will see if it's healthy and running. This is where you go to open your site.

<img src="/vendors/fly.io/img/FlyT01.png" width="600px" />

</br>

### Delete an app

Select an app from the dashboard. Then click `Settings`.  
Click `Delete app`.

<img src="/vendors/fly.io/img/FlyT03.png" width="600px" />

Confirm copying the app name below, then click `Yes, delete it`.

<img src="/vendors/fly.io/img/FlyT04.png" width="600px" />

You have deleted your app.

If you delete the builder (like in the picture above) you won't be able to deploy anymore.

</br>

### Delete your local repository

#### If you deployed with your own computer (old method).

You can delete the `cgm-remote-monitor` folder on your computer and fork it again. 

If you run PowerShell in Windows, exit the folder before deleting it, in task manager end the `flyctl.exe` task. 

#### If you deployed from the web terminal.

You don't have a local repository.

</br>

## Make your migrated app maintainable

```{deprecated} July 2023
Use the web terminal to modify your Fly.io deployment.
```

</br>

## Downscale your app

March 31st 2023, apps deploy in V2 and V1 apps are automatically migrated too.  
This causes some issues as V2 automatically deploys in a more than one machine, your Nightscout site might not work correctly.

Type the following command in a [web terminal](#use-a-web-terminal) (replace ***`app_name`*** with your own app name):

`flyctl scale --app `***`app_name`***` count 1`

<img src="/vendors/fly.io/img/FlyT08.png" width="600px" />

Your app should now only be running on one machine. Check [here](https://fly.io/dashboard/personal/machines).

***Note:*** *the builder app is normal, it is stopped: don't worry about it.*

<img src="/vendors/fly.io/img/FlyT09.png" width="600px" />

</br>
