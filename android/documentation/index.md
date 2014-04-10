# Ti.Flurry Module

## Description
Module for using the Flurry event tracking service.

## Accessing the Flurry Module
To access this module from JavaScript, you would do the following:

	var Flurry = require("ti.flurry");

## Properties

### bool debugLogEnabled
Turns on additional logging. Defaults to false;

### bool eventLoggingEnabled
Turns on additional logging. Defaults to false.

### string userID
Use this to log the user's assigned ID or username in your system after identifying the user. 

### int age
Use this to log the user age after identifying the user. Valid inputs are 0 or greater. 

### string gender
Use this to log the user gender after identifying the user. Valid inputs are m for male and f for female. 

### bool reportLocation
Use this to allow Flurry to record location information in reports. Defaults to true.

### bool secureTransportEnabled
This option is off by default. When enabled, Flurry will send session data over SSL when the app is paused as well as it
normally does when the app is started. This has the potential to prolong the app pause process due to added network
latency from secure handshaking and encryption.

## Functions

### initialize(string apiKey)
Initializes your Flurry session. You must get your own apiKey from Flurry's website: https://dev.flurry.com/

### logEvent(string event[, dictionary properties])
Use logEvent to count the number of times certain events happen during a session of your application. This can be useful
for measuring how often users perform various actions, for example. Your application is currently limited to counting
occurrences for 300 different event ids (maximum length 255 characters). You can also optionally pass in a dictionary of
properties that will be recorded. Up to ten different keys can be specified in this dictionary, all of which must be
serializable.

### logTimedEvent(string event[, dictionary properties])
Use this version of logEvent to start timed event. You can also optionally pass in a dictionary of properties.

### endTimedEvent(string event[, dictionary properties])
Use endTimedEvent to end timed event before app exists, otherwise timed events automatically end when app exists. When
ending the timed event, a new optional event parameters dictionary object can be used to update event parameters. To
keep event parameters the same, do not pass in properties.

### logPageView()
Rather than using the logAllPageViews method, you can manually detect user interactions. For each user interaction you
want to manually log, you can use logPageView to log the page view.

## Usage
See example.

## Configuration of AndroidManifest.xml
Required Permission:
    android.permission.INTERNET
    Required to send analytics data back to the flurry servers
Optional Permission:
    android.permission.ACCESS_COARSE_LOCATION or
    android.permission.ACCESS_FINE_LOCATION
If your application has location permissions, analytics will track where your application is being used.
Without this, only country level location information will be available.
To disable detailed location reporting even when your app has permission, call
Flurry.setReportLocation(false) before calling Flurry.initialize(key)

## Author
Ayo Adesugba

## Module History

View the [change log](changelog.html) for this module.

## Feedback and Support
Please direct all questions, feedback, and concerns to [info@appcelerator.com](mailto:info@appcelerator.com?subject=Android%20Flurry%20Module).

## License
Copyright(c) 2010-2014 by Appcelerator, Inc. All Rights Reserved. Please see the LICENSE file included in the distribution for further details.

Flurry is Copyright(c) 2010 by Flurry, Inc.  

Usage of this module is subject to the Terms of Service agreement of Flurry, Inc. 
as well as your Terms of Service agreement with Appcelerator, Inc.