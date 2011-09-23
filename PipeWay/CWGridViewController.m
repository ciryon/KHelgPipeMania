//
//  CWGridViewController.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import "CWGridViewController.h"


@interface CWGridViewController()

-(void)didStartWaterWithNotification:(NSNotification*)notification;

@end


@implementation CWGridViewController

@synthesize tapGestureRecognizer;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
  }
  return self;
}

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
- (void)viewDidLoad;
{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"grid_background"]];
  
  self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(handleGesture:)];
  [self.view addGestureRecognizer:self.tapGestureRecognizer];
  
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didStartWaterWithNotification:) name:@"CWDidStartWater" object:nil];
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

#pragma mark Data Source methods

- (UIView*)gridView:(CWGridView*)view pipeForRow:(NSUInteger)row column:(NSUInteger)column;
{
  
  return nil;
}

- (NSUInteger)numberOfRowsForGridView:(CWGridView*)view;
{
  return [[CWGrid standardGrid] numberOfRows];
}

- (NSUInteger)numberOfColumnsForGridView:(CWGridView*)view;
{
  return [[CWGrid standardGrid] numberOfColumns];
}


#pragma mark Delegate methods

- (CWPipeView*) gridView:(CWGridView*)view viewForCellAtRow:(NSUInteger)row inColumn:(NSUInteger)col;
{
  CWPipeView *pipeView = [view viewForRow:row column:col];
  CWPipe *pipe = [[CWGrid standardGrid] pipeForRow:row column:col];
  if (pipeView==nil && pipe!=nil) {
    pipeView = [[CWPipeView alloc] initWithType:pipe.type];
    // TODO: Set pipeview depending on pipe (image etc)
  }
  return pipeView;
}

-(void) gridView:(CWGridView*) view didTapCellAtRow:(NSUInteger)row inColumn:(NSUInteger)col;
{
  NSLog(@"Did tap at (%d,%d)",row,col);
  CWPipeType pipeType = CWPipeTypeNorthWest; // TODO: Replace with the one from queue
  
  CWPipe* pipe = [[[CWPipe alloc] initWithType:pipeType] autorelease];
  [[CWGrid standardGrid] setPipe:pipe forRow:row column:col  ];
  [self.view setNeedsLayout];
  //Add new pipeview to gridview
  
  
}

#pragma mark Water

-(void)didStartWaterWithNotification:(NSNotification*)notification;
{
  NSLog(@"Got message that water is awayyyy");
}

@end
