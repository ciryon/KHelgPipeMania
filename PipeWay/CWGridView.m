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


@synthesize tapGestureRecognizer;
@synthesize delegate;
@synthesize datasource;
@synthesize rowArray = _rowArray;

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    self.rowArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfRows];
    for (int i=0; i<=kNumberOfRows; i++) {
      NSArray *columnArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfColumns];
      [self.rowArray insertObject:columnArray atIndex:i];
    }
  }
  return self;
}
- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer;
{
  self.backgroundColor = [UIColor redColor];
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

-(UIView*)viewForRow:(NSUInteger)row column:(NSUInteger)column;
{
  NSArray *columnArray = [self.rowArray objectAtIndex:row];
  UIView *view = [columnArray objectAtIndex:column];
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
