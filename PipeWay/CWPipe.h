//
//  CWPipe.h
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-23.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kStepsBetweenDryAndWater 10

typedef enum {
  CWPipeTypeVertical = 0,     // |
  CWPipeTypeHorizontal = 1,   // -
  CWPipeTypeNorthWest = 2,    // _|
  CWPipeTypeNorthEast = 3,    // |_
  CWPipeTypeSouthWest = 4,    // _|
  CWPipeTypeSouthEast = 5,    // |-
  CWPipeTypeCross = 6,        // -|-
  CWPipeTypeVerticalWaterFilled = 10,     // |
  CWPipeTypeHorizontalWaterFilled = 11,   // -
  CWPipeTypeNorthWestWaterFilled = 12,    // _|
  CWPipeTypeNorthEastWaterFilled = 13,    // |_
  CWPipeTypeSouthWestWaterFilled = 14,    // _|
  CWPipeTypeSouthEastWaterFilled = 15,    // |-
  CWPipeTypeCrossWaterFilled = 16        // -|-  
  } CWPipeType;


@interface CWPipe : NSObject

-(id)initWithType:(CWPipeType) type;
-(NSString*)fileNameImage;

@property (nonatomic, assign) CWPipeType type;


@end
