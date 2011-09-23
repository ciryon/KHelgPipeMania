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

-(id)initWithType:(CWPipeType) type;
{
    self = [super init];
    if (self) {
        self.type = type;
    }
    return self;
}

@end
