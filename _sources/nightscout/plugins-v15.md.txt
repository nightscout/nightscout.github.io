---
orphan: true
---

# [Nightscout-connect](https://github.com/nightscout/nightscout-connect)

As the dependencies of the historical plugins (`bridge` and `mmconnect`) have been deprecated, a new plugin has being created to allow long term sustaining and increase the number of supported cloud providers.

This plugin is under test and is currently only available in the `dev` branch of Nightscout ([version 15.0](https://github.com/nightscout/cgm-remote-monitor/tree/dev)).

## Prerequisites

You need to use the development branch of Nightscout.

```{admonition} AAPS users
:class: warning
Do not upgrade Nightscout to V15 unless you use the `dev` version of AAPS.
```

Follow [these guidelines](/update/dev_branch) to update your Nightscout app to  `dev`.

</br>

In order to enable the `nightscout-connect` plugin you need to add `connect` in your ENABLE variable.

Edit your variables following [these instructions](/nightscout/setup_variables.md#nightscout-configuration), search the `ENABLE` variable, modify its contents to add the word `connect`, separated by a space, at the end of the line.

</br>

## `dexcomshare`

`dexcomshare` is the replacement of `bridge`.

In order to use it you need to add the following variables in your [Nightscout configuration](/nightscout/setup_variables.md#nightscout-configuration):

Remove the word `bridge` from the `ENABLE` variable list.

`CONNECT_SOURCE=dexcomshare`

`CONNECT_SHARE_SERVER=ous`			  Add this variable **only** if you're not in the US. **Else don't add it (us).**

`CONNECT_SHARE_ACCOUNT_NAME=`		The username on your master device (the one connected to the sensor)

`CONNECT_SHARE_PASSWORD=`				The password matching the username above.

</br>

## `minimedcarelink`

`minimedcarelink` is the replacement of `mmconnect`.

In order to use it you need to add the following variables in your [Nightscout configuration](/nightscout/setup_variables.md#nightscout-configuration):

Remove the word `mmconnnect` from the `ENABLE` variable list.

`CONNECT_SOURCE=minimedcarelink`

`CONNECT_CARELINK_REGION=us` or `eu`	Match the area with minimed.carelink.**eu** or .com (i.e. **us**)

`CONNECT_CARELINK_USERNAME=`				The username on your master device Minimed app

`CONNECT_CARELINK_PASSWORD=`				The password matching the username above.

If you are caregiver of more than one patient also add:

`CONNECT_CARELINK_PATIENT_USERNAME=`	The name of the patient whom data you'll want in Nightscout.

</br>
