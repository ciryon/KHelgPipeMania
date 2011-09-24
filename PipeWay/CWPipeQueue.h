//
//  CWPipeQueue.h
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-24.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWPipe.h"

@interface CWPipeQueue : NSObject

+(CWPipeQueue*)standardQueue;
-(CWPipe*) popPipe;
-(CWPipe*) getRandomPipe;
-(NSUInteger)numberOfPipes;

@property (nonatomic, retain) NSMutableArray* pipes;

@end
