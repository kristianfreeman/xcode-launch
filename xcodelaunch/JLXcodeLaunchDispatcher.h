//
//  JLXcodeLaunchDispatcher.h
//  xcodelaunch
//
//  Created by Jack Lawrence on 3/3/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/** Handles requests to launch versions of Xcode. */
@interface JLXcodeLaunchDispatcher : NSObject

/** @name Launching Xcode */
/** Launches the production version of Xcode. */
+ (void)launchProduction;
/** Launches the development version of Xcode. */
+ (void)launchDevelopment;

@end
