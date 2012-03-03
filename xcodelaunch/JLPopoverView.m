//
//  JLPopoverView.m
//  xcodelaunch
//
//  Created by Jack Lawrence on 3/3/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import "JLPopoverView.h"

#import "JLConstants.h"

#define kProductionMajorVersion 5
#define kProductionMinorVersion 0

#define kDevelopmentMajorVersion 5
#define kDevelopmentMinorVersion 1

@implementation JLPopoverView

@synthesize production = _production;
@synthesize development = _development;


- (void)awakeFromNib
{
    [[self production] setTitle:[NSString stringWithFormat:@"Production (%i.%i)", kProductionMajorVersion, kProductionMinorVersion]];
    [[self development] setTitle:[NSString stringWithFormat:@"Development (%i.%i)", kDevelopmentMajorVersion, kDevelopmentMinorVersion]];
    
    if ([super respondsToSelector:@selector(awakeFromNib)]) {
        [super awakeFromNib];
    }
}

- (void)launchProduction:(id)sender
{    
    [[NSWorkspace sharedWorkspace] launchApplication:JLProductionPath];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JLXcodeWasLaunched object:nil];
}

- (void)launchDevelopment:(id)sender
{
    [[NSWorkspace sharedWorkspace] launchApplication:JLDevelopmentPath];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JLXcodeWasLaunched object:nil];
}


@end
