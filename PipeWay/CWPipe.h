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
  CWPipeTypeWestNorth = 2,    // _|
  CWPipeTypeNorthEast = 3     // |_
  } CWPipeType;


@interface CWPipe : NSObject

@end
