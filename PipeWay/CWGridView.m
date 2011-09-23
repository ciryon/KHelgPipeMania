//
//  CWGridView.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import "CWGridView.h"


@implementation CWGridView


@synthesize delegate;
@synthesize datasource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

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
        float pipeWidth = self.frame.size.width/cols;
        float pipeHeight = self.frame.size.height/rows;
        float x = 0 + pipeWidth*col;
        float y = 0 + pipeHeight*row;
        pipeView.frame = CGRectMake(x, y, pipeWidth, pipeHeight);
      }
    }
  }
  
}

- (void)dealloc;
{
    [super dealloc];
}

@end
