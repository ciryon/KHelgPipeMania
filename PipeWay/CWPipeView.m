//
//  UIPipeView.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import "CWPipeView.h"


@implementation CWPipeView



-(id)initWithType:(CWPipeType)pipeType;
{
  CGRect defaultFrame = CGRectMake(0, 0, 64.0, 64.0); // TODO: Dynamic size
  self = [super initWithFrame:defaultFrame];
  if (self) {
    // TODO
  }
  return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [super dealloc];
}

@end
