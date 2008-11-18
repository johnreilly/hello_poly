//
//  HelloPolyAppDelegate.h
//  HelloPoly
//
//  Created by John Reilly on 11/16/08.
//  Copyright Tightrope Media Systems 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloPolyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

