## Turn Off Unauthorized Access

!!!warning "Privacy warning"
    In a default setup, **anyone** with your Nightscout URL can view your site.

!!!note
    Make sure [the app you use to see your data](../downloaders) can handle a secured Nightscout site.

To Take Advantage of Roles, Turn Off Unauthorized Access to Your Site:

If you want to ensure that ONLY someone with permission to view your site (e.g., a token) is able to view the data, you should configure the [`AUTH_DEFAULT_ROLES`](../setup_variables/#auth_default_roles) variable in Heroku. Set the value as: `denied`.

[Edit](../setup_variables/#editing-config-vars-in-heroku) (or add) your variable in Heroku and set it to `denied`.

<img src="../img/Admin03.png" style="zoom:100%;" />

</br>

This creates a scenario in which a token will be required for all access (even only view).

<img src="../img/Admin02.png" style="zoom:80%;" />

</br>

## Create Authentication Tokens for Users

To access the Authentication options, click the settings panel (three horizontal bars in the top right) in your website and select Admin Tools. The Authentication options are at the top of the Admin page. (Note: you must be logged in with your `API SECRET` to access these tools.)

<img src="../img/Admin04.png" style="zoom:80%;" />

</br>

You will see several predefined roles:

<img src="../img/Admin01.png" style="zoom:80%;" />

</br>

#### Roles

- **`admin`**: full access
- **`careportal`**: can view the site and make CarePortal/treatment entries
- **`readable`**: read-only access; no ability to make CarePortal/treatment entries. This user CAN see reports and profile information.
- **`denied`**: no access (this role only works if the `AUTH_DEFAULT_ROLES` setting is also `denied`. You can’t have a site that is readable to everyone and create a “denied” token for a specific user.)
- **`devicestatus-upload`**: used by devices

!!! note "Note"
    There is currently no way to limit a user so that he cannot view the Reports section if he has access to the site. Time/date-based roles are not currently possible.

</br>

### Create a Token

- Click the “Add New Subject” button.

<img src="../img/Admin00.png" style="zoom:80%;" />

</br>

- Fill in the name of the subject and the “role” you are giving this subject (from the list of roles shown above).

<img src="../img/Admin05.png" style="zoom:80%;" />

</br>

- Click save.
- The token will be shown. You can use it in two different ways:
  - Copy the token URL (right-click on it in the browser and select the option to copy the link address) and provide it to the user (e.g., paste it into an email). If the user enters the entire URL (with token), the token will be in effect. 
  - Copy the token string (in the example below `school-a595d5f0aeff64c0`) and use it for authentication at site opening, instead of the API secret (Nightscout minimum version 14.1.0 required).

<img src="../img/Admin06.png" style="zoom:80%;" />

</br>

Your site link with token will look like this:

`https://yoursitename.herokuapp.com/?token=school-a595d5f0aeff64c0`

Anybody with this link can use your Nightscout with the role defined for this token.

!!!note "Note"
    If the user copies only your core URL into a browser, and your site is readable by default, the token will be bypassed. (Possible strategies to ensure the user puts the role-based URL into a browser include using a tinyurl or bit.ly.)

- You can edit a subject by clicking the edit icon, making changes, and saving.
- You can delete a subject by clicking the “x” icon to remove the subject from the list.

</br>