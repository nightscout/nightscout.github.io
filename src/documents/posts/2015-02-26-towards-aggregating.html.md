---
title: Towards Aggregating Nightscouten
author: Ben West
layout: post
tags: ['data','post']
---

# Nightscout

A typical Nightscout display might look a bit like this:

![Nightscout testimonial with screenshot][screenshot-nightscout]

What if you wanted a way to look at more than one Nightscout at the
same time?  That's where
[nightscout-aggregator][nightscout-aggregator] comes into play.
Originally designed to help create screenshots for a presentation, it
has become a useful starting point for a couple of interesting use
cases:

* Compare and contrast results from multiple glucose estimation
  instruments: (eg, compare your Dexdrip/DexBridge against Dexcom).

* Watch a glycemia across a population of users.

[screenshot-nightscout]: http://bewest.github.io/ns-ms-present/images/03-why/drop-like-a-rock.png
[nightscout-aggegator]: http://bewest.github.io/ns-ms-present/images/04-aggregate/halloween-05.png 


## Design

### Viewing additional Nightscouten

By default, the UI has a `settings` button with a form for users to
subscribe new Nightscout addressess to the monitoring service.

![By default settings button in upper left][settings-button]

Clicking the button should reveal a form for the user to subscribe a
Nightscout to your monitoring service.  Proposals for creating a
better work flow here to "release the data" properly are welcome.

![Enter a Nightscout address to monitor][subscribe-form]

![Use the sync button to enroll.][subscribe-form-filled]


## Usage

Originally conceieved as a tool to help with demos at presentations,
this has become a useful way to quickly get an idea of what is
happening with a population of Nightscout users, without really
revealing whose data belongs to whom.  In the short term, this tool
has been a useful way to build empathy in terms of understanding
therapy for type 1 diabetes.

![Screenshot][screenshot-overview]


## How it works

Each Nightscout is kept in a list in the webserver.  The webserver
itself enrolls in the Nightscout's websocket.  The websocket's address
is paired internally with a unique random color six hex-digit hash.
Currently no data is stored, the lens merely allows viewing all the
data passing through the server in an ephemeral fashion.  
No matter how many people visit your aggregator, the
server itself is multiplexing the connections, there is only one
connection to the monitored Nightscout URLs, no matter how many
clients connect to this server.  

The UI avoids showing any details other than the color hash, the time,
and the glucose values.

[settings-button]: http://i.imgur.com/G4E3OhF.png?1
[subscribe-form]: http://i.imgur.com/sinmnrp.png
[subscribe-form-filled]: http://i.imgur.com/KSJwzkB.png
[screenshot-overview]: http://bewest.github.io/ns-ms-present/images/04-aggregate/halloween-05.png


## Halloween
Here are some screenshots from Halloween, 2014.

<iframe class="imgur-album" width="100%" height="550" frameborder="0"
src="//imgur.com/a/avUf6/embed"></iframe>


## Future plans

While there is an explicit "opt-in" workflow, our initial work with
researchers indicates that this area needs some work in order to
appropriately release the data for publishable research use.  We will
accept designs and patches to help with these concerns.  What data
might be released by this tool?  The tool is designed to preserve the
anonymity of the people contributing source data.

This is the rough plan for which data to potentially archive for
public consumption:

*  Random 6 digit color-hash.  The unique random hash id is associated
   internally with a Nightscout address, but we intend on keeping this
   mapping secret.
* Timestamp
* Glucose

#### What might an example record look like:

This is what the archived, proposed records would look like, they only
contain a randomly assigned hash, the date and time, and the basic
information about glucose, trend, and noise.

We propose exporting slices of data like this for permanent
publication, donation to open science.  In this fictitious sample,
there are three individuals over 40 minutes.

The individuals have the following hashes associated, researchers can
isolate data, but because these identifiers are random, and
regenerated randomly, there is no way to associate the data here with
any identifiable information.

* `7eba1d`
* `3fd8a`
* `04c64a`

```csv
hash,datetime,glucose,trend,noise
7eba1d,2015-01-01T10:03:38,158,None,4
3fd8a,2015-01-01T10:03:35,128,None,4
04c64a,2015-01-01T10:02:29,178,None,4
7eba1d,2015-01-01T10:08:38,156,None,4
3fd8a,2015-01-01T10:08:35,126,None,3
04c64a,2015-01-01T10:07:29,180,None,3
7eba1d,2015-01-01T10:13:38,156,None,4
3fd8a,2015-01-01T10:13:35,126,None,3
04c64a,2015-01-01T10:12:29,182,None,3
7eba1d,2015-01-01T10:18:38,155,None,4
3fd8a,2015-01-01T10:18:35,125,None,2
04c64a,2015-01-01T10:17:28,182,None,2
7eba1d,2015-01-01T10:23:38,156,None,4
3fd8a,2015-01-01T10:23:35,126,None,2
04c64a,2015-01-01T10:22:28,190,None,2
7eba1d,2015-01-01T10:28:38,155,None,4
3fd8a,2015-01-01T10:28:35,125,None,2
04c64a,2015-01-01T10:27:28,194,None,2
7eba1d,2015-01-01T10:33:38,154,None,4
3fd8a,2015-01-01T10:33:35,124,None,1
04c64a,2015-01-01T10:32:29,199,None,1
```

If this proves insufficient, we can also time-shift slices, eg
randomly time shift the data to ten or twenty years ago, to provide
additional noise to the data which would not affect analysis.

See http://nightscout.github.io/posts/2015-02-22-donate-data-with-ga/
for more details on the impetus behind this effort.



