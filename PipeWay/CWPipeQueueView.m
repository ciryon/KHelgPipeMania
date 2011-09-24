//
//  CWPipeQueueView.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import "CWPipeQueueView.h"

#define kNumberOfPipesToShow 5

@implementation CWPipeQueueView

@synthesize datasource;



-(void)layoutSubviews;
{
  
  float width = self.frame.size.width;
  float height = self.frame.size.height;
  for (UIView *subview in [self subviews]) {
    [subview removeFromSuperview];
  }
  
  for (int i = 0; i<kNumberOfPipesToShow; i++) {
    CWPipeView* pipeView = [self.datasource pipeQueueView:self pipeForIndex:i];
    if (pipeView!=nil) {
      if (pipeView.imageView.image==nil) {
        NSLog(@"WARNING! nil image");
      }
      float pipeHeight = height/kNumberOfPipesToShow;
      float x = 0;
      float y = pipeHeight*i;
      pipeView.frame = CGRectMake(x, y,width, pipeHeight);
      [self addSubview:pipeView];
    }
  }
}




- (void)dealloc
{
  [super dealloc];
}

@end
