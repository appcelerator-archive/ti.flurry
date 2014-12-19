/**
 * Ti.Flurry Module
 * Copyright (c) 2010-2013 by Appcelerator, Inc. All Rights Reserved.
 * Please see the LICENSE included with this distribution for details.
 */

#import "TiFlurryModule.h"


@implementation TiFlurryModule

#pragma mark Lifecycle

-(void)startup
{
	[super startup];
}

-(void)shutdown:(id)sender
{
	[super shutdown:sender];
}

#pragma mark -
#pragma mark Public APIs
#pragma mark -
#pragma mark Public Lifecycle

-(void)initialize:(id)apiKey
{
	ENSURE_SINGLE_ARG(apiKey, NSString);
	[Flurry startSession:apiKey];
}

-(void)initializeWithCrashReporting:(id)apiKey
{
	ENSURE_SINGLE_ARG(apiKey, NSString);
	[Flurry setCrashReportingEnabled:YES];
	[Flurry startSession:apiKey];
}

# pragma mark Public Properties

-(void)setUserID:(id)value
{
    [Flurry setUserID:value];
}
-(void)setUserId:(id)value
{
    [self setUserID:value];
}

-(void)setAge:(id)value
{
    [Flurry setAge:[TiUtils intValue:value]];
}

-(void)setGender:(id)value
{
    [Flurry setGender:value];
}

-(void)setDebugLogEnabled:(id)value
{
	[Flurry setDebugLogEnabled:[TiUtils boolValue:value]];
}

-(void)setEventLoggingEnabled:(id)value
{
	[Flurry setEventLoggingEnabled:[TiUtils boolValue:value]];
}

-(void)setReportOnClose:(id)value
{
	[Flurry setSessionReportsOnCloseEnabled:[TiUtils boolValue:value]];
}
-(void)reportOnClose:(id)value
{
    ENSURE_SINGLE_ARG(value, NSObject);
	[self setReportOnClose:value];
}

-(void)setSessionReportsOnPauseEnabled:(id)value
{
	[Flurry setSessionReportsOnPauseEnabled:[TiUtils boolValue:value]];
}
-(void)sessionReportsOnPauseEnabled:(id)value
{
    ENSURE_SINGLE_ARG(value, NSObject);
	[self setSessionReportsOnPauseEnabled:value];
}

-(void)setSecureTransportEnabled:(id)value
{
    [Flurry setSecureTransportEnabled:[TiUtils boolValue:value]];
}
-(void)secureTransportEnabled:(id)value
{
    ENSURE_SINGLE_ARG(value, NSObject);
	[self setSecureTransportEnabled:value];
}

# pragma mark Public Methods

-(void)trackLocation:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    [Flurry setLatitude:[TiUtils doubleValue:[args valueForKey:@"latitude"]]
              longitude:[TiUtils doubleValue:[args valueForKey:@"longitude"]]
     horizontalAccuracy:[TiUtils floatValue:[args valueForKey:@"horizontalAccuracy"]]
       verticalAccuracy:[TiUtils floatValue:[args valueForKey:@"verticalAccuracy"]]];
}

-(void)logEvent:(id)args
{
    ENSURE_UI_THREAD(logEvent, args);
	NSString *event = [args objectAtIndex:0];
	NSDictionary *props = nil;
	if ([args count] > 1)
	{
		props = [args objectAtIndex:1];
	}
	if (props == nil)
	{
		[Flurry logEvent:event];
	}
	else 
	{
		[Flurry logEvent:event withParameters:props];
	}
}

-(void)logTimedEvent:(id)args
{
    ENSURE_UI_THREAD(logTimedEvent, args);
	NSString *event = [args objectAtIndex:0];
	NSDictionary *props = nil;
	if ([args count] > 1)
	{
		props = [args objectAtIndex:1];
	}
	if (props == nil)
	{
		[Flurry logEvent:event timed:YES];
	}
	else 
	{
		[Flurry logEvent:event withParameters:props timed:YES];
	}
}

-(void)endTimedEvent:(id)args
{
    ENSURE_UI_THREAD(endTimedEvent, args);
	NSString *event = [args objectAtIndex:0];
	NSDictionary *props = nil;
	if ([args count] > 1)
	{
		props = [args objectAtIndex:1];
	}
	if (props == nil)
	{
		[Flurry endTimedEvent:event withParameters:nil];
	}
	else 
	{
		[Flurry endTimedEvent:event withParameters:props];
	}
}

-(void)logAllPageViews:(id)args
{
    ENSURE_UI_THREAD(logAllPageViews, args);
    [Flurry logAllPageViews:[[TiApp app] controller]];
}

-(void)logPageView:(id)args
{
    ENSURE_UI_THREAD(logPageView, args);
    [Flurry logPageView];
}
    
-(void)logError:(id)args
{
    ENSURE_ARG_COUNT(args, 2);
    NSString *errorName = [args objectAtIndex:0];
    NSString *errorMessage = [args objectAtIndex:1];
    
    NSException *exception = [NSException
                              exceptionWithName:errorName
                              reason:errorMessage
                              userInfo:nil];
    
    
   [Flurry logError:errorName message:errorMessage exception:exception];
}
    
    
    

@end
