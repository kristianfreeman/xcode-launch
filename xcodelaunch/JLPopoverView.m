//
//  JLPopoverView.m
//  xcodelaunch
//
//  Created by Jack Lawrence on 3/3/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import "JLPopoverView.h"

#import "JLXcodeLaunchDispatcher.h"

#import "JLConstants.h"

@interface JLPopoverView ()

- (void)setToggleButtonText;

@end

@implementation JLPopoverView

@synthesize production = _production;
@synthesize development = _development;
@synthesize toggleDockIcon = _toggleDockIcon;


- (void)awakeFromNib
{
    [[self production] setTitle:[NSString stringWithFormat:@"Production (%@)", JLProductionVersion]];
    [[self development] setTitle:[NSString stringWithFormat:@"Development (%@)", JLDevelopmentVersion]];
    
    [self setToggleButtonText];
    
    if ([super respondsToSelector:@selector(awakeFromNib)]) {
        [super awakeFromNib];
    }
}

- (void)setToggleButtonText
{
    [[self toggleDockIcon] setTitle:[NSString stringWithFormat:@"%@ Dock Icon", [[NSUserDefaults standardUserDefaults] boolForKey:JLDockIconIsHiddenUserDefault]?@"Show":@"Hide"]];
}

- (void)launchProduction:(id)sender
{    
    [JLXcodeLaunchDispatcher launchProduction];
}

- (void)launchDevelopment:(id)sender
{
    [JLXcodeLaunchDispatcher launchDevelopment];
}

- (void)toggleDockIcon:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setBool:![[NSUserDefaults standardUserDefaults] boolForKey:JLDockIconIsHiddenUserDefault] 
                                            forKey:JLDockIconIsHiddenUserDefault];
    
    [self setToggleButtonText];
    
    ProcessSerialNumber psn = { 0, kCurrentProcess };
    TransformProcessType(&psn, [[NSUserDefaults standardUserDefaults] boolForKey:JLDockIconIsHiddenUserDefault]?kProcessTransformToUIElementApplication:kProcessTransformToForegroundApplication);
}


@end
