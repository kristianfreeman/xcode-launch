//
//  AppDelegate.h
//  xcodelaunch
//
//  Created by Kristian Freeman on 3/1/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) NSStatusItem *statusBarItem;
@property (nonatomic, weak) IBOutlet NSMenuItem *productionMenuItem;
@property (nonatomic, weak) IBOutlet NSMenuItem *developmentMenuItem;

- (IBAction)launchProduction:(id)sender;
- (IBAction)launchDevelopment:(id)sender;

@end
