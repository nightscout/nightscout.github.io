---
orphan: true
---

## Step 4: Create your Nightscout service

- From the [dashboard](https://dashboard.render.com/), create a new Web Service.

 <img src="/vendors/render/img/RenderD01.png" width="300px" ></br>

* Select `Deploy an existing image from a registry` then `Next`.

<img src="/vendors/render/img/RenderD02.png" width="400px" ></br>

* In the field `Image URL` type:

```
nightscout/cgm-remote-monitor:latest
```

Then `Next`.

<img src="/vendors/render/img/RenderD03.png" width="600px" ></br>

* In`Name` put the name of your Nightscout site (Render will add an extension if it's not unique).

<img src="/vendors/render/img/RenderD04.png" width="600px" ></br>

* Select the `Region` closer to where you live.

<img src="/vendors/render/img/RenderD05.png" width="600px" ></br>

* Select the `Free` instance type, knowing it will fall asleep (we'll fix that later on).

<img src="/vendors/render/img/RenderD06.png" width="600px" ></br>

* Clicking the button `+ Add Environment Variable` add the following two variables, and in the box on the right the matching value:

```
HOSTNAME	0.0.0.0
PORT		1337
```

<img src="/vendors/render/img/RenderD07.png" width="600px" ></br>

**You now need to setup core variables for your site:**

- Clicking the button `+ Add Environment Variable` add the following three variables:

- `MONGODB_URI` paste your database connection string from Step 0 above

- `API_SECRET` will be your Nightscout site password, it needs to be at least 12 characters long and you should **NOT use spaces** if you use @ or ! symbols remember you will probably need to express them using [Percent encoding](https://en.wikipedia.org/wiki/Percent-encoding#Percent-encoding_reserved_characters) in your uploader and downloader apps. If you're not sure on how to do this, it is recommended to use only letters (uppercase + lowercase) and digits.

```{warning}
The API_SECRET is the **main password allowing full access to your Nightscout site**. Make sure it's reasonably secure (mix uppercase and lowercase letters, plus digits) and **do no not share it publicly**. If you think you exposed it by mistake, it is recommended that you **change it**.
```

- Define your `DISPLAY_UNITS`   

Acceptable choices for the units used in Nightscout are `mg/dl` or `mmol/L` (or just `mmol`).

- Once all three variables have been set, `Create web Service`

<img src="/vendors/render/img/RenderD08.png" width="600px" ></br>

- Your Nightscout site will be deployed. Wait until the operation completes after some minutes.


<img src="/vendors/render/img/Render13.png" width="300px" >

<img src="/vendors/render/img/Render14.png" width="300px" ></br>

Congratulations. You created your new Nightscout site with Render.

</br>
