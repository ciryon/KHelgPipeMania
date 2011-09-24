//
//  UIPipeView.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import "CWPipeView.h"


@implementation CWPipeView

@synthesize imageView;

-(id)init;
{
  CGRect defaultFrame = CGRectMake(0, 0, 56.0, 56.0); // this size isn't used 
  self = [super initWithFrame:defaultFrame];
  if (self) {
    UIImage *placeHolderImage = [UIImage imageNamed:@"placeholder"];
    self.imageView = [[UIImageView alloc] initWithImage:placeHolderImage];
    [self addSubview:imageView];    
  }
  return self;
}


- (void)dealloc
{
    [super dealloc];
}

@end
