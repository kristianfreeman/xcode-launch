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
    NSString *appFolder = [[NSString alloc] initWithString:@"/Developer"];
    NSString *productionXcode = [appFolder stringByAppendingString:@"/Applications/Xcode.app"];
    
    [[NSWorkspace sharedWorkspace] launchApplication:productionXcode];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JLXcodeWasLaunched object:nil];
}

- (void)launchDevelopment:(id)sender
{
    NSString *appFolder = [[NSString alloc] initWithString:@"/Applications"];
    NSString *developerXcode = [appFolder stringByAppendingString:@"/Xcode.app"];

    [[NSWorkspace sharedWorkspace] launchApplication:developerXcode];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:JLXcodeWasLaunched object:nil];
}


@end
