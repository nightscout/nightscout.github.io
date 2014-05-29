---
title: Configure Data Backend
layout: guide
pageOrder: 5
tags: ['guide','quickstart','post']
---

### MongoLab
Sign up for a free account at http://www.mongolab.com and

record the information you provide:
Create a **`user`**, a **`database`** and a **`collection`**.
Save this information:

      account name: _______
      username: _______
      email: _______
      password: _______
      database user: _______ (e.g. sallyuser)
      database user password: _______ (e.g. sallypassword)
      Cloud Provider: _______ (e.g. amazon webservices)
      Location: ____________ (e.g. Amazon’s US East (Virginia) Region
      (us-east-1)
      Plan: Single-node (development), Sandbox
      New destination database name: _________ (e.g. nightscout)
      Add a collection: _______ (e.g. sally)


Once all has been configured, on the `Database summary page`,
**copy the link** under `To connect using a driver via the standard
URI`, as this will be used to configure both the Android App and the
Node.js server.  **Copy and paste this string.**  You will use it
several times below.
We will refer to it as your **`mongo connection uri`**.
It will look something like these examples:

```
  mongodb://<user>:<password>@aabbb.mongolab.com:11111/<database>`
  mongodb://sallyuser:sallypassword@aabb22.mongolab.com:11111/nightscout`
```

Make sure you have easy access to your `mongo connection uri` and
`collection` for the following steps.


The 500MB free tier should be enough to store 10 years of data.

