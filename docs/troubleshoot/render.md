# Troubleshoot Render

</br>

## Restart service

If your site is not responding (doesn't open), you can try to restart it.  
Mind it might only have fallen asleep and would need an uptime robot to stay awake.

* Sign in [Render](https://dashboard.render.com/) with GitHub

<img src="/vendors/render/img/Render02.png" width="400px" ></br>

* Select your web service

<img src="/vendors/render/img/Render16.png" width="600px" >

* In the `Dashboard`, open the `Manual Deploy` drop down menu and select `Restart service`.

<img src="/vendors/render/img/RenderT01.png" width="600px" >

</br>

## Backup your site variables

Having a copy of your variables is very important since some of them are vital to your site like MONGODB_URI and your access to it like API_SECRET.

Unfortunately there is no automated way to export your variables in Render.

Copy the values in a spreadsheet or create a `render.env` file, manually, using the format:

`VARIABLE="value"`

</br>

## Restore your site variables

You can use this method to import Render variables from [Railway](/troubleshoot/railway.md#backup-your-site-variables) or [Heroku](/troubleshoot/heroku.md#method-2-export) if migrating (follow the platform name link to see how to export them).

* Log in [Render](https://dashboard.render.com/)

<img src="/vendors/render/img/Render02.png" width="400px" ></br>

* Select your web service

<img src="/vendors/render/img/Render16.png" width="600px" ></br>

* Go to `Environment`, click on `Add from .env`.

 <img src="/vendors/render/img/Render25.png" width="600px" ></br>

- Delete all contents, open your backup file (the .env you generated when doing backup) and copy/paste all in the editor area. Click `Add variables` bottom right.

<img src="/vendors/render/img/Render26.png" width="500px" ></br>

- Scroll down the list and trash all variables that don't have a value (they're not used)

<img src="/vendors/render/img/Render27.png" width="500px" ></br>

- Scroll to the bottom of the list and click `Save changes`. Wait until your site redeploys with the new variables.

<img src="/vendors/render/img/Render28.png" width="500px" ></br>