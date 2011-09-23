//
//  CWPipe.h
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-23.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  CWPipeTypeVertical = 0,     // |
  CWPipeTypeHorizontal = 1,   // -
  CWPipeTypeNorthWest = 2,    // _|
  CWPipeTypeNorthEast = 3,    // |_
    CWPipeTypeSouthWest = 4,
    CWPipeTypeSouthEast = 5, 
    CWPipeTypeCross = 6
  } CWPipeType;


@interface CWPipe : NSObject
-(id)initWithType:(CWPipeType) type;
@property (nonatomic, assign) CWPipeType type;

@end
