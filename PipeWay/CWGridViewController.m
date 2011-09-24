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
-(void)didEndGameWithNotification:(NSNotification*)notification;


-(void)startTimer;
-(void)timerUpdate;
@end


@implementation CWGridViewController

@synthesize tapGestureRecognizer;
@synthesize pipeRandomizer;
@synthesize timerLabel;
@synthesize startDate;
@synthesize timer;

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
  
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didEndGameWithNotification:) name:@"CWDidEndGame" object:nil];
  
  [self startTimer];
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
    pipeView = [[CWPipeView alloc] init];
    pipeView.imageView.image = [UIImage imageNamed:[pipe fileNameImage]];
    [pipeView.imageView setNeedsLayout];
  }
  return pipeView;
}

-(void) gridView:(CWGridView*) view didTapCellAtRow:(NSUInteger)row inColumn:(NSUInteger)col;
{
  NSLog(@"Did tap at (%d,%d)",row,col);
  
  CWPipe* newPipe = [self.pipeRandomizer popPipeForGridViewController:self];
  NSLog(@"Got type of type %d",newPipe.type);
  
  [[CWGrid standardGrid] setPipe: newPipe forRow:row column:col];
  [self.view setNeedsLayout];
  //Add new pipeview to gridview
  
  
}

#pragma mark Water

-(void)didStartWaterWithNotification:(NSNotification*)notification;
{
  NSLog(@"Got message that water is awayyyy");
}

-(void)didEndGameWithNotification:(NSNotification*)notification;
{
  [self.timer invalidate];
  self.timer = nil;
  NSLog(@"Did end game");
}

#pragma mark Score label
-(void)startTimer;
{
  self.startDate = [NSDate date];

  
  self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerUpdate) userInfo:nil repeats:YES];
  
}

-(void)timerUpdate;
{

  NSDate *date = [NSDate date];
  self.timerLabel.text = [NSString stringWithFormat:@"%f",[date timeIntervalSinceDate:self.startDate]];
}


@end
