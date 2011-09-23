//
//  CWPipeQueueViewController.m
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-23.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import "CWPipeQueueViewController.h"

@implementation CWPipeQueueViewController
@synthesize pipes;
@synthesize pipeViews;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  [self.view setBackgroundColor:[UIColor blueColor]];
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
- (CWPipeView*)pipeQueueView:(CWPipeQueueView*)view pipeForIndex:(NSUInteger)index;
{
    return [self.pipeViews objectAtIndex:index]; 
}

- (NSUInteger)numberOfItemsInQueue:(CWPipeQueueView*)view;
{
    return 5;
}
-(CWPipe*)getRandomPipe;
{
    NSUInteger randomInt = random()%7;
    
    return [[[CWPipe alloc] initWithType:randomInt] autorelease];
}
-(CWPipe*) popPipe;
{
    [self.pipeViews removeLastObject];
    CWPipe* pipeToReturn = [self.pipes lastObject];
    [self.pipes removeLastObject];
    CWPipe* newPipe = [self getRandomPipe];
    CWPipeView* newView = [[[CWPipeView alloc] initWithType:newPipe.type] autorelease];
    [self.pipes addObject:newPipe];
    [self.pipeViews addObject:newView];
    return pipeToReturn;
}
@end
