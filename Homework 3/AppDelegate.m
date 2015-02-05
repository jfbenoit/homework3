//
//  AppDelegate.m
//  Homework 3
//
//  Created by Jacob Benoit on 1/31/15.
//  Copyright (c) 2015 Jacob Benoit. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

-(IBAction)prePop1Selected:(id)sender {
    NSLog(@"prepopping1 from appdelegate");
}

-(IBAction)prePop2Selected:(id)sender {
    NSLog(@"prepopping2 from appdelegate");
}
@end
