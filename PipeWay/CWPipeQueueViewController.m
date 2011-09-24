//
//  CWPipeQueueViewController.m
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-23.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import "CWPipeQueueViewController.h"
#import "CWPipeQueue.h"

@implementation CWPipeQueueViewController



- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)awakeFromNib;
{
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
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
	return interfaceOrientation==UIInterfaceOrientationPortrait;
}


- (CWPipeView*)pipeQueueView:(CWPipeQueueView*)view pipeForIndex:(NSUInteger)index;
{
  CWPipe *pipe = [[[CWPipeQueue standardQueue] pipes] objectAtIndex:index];
  CWPipeView *pipeView = [[CWPipeView alloc] init];
  pipeView.imageView.image = [UIImage imageNamed:[pipe fileNameImage]];
  if (index!=0) {
    // Indicate that the first pipe is the next pipe to be had
    [pipeView setAlpha:0.5];
  }
  NSLog(@"Providing pipe of type %d to view",pipe.type);
  return [pipeView autorelease];
}

#pragma mark Protocol conformance

- (NSUInteger)numberOfItemsInQueueForPipeQueueView:(CWPipeQueueView*)view;
{
  return [[CWPipeQueue standardQueue] numberOfPipes];
}

-(CWPipe*) popPipeForGridViewController:(CWGridViewController*)controller;
{
  CWPipe *pipe = [[CWPipeQueue standardQueue] popPipe];
  [self.view setNeedsLayout];
  return pipe;
}


@end
