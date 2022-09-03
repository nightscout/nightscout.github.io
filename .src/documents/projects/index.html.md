---
title: Nightscout projects and experiments
layout: page
---

# Projects

This is the landing page for ongoing development.
There are many people involved in Nightscout, the efforts are roughly
categorized below:

## reliability, stability, predictable performance

Safety comes first.  We need to be able to demonstrate that the data
is being transferred with full fidelity and integrity.  Bug squashing
and safety comes first, and these projects will be prioritized:

### mqtt integration

See [mqtt](./mqtt) for more information.
This will be used to provide better real-time controls, including the
ability to convey the current connectivity status of the uploader
device as well as increased battery life (to two days).  It will also
lower the cost associated with data rates.


## notifications, alarms

Notifications and alarms are designed to modify behavior of human
beings.  Due to alarm fatigue, a wide spectrum of experience and
edicuation, we foresee a large number of proposals for alarm and
notification behavior.

Here are some of the notable efforts, see the accompanying
documentation for each project for how to test and contribute.

### Pushover
Uses [pushover](./pushover) service to generate notifications.

### clickatell
Uses SMS via clickatell service in order to create notifications that
show up on lock screen and notification areas.
See [clickatell](./clickatell) for more info.

### See also
`ITTT`

### Operational metadata
Including connectivity status, battery status, details about how the
rig is operating.

See cgm-pebble project for many updates for this.

