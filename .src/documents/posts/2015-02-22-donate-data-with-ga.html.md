---
title: Release of data
author: Ben West
layout: post
tags: ['data','post']
---

# Nightscout and data

Now that Nightscout is liberating data, what can we do with that data?
Can researchers and scientists use the data to improve therapies?  How
can journals publish data without a proper release?

Since Nightscout is largely a volunteer effort, and accomiplishing any
of these goals would consume time and resources, we decided to test
whether or not the time and energy spent might be worth the
investment.  Therefore, we implemented a dialogue in android uploader
to simply to determine if there was any willingness at all to share
or re-use data from therapy, given an opportunity.

## Hypothesis and methods

Nightscout open source software can obtain permission to release data
for research use.  This is the [question][question-string] we asked people:

> Will you anonymously donate your CGM data for research in order to
> speed up diabetes innovation?

It's important to note the application's behavior does not depend on
the answer to this question.  The data is only sent to the user's
configured endpoints.  The answer, a "yes" or "no" is reported to
our google analytics site, so we can see how people responded to the
question.

## Findings

Roughly 70% clicked yes, indicating some willingness to release the
data.
![pie-chart][pie-chart]

Here's a simple table from google analytics.
![data-donate-table][data-donate-table]

Here's how survey responses looked over the last month:
![data-donate-chart][data-donate-chart]


## Feedback

While running this experiment, we received a lot of feedback from
Nightscout users and community:

* The use intended use of data is ambiguous.  Several groups of people
  indicated they wanted to know more about how their data would be
  used.

We'll be working on setting up additional resources to help identify
exactly how data donation might work.  If you have ideas on how you
can help, or the kinds of things you'd want to know,
[give us feedback][designing-android-dialogue], let us know on
Facebook, or [send us a tweet][nightscout-twitter].


[question-string]: https://github.com/nightscout/android-uploader/blob/6e4ceddc672cd27eaa61fccd597d541dee829c11/app/src/main/res/values/strings.xml#L36
[designing-android-dialogue]: https://github.com/nightscout/android-uploader/issues/129
[nightscout-twitter]: https://twitter.com/nightscoutproj



[pie-chart]: http://i.imgur.com/xkzjxI1.png
[data-donate-table]: http://i.imgur.com/IATgNfT.png
[data-donate-chart]: http://i.imgur.com/oXM9G4E.png

