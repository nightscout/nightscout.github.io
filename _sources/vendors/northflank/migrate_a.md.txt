---
orphan: true
---

```{warning}
**If you already have a Northflank database, you cannot use this wizard.**
[Create a new Northflank Nightscout site](/vendors/northflank/new_user.md#step-3-deploy-nightscout-in-northflank) with only `MONGODB_URI` and `API_SECRET` then [manually copy your Heroku variables](/vendors/northflank/new_usermd/#copy-all-variables-from-heroku).
```

a) Go to your `Account` `Dashboard` - `Settings` and scroll down to `Import`.  
Select Heroku.

<img src="/vendors/northflank/img/NorthflankM01.png" width="600px" />

```{note}
If you don't see this option, send a mail to Northflank support to request access to the feature.
```

</br></br>

b) Click `Link Heroku`.

<img src="/vendors/northflank/img/NorthflankM02.png" width="600px" />

</br></br>

c) Login in Heroku.

<img src="/vendors/northflank/img/NorthflankM03.png" width="400px" />

</br></br>

d)  Click `Allow`.

<img src="/vendors/northflank/img/NorthflankM04.png" width="300px" />

</br></br>

e)  Select your Nightscout Heroku app then click `Continue`.

<img src="/vendors/northflank/img/NorthflankM05.png" width="600px" />

</br></br>

f)  Select your project (the one you created in **Step 1.g**) then click `Continue`.

<img src="/vendors/northflank/img/NorthflankM06.png" width="600px" />

</br></br>

g)  Verify the branch you want to migrate, usually it's `master` unless you know why you need another one.

<img src="/vendors/northflank/img/NorthflankM07.png" width="600px" />

</br></br>

h)  Select  `heroku/builder-classic:22`.

<img src="/vendors/northflank/img/NorthflankM08.png" width="600px" />

</br></br>

i)  Modify your compute plan to the smallest **`nf-compute-10`** and click `Continue`.

<img src="/vendors/northflank/img/NorthflankM09.png" width="600px" />

</br></br>

j)  Wait until import completes then return to your Dashboard (top left).

<img src="/vendors/northflank/img/NorthflankM10.png" width="600px" />

</br></br>
