# Downgrading your Nightscout version

<span style="font-size:smaller;">**APPLIES TO:**</span>	<img src="../../vendors/img/Heroku.png" style="zoom:80%;" />

------

</br>

There is usually no good reason to downgrade Nightscout unless being instructed to do so.

Roll back can be really useful in case of mistakes and when awaiting bug fixes in minor releases.

!!!note
    You can only roll back to a version that was previously deployed to your Heroku app.

</br>

## Roll back Heroku

</br>

Heroku keeps history of variables modifications and previous deploys so that you can return to a previous state easily in the cases of a configuration mistake or a bad deploy (like a bugged version). When rolling back to a previous deploy keep in mind all variables modified in the mean time will return to the value they had at that time.

Since the database is external to Heroku, it will not be impacted by a roll back.

</br>

- Log into [Heroku](https://id.heroku.com/login).
- Select your Nightscout app and go to  `Activity`

<img src="../img/Downgrade00.png" style="zoom:80%;" >

</br>

- You will see a list of events called `Activity Feed` and some indicated as possible roll-back points. Identify the last good situation and select `Roll back to here`

<img src="../img/Downgrade01.png" style="zoom:80%;" >

</br>

- Identify and eventually write down the values of the variables that were changed in the meantime (arrows in the picture below) before selecting `Rollback`.

<img src="../img/Downgrade02.png" style="zoom:80%;" >

</br>

Upon completion your Heroku will be returned to the state it was at the selected rollback point.

You can use it like this or upgrade to the latest released version later on.

</br>

- If you change your mind later you can rollback prior to your rollback and return to the starting point.

<img src="../img/Downgrade03.png" style="zoom:80%;" >

</br>

## Deploy an old release

</br>

**Experienced users only - not recommended**

Deploying an archived release of Nightscout if it's not present in your Heroku activity list is more complex and involves installing Git on your computer.

Before starting you need to have the project [nightscout/cgm-remote-monitor](https://github.com/nightscout/cgm-remote-monitor) forked in your GitHub repository, the same way you did step 4a to 4c [when you created your Nightscout](../../nightscout/new_user/#step-4-fork-and-deploy-cgm-remote-monitor).

Clone it locally (navigate to the folder where you'll want it saved locally before cloning). Replace YOUR-USERNAME by your GitHub user name.

`git clone https://github.com/YOUR-USERNAME/cgm-remote-monitor`

First identify the commit matching the release you want to use, look into the [released versions](https://github.com/nightscout/cgm-remote-monitor/releases).

<img src="../img/Downgrade04.png" style="zoom:80%;" >

</br>

Then create a branch out of this commit (replace BRANCH by the branch name you want and indicate the COMMIT matching the one you need, in the case above b627d31):

`git checkout -b BRANCH COMMIT`

Push this new branch to your repository

`git push --set-upstream origin BRANCH`

</br>

You can now deploy it in Heroku selecting it in the drop down menu.

<img src="../img/Downgrade05.png" style="zoom:80%;" >







