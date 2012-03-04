//
//  JLPopoverView.h
//  xcodelaunch
//
//  Created by Jack Lawrence on 3/3/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/** 
The menu bar popover's view.

Handles button click events and dock icon display. 
 */
@interface JLPopoverView : NSView

/** @name Properties */
/** A button that dispatches a request to launch the production version of Xcode. */
@property (nonatomic, weak) IBOutlet NSButton *production;
/** A button that dispatches a request to launch the development version of Xcode. */
@property (nonatomic, weak) IBOutlet NSButton *development;
/** A button that toggles between hiding and showing the app's icon in the dock. */
@property (nonatomic, weak) IBOutlet NSButton *toggleDockIcon;

/** @name Launching Xcode */
/** Dispatches a request to launch the production version of Xcode. */
- (IBAction)launchProduction:(id)sender;
/** Dispatches a request to launch the development version of Xcode. */
- (IBAction)launchDevelopment:(id)sender;

/** @name Controlling Preferences */
/** Toggles between hiding and showing the app's icon in the dock. */
- (IBAction)toggleDockIcon:(id)sender;

@end
