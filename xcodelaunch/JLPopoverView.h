//
//  JLPopoverView.h
//  xcodelaunch
//
//  Created by Jack Lawrence on 3/3/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface JLPopoverView : NSView

@property (nonatomic, weak) IBOutlet NSButton *production;
@property (nonatomic, weak) IBOutlet NSButton *development;
@property (nonatomic, weak) IBOutlet NSButton *toggleDockIcon;


- (IBAction)launchProduction:(id)sender;
- (IBAction)launchDevelopment:(id)sender;
- (IBAction)toggleDockIcon:(id)sender;

@end
