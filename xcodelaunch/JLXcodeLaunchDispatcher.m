//
//  JLXcodeLaunchDispatcher.m
//  xcodelaunch
//
//  Created by Jack Lawrence on 3/3/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import "JLXcodeLaunchDispatcher.h"

#import "JLConstants.h"

@implementation JLXcodeLaunchDispatcher

+ (void)launchProduction
{    
    [[NSWorkspace sharedWorkspace] launchApplication:JLProductionPath];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JLXcodeWasLaunched object:nil];
}

+ (void)launchDevelopment
{
    [[NSWorkspace sharedWorkspace] launchApplication:JLDevelopmentPath];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JLXcodeWasLaunched object:nil];
}

@end
