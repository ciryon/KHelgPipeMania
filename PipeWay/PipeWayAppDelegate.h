//
//  PipeWayAppDelegate.h
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PipeWayViewController;

@interface PipeWayAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PipeWayViewController *viewController;

@end
