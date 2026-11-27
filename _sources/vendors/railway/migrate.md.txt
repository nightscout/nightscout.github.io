---
orphan: true
---

- Log in Heroku [https://id.heroku.com/login](https://id.heroku.com/login)

<img src="/vendors/heroku/img/UpdateNS15.png" width="400px" ></br>

- Leave the Heroku page opened and return to the Railway page.
- If you cannot log into Heroku, select another deployment option (just above) and reuse your existing Atlas database connection string.

</br>

a) Click on `Create a New project`.

<img src="/vendors/railway/img/Railway06.png" width="500px" /></br>

If you don't see that, top right, click `+ New Project`.

<img src="/vendors/railway/img/RailwayDB01.png" width="200px" /></br>

</br>

b) Select `Deploy from GitHub repo`.

<img src="/vendors/railway/img/RailwayM19.png" width="400px" /></br>

</br>

Select `Configure GitHub App`.

<img src="/vendors/railway/img/RailwayM02.png" width="400px" /></br>

</br>

c) Choose `Only select repositories`, in the `Select repositories` drop-down select your own fork of `cgm-remote-monitor`.  
Then, at the bottom, click `Install & Authorize`.

<img src="/vendors/railway/img/Railway08.png" width="500px" /></br>

</br>

You should be back to `Deploy from GitHub repo`, select it.

<img src="/vendors/railway/img/RailwayM19.png" width="400px" /></br>

</br>

d) Now you can select your own GitHub repository.

<img src="/vendors/railway/img/RailwayM03.png" width="400px" /></br>

</br>

e) Select `Add variables`.

<img src="/vendors/railway/img/RailwayM20.png" width="400px" /></br>

</br>

f) The Nightscout project will deploy in the background, just ignore it: now we need to import all variables from Heroku.  
When you see this, press simultaneously the keys `Ctrl` and `K`.  
**If you use a Mac `⌘` and `K`.**

<img src="/vendors/railway/img/RailwayM21.png" width="800px" /></br>

</br>

g) Select `Import variables from Heroku`.

<img src="/vendors/railway/img/RailwayM22.png" width="400px" /></br>

</br>

h) Click `Connect Heroku account`.

<img src="/vendors/railway/img/RailwayM23.png" width="400px" /></br>

</br>

Click `Allow`.

<img src="/vendors/railway/img/RailwayM24.png" width="400px" /></br>

</br>

i) Redo `Ctrl K` (or `⌘ K` and select `Import variables from Heroku`. Now you can select your Nightscout app.

<img src="/vendors/railway/img/RailwayM25.png" width="400px" /></br>

</br>

j) Wait until import completes.  
Your site will redeploy, wait until redeploy completes.

</br>
