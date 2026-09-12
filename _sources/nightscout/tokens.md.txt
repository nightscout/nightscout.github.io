---
orphan: true
---

***Note: authentication tokens are also called access tokens***

```{admonition} Changing API_SECRET
If you change your [`API_SECRET`](api-secret) all your tokens will change. Make sure you update your devices and send the new token link to those you allowed to access your Nightscout
```

To access the Authentication options, click the settings panel (three horizontal bars in the top right) in your website and select Admin Tools. The Authentication options are at the top of the Admin page. (Note: you must be logged in with your `API SECRET` to access these tools.)

<img src="/nightscout/img/Admin04.png" width="300px" />

</br>

You will see several predefined roles:

<img src="/nightscout/img/Admin01.png" width="700px" />

</br>

### Roles

- **`admin`**: full access
- **`careportal`**: can view the site and make CarePortal/treatment entries
- **`readable`**: read-only access; no ability to make CarePortal/treatment entries. This user CAN see reports and profile information.
- **`denied`**: no access (this role only works if the `AUTH_DEFAULT_ROLES` setting is also `denied`. You can’t have a site that is readable to everyone and create a “denied” token for a specific user.)
- **`devicestatus-upload`**: used by devices

```{hint}
There is currently no way to limit a user so that he cannot view the Reports section if he has access to the site. Time/date-based roles are not currently possible.
```

</br>

### Create a Token

- Click the “Add New Subject” button.

<img src="/nightscout/img/Admin00.png" width="700px" />

</br>

- Fill in the name of the subject and the “role” you are giving this subject (from the list of roles shown above). Note you should only grant the `readable` role for users who do not need to save or edit data in Nightscout. For example, you might want to share the site to a school nurse, but not have him able edit the data.

<img src="/nightscout/img/Admin05.png" width="600px" />

- An `admin` token is necessary for AAPS to upload using the API V3.

<img src="/nightscout/img/Admin05b.png" width="300px" />

</br>

- Click save.
- The token will be shown. You can use it in two different ways:
  - Copy the token URL (right-click on it in the browser and select the option to copy the link address) and provide it to the user (e.g., paste it into an email). If the user enters the entire URL (with token), the token will be in effect. 
  - Copy the token string (in the example below `school-a595d5f0aeff64c0`) and use it for authentication at site opening, instead of the API secret (Nightscout minimum version 14.1.0 required).

<img src="/nightscout/img/Admin06.png" width="700px" />

</br>

You can also add the token to the site URL to authenticate using a token. Your site link with token will look like this:

`https://yoursitename.yourplatform.com/?token=school-a595d5f0aeff64c0`

Anybody with this link can use your Nightscout with the role defined for this token.

```{hint}
If the user copies only your core URL into a browser, and your site is readable by default, the token will be bypassed. (Possible strategies to ensure the user puts the role-based URL into a browser include using a [tinyurl](https://tinyur.com/app) or [bit.ly](https://bitly.com).)
```

- You can edit a subject by clicking the edit icon, making changes, and saving.
- You can delete a subject by clicking the red **`X`** icon to remove the subject from the list.

See [how to setup your downloaders (followers)](/nightscout/downloaders) with a secured site.

</br>