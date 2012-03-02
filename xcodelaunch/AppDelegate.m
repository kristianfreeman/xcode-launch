//
//  AppDelegate.m
//  xcodelaunch
//
//  Created by Kristian Freeman on 3/1/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize Prod = _Prod;
@synthesize Dev = _Dev;
@synthesize prodLoc = _prodLoc;
@synthesize devLoc = _devLoc;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    
    [self.Dev setTarget:self];
    [self.Dev setAction:@selector(chooseDev:)];
    [self.Prod setTarget:self];
    [self.Prod setAction:@selector(chooseProd:)];
    
    NSString *prodFolder = [[NSString alloc] initWithString:@"/Developer"];
    NSString *productionXcode = [prodFolder stringByAppendingString:@"/Applications/Xcode.app"];
    [self.prodLoc setStringValue:productionXcode];
    
    NSString *devFolder = [[NSString alloc] initWithString:@"/Applications"];
    NSString *developerXcode = [devFolder stringByAppendingString:@"/Xcode.app"];
    [self.devLoc setStringValue:developerXcode];

}

- (void)chooseProd:(id)sender {
    NSString *appFolder = [[NSString alloc] initWithString:@"/Developer"];
    NSString *productionXcode = [appFolder stringByAppendingString:@"/Applications/Xcode.app"];
    [self.prodLoc setStringValue:productionXcode];
    
    [[NSWorkspace sharedWorkspace] launchApplication:productionXcode];
    [NSApp terminate:nil];
}

- (void)chooseDev:(id)sender {
    NSString *appFolder = [[NSString alloc] initWithString:@"/Applications"];
    NSString *developerXcode = [appFolder stringByAppendingString:@"/Xcode.app"];
    [self.devLoc setStringValue:developerXcode];
    [[NSWorkspace sharedWorkspace] launchApplication:developerXcode];
    [NSApp terminate:nil];

}


@end
