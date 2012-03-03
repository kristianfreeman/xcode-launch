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

@interface JLPopoverView ()

- (void)setToggleButtonText;

@end

@implementation JLPopoverView

@synthesize production = _production;
@synthesize development = _development;
@synthesize toggleDockIcon = _toggleDockIcon;


- (void)awakeFromNib
{
    [[self production] setTitle:[NSString stringWithFormat:@"Production (%i.%i)", kProductionMajorVersion, kProductionMinorVersion]];
    [[self development] setTitle:[NSString stringWithFormat:@"Development (%i.%i)", kDevelopmentMajorVersion, kDevelopmentMinorVersion]];
    
    [self setToggleButtonText];
    
    if ([super respondsToSelector:@selector(awakeFromNib)]) {
        [super awakeFromNib];
    }
}

- (void)setToggleButtonText
{
    [[self toggleDockIcon] setTitle:[NSString stringWithFormat:@"%@ Dock Icon", [[NSUserDefaults standardUserDefaults] boolForKey:@"DockIconIsHidden"]?@"Show":@"Hide"]];
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

- (void)toggleDockIcon:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:![[NSUserDefaults standardUserDefaults] boolForKey:@"DockIconIsHidden"] 
                                            forKey:@"DockIconIsHidden"];
    
    [self setToggleButtonText];
    
    ProcessSerialNumber psn = { 0, kCurrentProcess };
    TransformProcessType(&psn, [[NSUserDefaults standardUserDefaults] boolForKey:@"DockIconIsHidden"]?kProcessTransformToUIElementApplication:kProcessTransformToForegroundApplication);
}


@end
