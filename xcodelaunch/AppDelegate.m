//
//  AppDelegate.m
//  xcodelaunch
//
//  Created by Kristian Freeman on 3/1/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import "AppDelegate.h"

#import "JLStatusBarIcon.h"

@implementation AppDelegate

@synthesize statusBarItem = _statusBarItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    CGFloat thickness = [[NSStatusBar systemStatusBar] thickness];
    _statusBarItem = [[NSStatusBar systemStatusBar] statusItemWithLength:thickness];
    JLStatusBarIcon *statusBarIcon = [[JLStatusBarIcon alloc] initWithFrame:NSMakeRect(0, 0, thickness, thickness)];
    [self.statusBarItem setView:statusBarIcon];
    [self.statusBarItem setHighlightMode:YES]; 
}


@end
