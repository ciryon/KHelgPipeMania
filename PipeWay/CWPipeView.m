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
  CGRect defaultFrame = CGRectMake(0, 0, 56.0, 56.0); // this size isn't used 
  self = [super initWithFrame:defaultFrame];
  if (self) {
    NSString *imageName = nil;
    
    switch (pipeType) {
      case CWPipeTypeCross:
        imageName = @"pipe_cross";
        break;
      case CWPipeTypeHorizontal:
        imageName = @"pipe_horizontal";
        break;
      case CWPipeTypeVertical:
        imageName = @"pipe_vertical";
        break;
      case CWPipeTypeNorthEast:
        imageName = @"pipe_north_east";
        break;
      case CWPipeTypeNorthWest:
        imageName = @"pipe_west_north";
        break;
      case CWPipeTypeSouthEast:
        imageName = @"pipe_south_east";
        break;
      case CWPipeTypeSouthWest:
        imageName = @"pipe_west_south";
        break;
      default:
        break;
    }
    
    
    UIImage *image = [UIImage imageNamed:imageName];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self addSubview:imageView];
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
