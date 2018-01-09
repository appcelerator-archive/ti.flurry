# Titanium Module for Flurry Analytics

This is the Flurry Analytics Module for Titanium.  It will provide you
with access to Flurry integration in your Titanium iPhone/Android application.

## Supported versions

Currently Ti.Flurry is tested to work with Titanium SDK 7.0.0 and later.

## Application Initialization

To setup your app, you need to initialize the module with your 
Flurry application API key.  You should place this command in your 
app.js:

```js
var Flurry = require('ti.flurry');
Flurry.initialize('YOUR_API_KEY');
```

Make sure you replace YOUR_API_KEY with your *actual* key.

That's it for the basics.  You should now receive Flurry analytics data.

## Extra Stuff

### Forcing Transmission on Shutdown (iOS Only)

By default, Flurry will only log upon subsequent runs of the application and 
caches logged data on the device.  You can force Flurry to attempt to send
data upon exit of the app by calling the following API:

```js
Flurry.reportOnClose(true);
```

### Custom Event Logging

To log events using custom events, you can call the following API:

```js
Flurry.logEvent(event_name,parameters);
```

Where `event_name` is a string name of your event and where `parameters` (optional)
is a Javascript dictionary of key value pairs (JSON serializable) that you want to 
associate with the event.

### Enable Crash Reporting

Thanks to @wgriffiths for this!

If you have a look at the master branch you can use the initializeWithCrashReporting method to setup Flurry. You will then get crash reporting. If your using iOS you can only have one crash reporting system active so you will need to disable your google analytics crash reporting.

```js
Flurry.initializeWithCrashReporting('API_KEY');
```

## Contributors

* Pedro Enrique
* Jon Alter
* Ayo Adesugba
* Hans Knoechel

Interested in contributing? Read the [contributors/committer's](https://wiki.appcelerator.org/display/community/Home) guide.

## Legal

This module is Copyright (c) 2010-present by Axway Appcelerator. All Rights Reserved.
Flurry is Copyright(c) 2010 by Flurry, Inc.  Usage of this module is subject to 
the Terms of Service agreement of Flurry, Inc. as well as your Terms of Service
agreement with Appcelerator, Inc.  
