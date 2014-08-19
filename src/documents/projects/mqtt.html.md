---
title: MQTT integration
layout: page
---

# MQTT

## What?
MQTT is a light-weight, binary protocol, that allows embedded devices
to communicate over an architecture identical to the popular
websockets technology.  A tcp socket maintains state by allowing
small, messages to be published to a logical topic.  Clients connect
to a central broker, which broadcasts the messages to clients
according to rules.  A typical rule is "give me all messages for
topic, eg `entries/sgvs`."  A last-will-and-testament feature allows
clients to be notified when other clients end their connection status.

## Why
The small overhead increases battery life and provides better logical
management of data.  Since the communication channel is bidirectional,
it becomes trivial to add topics and features without affecting other
subsystems.  It also becomes trivial to request agents to "fill in
missing gaps" or perform special tasks "on demand."


## Where?
Both `cgm-remote-monitor` and the `android-uploader` need to match
which mqtt broker they will use.  See the relevant branches for more
details.
