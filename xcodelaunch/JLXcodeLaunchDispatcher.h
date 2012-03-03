//
//  JLXcodeLaunchDispatcher.h
//  xcodelaunch
//
//  Created by Jack Lawrence on 3/3/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JLXcodeLaunchDispatcher : NSObject

+ (void)launchProduction;
+ (void)launchDevelopment;

@end
