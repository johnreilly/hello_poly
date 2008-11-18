//
//  HelloPolyAppDelegate.m
//  HelloPoly
//
//  Created by John Reilly on 11/16/08.
//  Copyright Tightrope Media Systems 2008. All rights reserved.
//

#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
