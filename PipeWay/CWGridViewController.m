//
//  CWGridViewController.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import "CWGridViewController.h"


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

    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self.view action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
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
    pipeView.backgroundColor = [UIColor yellowColor];
    // TODO: Set pipeview depending on pipe (image etc)
  }
  return pipeView;
}

-(void) gridView:(CWGridView*) view didTapCellAtRow:(NSUInteger)row inColumn:(NSUInteger)col;
{
    CWPipe* pipe = [[[CWPipe alloc] init] autorelease];
    [[CWGrid standardGrid] setPipe:pipe forRow:row column:col  ];
    //Add new pipeview to gridview
    

}

@end
