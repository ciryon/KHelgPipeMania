//
//  CWPipe.m
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-23.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import "CWPipe.h"

@implementation CWPipe
@synthesize type;

-(id)initWithType:(CWPipeType) pipeType;
{
    self = [super init];
    if (self) {
        self.type = pipeType;
    }
    return self;
}

-(NSString*)fileNameImage;
{
  NSString *imageName = nil;
  
  switch (self.type) {
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
  return imageName;
}


@end
