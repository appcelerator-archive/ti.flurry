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

### bool reportOnClose
This option is on by default. When enabled, Flurry will attempt to send session data when the app is exited as well as
it normally does when the app is started. This will improve the speed at which your application analytics are updated
but can prolong the app termination process due to network latency. In some cases, the network latency can cause the
app to crash.

### bool sessionReportsOnPauseEnabled
This option is off by default. When enabled, Flurry will attempt to send session data when the app is paused as well as
it normally does when the app is started. This will improve the speed at which your application analytics are updated
but can prolong the app pause process due to network latency. In some cases, the network latency can cause the app to
crash.

## Functions

### initialize(string apiKey)
Initializes your Flurry session. You must get your own apiKey from Flurry's website: https://dev.flurry.com/

### initializeWithCrashReporting(string apiKey)
Initializes your Flurry session. Enables Flurry to handle crash reporting. You must get your own apiKey from Flurry's website: https://dev.flurry.com/
NOTE: iOS only allows one crash reporting tool per app; if using another, use Flurry.initialize('<key>') instead.

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

### logAllPageViewsForTarget(id target)
This method increments the page view count for a session based on traversing a UINavigationController or UITabBarController. The page view count is only a counter for the number of transitions in your app. It does not associate a name with the page count. To associate a name with a count of occurences see logEvent.

If you need to release passed target, you should call counterpart method stopLogPageViewsForTarget first.

### stopLogPageViewsForTarget(id target)
Stops logging page views on previously observed with logAllPageViewsForTarget: UINavigationController or UITabBarController.

### logPageView()
Rather than using the logAllPageViews method, you can manually detect user interactions. For each user interaction you
want to manually log, you can use logPageView to log the page view.

### trackLocation(dictionary args)
This allows you to set the current GPS location of the user. Flurry will keep only the last location information.
WARNING: If your app does not use location services in a meaningful way, tracking the user's location can result in
Apple rejecting the app submission.

The passed in dictionary should contain the following keys:

* float latitude
* float longitude
* float horizontalAccuracy
* float verticalAccuracy

## Usage
See example.

## Author
Jeff Haynie and Dawson Toth

## Module History

View the [change log](changelog.html) for this module.

## Feedback and Support
Please direct all questions, feedback, and concerns to [info@appcelerator.com](mailto:info@appcelerator.com?subject=iOS%20Flurry%20Module).

## License
Copyright(c) 2010-2013 by Appcelerator, Inc. All Rights Reserved. Please see the LICENSE file included in the distribution for further details.

Flurry is Copyright(c) 2010 by Flurry, Inc.  

Usage of this module is subject to the Terms of Service agreement of Flurry, Inc. 
as well as your Terms of Service agreement with Appcelerator, Inc.
