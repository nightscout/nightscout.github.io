# Troubleshoot Fly.io

</br>

If you've got IT knowledge you can install the [`flyctl`](https://fly.io/docs/hands-on/install-flyctl/) utility on your computer.

If it's too complex for you the web terminal is an easy alternative.

## Use a web terminal

```{warning}
The web terminal feature was removed from Fly.io.
Documentation will be updated to use a computer and flyctl.
```

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

If you migrated Nightscout from Heroku using Fly.io migration utility you need to fix your deployment to update it.

Open a [web terminal](#use-a-web-terminal).

a) Type (or copy and paste) the following command in the terminal:</br>

`curl https://nightscout.github.io/_static/flyboot.sh | bash`</br>

<img src="/vendors/fly.io/img/FlyIO01.png" width="600px" />

</br>

b) Navigate to the Nightscout code directory copied locally by typing:

`cd cgm-remote-monitor`

<img src="/vendors/fly.io/img/FlyIO02.png" width="600px" />

</br>

c) Deploy your site with Fly.io.  
Type the following command:

`flyctl launch`

<img src="/vendors/fly.io/img/FlyIO13.png" width="600px" />

</br>

To the question `Would you like to copy its configuration to the new app?` answer `Y` (yes). 

To the question: `App Name (leave blank to use an auto-generated name):` answer with **the name of your current Nightscout app**.

<img src="/vendors/fly.io/img/FlyIO14.png" width="600px" />

</br>

The app should already exist, confirm you want to launch into it.

<img src="/vendors/fly.io/img/FlyIO16.png" width="600px" />

</br>

d) In the terminal type:

`flyctl deploy`

You app will deploy. It will take time (about 10 minutes).

<img src="/vendors/fly.io/img/FlyIO17.png" width="600px" />

</br>

Do not interrupt the process.

</br>

When deploy completes you should see your full Nightscout site name.

<img src="/vendors/fly.io/img/FlyIO18.png" width="600px" />

</br>

e) Last but not least: make sure to downscale your app with the following command:

`flyctl scale count 1`

<img src="/vendors/fly.io/img/FlyIO19.png" width="600px" />

Enter `y` to confirm.

<img src="/vendors/fly.io/img/FlyIO20.png" width="600px" />

</br>

f) Exit the terminal typing `exit` or pressing `Ctrl D` (`⌘ D` with a Mac).

Keep in mind you'll need some time to reopen it if you need to (as explained in step 2 above).  
Close the browser tab.

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

## Obtain a free shared IP

Apps migrated from Heroku will use a dedicated IP billed $1.90/month.

If you want to run your Nightscout site in Fly.io for free, you will need to release the IP and request a shared IP.

Follow the instructions below. The IP 137.66.11.78 and the site name `example-ns` are examples, yours will be different. Use your own IP and site name.

```
$ flyctl auth login  # This will open a browser and ask me to authenticate 

$ flyctl app list
NAME    OWNER           STATUS          PLATFORM        LATEST DEPLOY
example-ns   personal        deployed        machines        2023-05-26T07:24:51Z


$ flyctl ips list -a example-ns
VERSION IP                      TYPE    REGION  CREATED AT
v4      137.66.11.78            public  global  2022-09-13T14:17:58Z
v6      3b09:8280:1::3:723c     public  global  2022-09-13T14:18:00Z

$ flyctl ips release 137.66.11.78 -a example-ns
Released 137.66.11.78 from example-ns

$ flyctl ips allocate-v4 --shared -a example-ns
v4      <new-ip-assigned> shared  global
```

You do not need to remember your new IP, just continue using your site name as before: https://yoursitename.fly.dev

</br>
