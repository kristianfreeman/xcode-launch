//
//  JLStatusBarIcon.m
//  xcodelaunch
//
//  Created by Jack Lawrence on 3/3/12.
//  Copyright (c) 2012 redsashimi, inc. All rights reserved.
//

#import "JLStatusBarIcon.h"

#import "JLConstants.h"

@interface JLStatusBarIcon ()

@property (nonatomic, strong) NSPopover *statusBarPopover;
@property (nonatomic, strong) JLPopoverViewController *popoverViewController;
@property (nonatomic) BOOL popoverIsOpen;

- (void)dismissPopover;

@end

@implementation JLStatusBarIcon

@synthesize statusBarPopover = _statusBarPopover;
@synthesize popoverViewController = _popoverViewController;
@synthesize popoverIsOpen = _popoverIsOpen;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setPopoverIsOpen:NO];
        [self setStatusBarPopover:[[NSPopover alloc] init]];
        [self setPopoverViewController:[[JLPopoverViewController alloc] initWithNibName:@"PopoverView" bundle:nil]];
        [[self statusBarPopover] setContentViewController:[self popoverViewController]];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(dismissPopover) 
                                                     name:JLXcodeWasLaunched 
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self 
                                                 selector:@selector(dismissPopover) 
                                                     name:NSApplicationDidResignActiveNotification 
                                                   object:nil];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    CGFloat thickness = [[NSStatusBar systemStatusBar] thickness];
    NSImage *xcodeIcon = [NSImage imageNamed:@"Xcode"];
    [xcodeIcon setSize:NSMakeSize(thickness, thickness)];
    [[NSColor colorWithPatternImage:xcodeIcon] setFill];
    NSRectFill(dirtyRect);
}

- (void)mouseDown:(NSEvent *)event {
    if (![self popoverIsOpen]) {
        [[self statusBarPopover] showRelativeToRect:[self frame]
                                             ofView:self
                                      preferredEdge:NSMinYEdge];
        [[NSApplication sharedApplication] activateIgnoringOtherApps:YES];
        [self setPopoverIsOpen:YES];
    }
    else {
        [self dismissPopover];
    }
}

- (void)dismissPopover
{
    [[self statusBarPopover] performClose:nil];
    [self setPopoverIsOpen:NO];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    // ARC DOES NOT ALLOW CALLING SUPER
}

@end
