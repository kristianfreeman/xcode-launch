//
//  AppDelegate.m
//  xcodelaunch
//
//  Created by Kristian Freeman on 3/1/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import "AppDelegate.h"

#import "JLStatusBarIcon.h"

#import "JLConstants.h"

#import "JLXcodeLaunchDispatcher.h"

@interface AppDelegate ()

+ (void)setupDefaults;

- (void)enableLoginItemWithLoginItemsReference:(LSSharedFileListRef)theLoginItemsRefs ForPath:(NSString *)appPath;
- (BOOL)loginItemExistsWithLoginItemReference:(LSSharedFileListRef)theLoginItemsRefs ForPath:(NSString *)appPath;

@end

@implementation AppDelegate

@synthesize statusBarItem = _statusBarItem;
@synthesize productionMenuItem = _productionMenuItem;
@synthesize developmentMenuItem = _developmentMenuItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [AppDelegate setupDefaults];
    ProcessSerialNumber psn = { 0, kCurrentProcess };
    TransformProcessType(&psn, [[NSUserDefaults standardUserDefaults] boolForKey:JLDockIconIsHiddenUserDefault]?kProcessTransformToUIElementApplication:kProcessTransformToForegroundApplication);
    
    [[self productionMenuItem] setTitle:[NSString stringWithFormat:@"Production (%@)", JLProductionVersion]];
    [[self developmentMenuItem] setTitle:[NSString stringWithFormat:@"Development (%@)", JLDevelopmentVersion]];
    
    [[self productionMenuItem] setEnabled:YES];
    [[self developmentMenuItem] setEnabled:YES];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:JLUserDeclinedLoginItemUserDefault]) {
        NSAlert *alert = [NSAlert alertWithMessageText:@"Xcode Launcher" defaultButton:@"Okay" alternateButton:nil otherButton:@"Cancel" informativeTextWithFormat:@"Open Xcode Launcher at Login?"];
        
        if ([alert runModal] == NSAlertDefaultReturn) {
            NSString * appPath = [[NSBundle mainBundle] bundlePath];
            
            LSSharedFileListRef loginItems = LSSharedFileListCreate(NULL, kLSSharedFileListSessionLoginItems, NULL);
            if (![self loginItemExistsWithLoginItemReference:loginItems ForPath:appPath]) {
                [self enableLoginItemWithLoginItemsReference:loginItems ForPath:appPath];
            }
            CFRelease(loginItems);
            
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:JLUserDeclinedLoginItemUserDefault];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
    
    
    CGFloat thickness = [[NSStatusBar systemStatusBar] thickness];
    _statusBarItem = [[NSStatusBar systemStatusBar] statusItemWithLength:thickness];
    JLStatusBarIcon *statusBarIcon = [[JLStatusBarIcon alloc] initWithFrame:NSMakeRect(0, 0, thickness, thickness)];
    [self.statusBarItem setView:statusBarIcon];
    [self.statusBarItem setHighlightMode:YES]; 
}

- (void)launchProduction:(id)sender
{
    [JLXcodeLaunchDispatcher launchProduction];
}

- (void)launchDevelopment:(id)sender
{
    [JLXcodeLaunchDispatcher launchDevelopment];
}

+ (void)setupDefaults
{
    NSDictionary *userDefaultsValuesDict = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:
                                                                                [NSNumber numberWithBool:YES], 
                                                                                [NSNumber numberWithBool:YES], nil] 
                                                                       forKeys:[NSArray arrayWithObjects:
                                                                                JLUserDeclinedLoginItemUserDefault, 
                                                                                JLDockIconIsHiddenUserDefault, nil]];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:userDefaultsValuesDict];
    
    NSArray *resettableUserDefaultsKeys = [NSArray arrayWithObjects:JLUserDeclinedLoginItemUserDefault, JLDockIconIsHiddenUserDefault, nil];
    NSDictionary *initialValuesDict = [userDefaultsValuesDict dictionaryWithValuesForKeys:resettableUserDefaultsKeys];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:initialValuesDict];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (void)enableLoginItemWithLoginItemsReference:(LSSharedFileListRef )theLoginItemsRefs ForPath:(NSString *)appPath {
    // We call LSSharedFileListInsertItemURL to insert the item at the bottom of Login Items list.
    CFURLRef url = (__bridge CFURLRef)[NSURL fileURLWithPath:appPath];
    
    CFMutableDictionaryRef inPropertiesToSet = CFDictionaryCreateMutable(NULL, 1, NULL, NULL);
    CFDictionaryAddValue(inPropertiesToSet, kLSSharedFileListLoginItemHidden, kCFBooleanTrue);
    
    LSSharedFileListItemRef itemRef = LSSharedFileListInsertItemURL(theLoginItemsRefs, kLSSharedFileListItemLast, NULL, NULL, url, inPropertiesToSet, NULL);       
    if (itemRef) {
        CFRelease(itemRef);
    }
    if (inPropertiesToSet) {
        CFRelease(inPropertiesToSet);
    }
}

- (BOOL)loginItemExistsWithLoginItemReference:(LSSharedFileListRef)theLoginItemsRefs ForPath:(NSString *)appPath {
	BOOL found = NO;  
	UInt32 seedValue;
	CFURLRef thePath = NULL;
    
	// We're going to grab the contents of the shared file list (LSSharedFileListItemRef objects)
	// and pop it in an array so we can iterate through it to find our item.
	CFArrayRef loginItemsArray = LSSharedFileListCopySnapshot(theLoginItemsRefs, &seedValue);
	for (id item in (__bridge NSArray *)loginItemsArray) {    
		LSSharedFileListItemRef itemRef = (__bridge LSSharedFileListItemRef)item;
		if (LSSharedFileListItemResolve(itemRef, 0, (CFURLRef*) &thePath, NULL) == noErr) {
			if ([[(__bridge NSURL *)thePath path] hasPrefix:appPath]) {
				found = YES;
				break;
			}
            // Docs for LSSharedFileListItemResolve say we're responsible
            // for releasing the CFURLRef that is returned
            if (thePath != NULL) CFRelease(thePath);
		}
	}
	if (loginItemsArray != NULL) CFRelease(loginItemsArray);
    
	return found;
}


@end
