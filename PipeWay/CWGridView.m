//
//  CWGridView.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import "CWGridView.h"

@interface CWGridView()



@end

@implementation CWGridView


@synthesize delegate;
@synthesize datasource;
@synthesize rowArray = _rowArray;


-(void)viewDidLoad;
{
  self.rowArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfRows];
  for (int i=0; i<=kNumberOfRows; i++) {
    NSMutableArray *columnArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfColumns];
    [self.rowArray insertObject:columnArray atIndex:i];
    for (int j=0; j<=kNumberOfColumns; j++) {
      NSObject *obj = [[NSObject alloc] init];
      [columnArray insertObject:obj atIndex:j];
    }
  }
}

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer;
{
    CGPoint point  = [gestureRecognizer locationInView:self];
   NSUInteger cols =  [self.datasource numberOfColumnsForGridView:self];
    NSUInteger rows = [self.datasource numberOfRowsForGridView:self];
    NSUInteger col = floor(point.x/(self.frame.size.width/cols));
    NSUInteger row = floor(point.y/(self.frame.size.height/rows));
    [self.delegate gridView:self didTapCellAtRow:row inColumn:col];
}

-(CWPipeView*)viewForRow:(NSUInteger)row column:(NSUInteger)column;
{
  NSArray *columnArray = [self.rowArray objectAtIndex:row];
  CWPipeView *view = [columnArray objectAtIndex:column];
  return view;
}

-(void)setView:(UIView*) view forRow:(NSUInteger)row column:(NSUInteger)column;
{
  NSMutableArray *columnArray = [self.rowArray objectAtIndex:row];
  [columnArray insertObject:view atIndex:column];
}

- (void)layoutSubviews;
{
  int cols = [self.datasource numberOfColumnsForGridView:self];
  int rows = [self.datasource numberOfRowsForGridView:self];
  
  float width = self.frame.size.width;
  float height = self.frame.size.height;
  
  for (int row=0; row<=rows; row++) {
    for (int col=0; col<=cols; col++) {
      UIView *pipeView = [self.delegate gridView:self viewForCellAtRow:row inColumn:col];
      if (pipeView!=nil) {
        float pipeWidth = width/cols;
        float pipeHeight = height/rows;
        float x = 0 + pipeWidth*col;
        float y = 0 + pipeHeight*row;
        pipeView.frame = CGRectMake(x, y, pipeWidth, pipeHeight);
        if ([self viewForRow:row column:col] == nil) {
          [self addSubview:pipeView];

          
          [self setView:pipeView forRow:row column:col];
        }
      }
    }
  }
  
}

- (void)dealloc;
{
  [super dealloc];
}

@end
