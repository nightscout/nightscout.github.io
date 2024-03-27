# Railway Database

</br>

```{admonition} Too complicated? Not what you're looking for?
:class: seealso
Consider a hosted Nightscout service! Check for easier solutions [here](/index.md#nightscout-as-a-service).
```

</br>

```{danger}
The free plan has been removed Jul 3rd for new users and Aug 1st for existing users.</br>
Documentation will be updated to reflect the changes when visible.
```

</br>

```{card}
## Railway Mongo Database
![Railway](/vendors/img/Railway.png) ![MongoDB](/vendors/img/MongoDB.png)
^^^
Railway offers a Mongo database.

**Pros**:  
* Simple to create  
* Less overhead than Atlas (more space)  
* Mongo database cost is $0.000231/GB/Minute

**Cons**:  
* You need to carefully monitor your database size and clean it up regularly to remain within the Hobby plan 5$/month limits
* Simple Mongo 4.4 database
```

</br>

## Create a Railway account

If you already have a Railway account, make sure you have a developper plan: go to **step g)**.

</br>

a) Open [Railway](https://railway.app) in a new browser tab and click `login`. Type your email and select `Email`.

<img src="/vendors/railway/img/Railway00.png" width="600px" />

<img src="/vendors/railway/img/Railway01a.png" width="300px" />

</br>

b) Leave the browser open on this screen

<img src="/vendors/railway/img/Railway01b.png" width="300px" />

</br>

c) Check your email (look also in the spam folder) and click on the `Authorize Railway App`.

<img src="/vendors/railway/img/Railway01c.png" width="300px" />

</br>

d) Type the code you had in **b)**.

<img src="/vendors/railway/img/Railway01d.png" width="300px" />

</br>

e) Close this tab and return to the one you left open in **b)**.

<img src="/vendors/railway/img/Railway01e.png" width="300px" />

</br>

f) Click on `Please agree to the new terms to keep on using Railway`.

<img src="/vendors/railway/img/Railway03.png" width="600px" />

</br>

d) Scroll down and click `I agree with Railway's Terms of Service`.

<img src="/vendors/railway/img/Railway04.png" width="400px" />

</br>

e) Scroll down and click `I will not deploy any of that`.

<img src="/vendors/railway/img/Railway05.png" width="400px" />

</br>

f) You should now see this. You've created your Railway account.

<img src="/vendors/railway/img/Railway06a2.png" width="600px" />

</br>

g) Upgrade your account to a Developer plan. Click on the `Unverified` and select `Remove Resource Limits`.

<img src="/vendors/railway/img/Railway06b2.png" width="300px" />

</br>

```{danger}
The free plan will be removed Jul 3rd for new users and Aug 1st for existing users.</br>
Documentation will be updated to reflect the changes when visible.
```

Enter your credit card information and select `Subscribe to a Hobby Plan`.

<img src="/vendors/railway/img/Railway06c.png" width="500px" />

Your card will be billed 1$ that will be refund immediately. Bank fees won't be refund.

</br>

## Create your database

a) Click `New Project` from your Dashboard screen (top right).

<img src="/vendors/railway/img/RailwayDB01.png" width="200px" />

</br>

b) Click  `Provision MongoDB`

<img src="/vendors/railway/img/RailwayDB02.png" width="400px" />

</br>

c) Select your new MongoDB project.

<img src="/vendors/railway/img/RailwayDB03.png" width="300px" />

</br>

d) Go to the `Connect` page.

<img src="/vendors/railway/img/RailwayDB04.png" width="400px" />

</br>

e) Scroll down to `Available Variables`, move the mouse to the end of the line showing the `MONGO_URL` and click the copy icon.

<img src="/vendors/railway/img/RailwayDB05.png" width="650px" />

</br>

```{admonition} This is an important information
:class: warning
Now that you have **copied** the resulting `MONGODB_URI` string, keep it in a **safe place**, you will need it later.
```

