---
title: Basic Theory
layout: guide
pageOrder: 2
tags: ['guide','quickstart','post']
---

## Basic Concept of Operations

  1. Dexcom G4 Sensor / Transmitter sends wireless signal to Dexcom G4
     Receiver
  1. Dexcom G4 Receiver is connected via USB OTG (On The Go) cable to
     an Android Uploader Device
  1. Android Uploader Device sends data to MongoDB database somewhere
     in the Cloud
  1. Cloud Service hosts a Node.js server, which serves pages to
     endpoint devices
  1. Endpoint devices display glucose information and generate audible
     alerts

