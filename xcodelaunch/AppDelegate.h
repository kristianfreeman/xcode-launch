//
//  AppDelegate.h
//  xcodelaunch
//
//  Created by Kristian Freeman on 3/1/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSButton *Prod;
@property (weak) IBOutlet NSButton *Dev;
@property (weak) IBOutlet NSTextField *prodLoc;
@property (weak) IBOutlet NSTextField *devLoc;

- (IBAction)chooseDev:(id)sender;
- (IBAction)chooseProd:(id)sender;

@end
