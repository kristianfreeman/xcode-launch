//
//  JLConstants.h
//  xcodelaunch
//
//  Created by Jack Lawrence on 3/3/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

/** NSUserDefaults Keys */
static NSString *const JLUserDeclinedLoginItemUserDefault = @"JLUserDeclinedLoginItem";
static NSString *const JLDockIconIsHiddenUserDefault = @"DockIconIsHidden";

/** NSNotificationCenter Keys */
static NSString *const JLXcodeWasLaunchedNotification = @"JLXcodeWasLaunchedNotification";

/** Application Paths */
static NSString *const JLProductionPath = @"/Developer/Applications/Xcode.app";
static NSString *const JLDevelopmentPath = @"/Applications/Xcode.app";

/** Application Versions */
static NSString *const JLProductionVersion = @"5.0";
static NSString *const JLDevelopmentVersion = @"5.1";
