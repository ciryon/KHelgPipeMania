//
//  PipeWayViewController.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#define kDefaultSeconds 5

#import "PipeWayViewController.h"

@interface PipeWayViewController()

-(void)startWater;

@end

@implementation PipeWayViewController

- (void)dealloc
{
  [super dealloc];
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  
  
  
  [NSTimer scheduledTimerWithTimeInterval:8.0
                                   target:self
                                 selector:@selector(startWater)
                                 userInfo:nil
                                  repeats:NO];
  
}

-(void)startWater;
{
  NSLog(@"STARTING WATER!!!!!");
  NSDate *date = [NSDate date];
  NSNotification *notification = [NSNotification notificationWithName:@"CWDidStartWater" object:date];
  [[NSNotificationCenter defaultCenter] postNotification:notification];
  
  NSNotification *endNotification = [NSNotification notificationWithName:@"CWDidEndGame" object:date];
  [[NSNotificationCenter defaultCenter] postNotification:endNotification];
  
}


- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return YES;
}

@end
