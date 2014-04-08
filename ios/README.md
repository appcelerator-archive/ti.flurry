# Titanium Module for Flurry Analytics

This is the Flurry Analytics Module for Titanium.  It will provide you
with access to Flurry integration in your Titanium iPhone application.

## Application Initialization

To setup your app, you need to initialize the module with your 
Flurry application API key.  You should place this command in your 
app.js:

Titanium.Flurry.initialize("YOUR_API_KEY");

Make sure you replace YOUR_API_KEY with your *actual* key.

That's it for the basics.  You should now receive Flurry analytics data.

## Extra Stuff

### Forcing Transmission on Shutdown

By default, Flurry will only log upon subsequent runs of the application and 
caches logged data on the device.  You can force Flurry to attempt to send
data upon exit of the app by calling the following API:

Titanium.Flurry.reportOnClose(true);

### Custom Event Logging

To log events using custom events, you can call the following API:

Titanium.Flurry.logEvent(event_name,parameters);

Where `event_name` is a string name of your event and where `parameters` (optional)
is a Javascript dictionary of key value pairs (JSON serializable) that you want to 
associate with the event.

## Legal

This module is Copyright (c) 2010 by Appcelerator, Inc. All Rights Reserved.
Flurry is Copyright(c) 2010 by Flurry, Inc.  Usage of this module is subject to 
the Terms of Service agreement of Flurry, Inc. as well as your Terms of Service
agreement with Appcelerator, Inc.  






