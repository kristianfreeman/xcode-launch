//
//  AppDelegate.h
//  xcodelaunch
//
//  Created by Kristian Freeman on 3/1/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/** The Application's main delegate class. */
@interface AppDelegate : NSObject <NSApplicationDelegate>

/** The item that shows up in the menu bar on the right. */
@property (nonatomic, strong) NSStatusItem *statusBarItem;

/** A menu item in the dock. */
@property (nonatomic, weak) IBOutlet NSMenuItem *productionMenuItem;
/** A menu item in the dock. */
@property (nonatomic, weak) IBOutlet NSMenuItem *developmentMenuItem;

/** Launches the production version of Xcode when the productionMenuItem in the dock is clicked. */
- (IBAction)launchProduction:(id)sender;
/** Launches the development version of Xcode when the productionMenuItem in the dock is clicked. */
- (IBAction)launchDevelopment:(id)sender;

@end
