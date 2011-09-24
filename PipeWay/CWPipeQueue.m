//
//  CWPipeQueue.m
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-24.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import "CWPipeQueue.h"

#import "NSMutableArray+CWQueue.h"

@interface CWPipeQueue()

-(void)addRandomPipeToQueue;
-(CWPipe*)takeFirstPipeFromQueue;

@end

@implementation CWPipeQueue

@synthesize pipes;

static CWPipeQueue *_standardQueue;

+(CWPipeQueue*)standardQueue;
{
  if (_standardQueue==nil) {
    _standardQueue = [[CWPipeQueue alloc] init];
    NSUInteger numberOfItems = 5;
    _standardQueue.pipes = [[NSMutableArray alloc] init];
    
    for (int i=0; i<numberOfItems; i++) {
      // Populate with 5 first pipes
      [_standardQueue addRandomPipeToQueue];
    }
  }
  return _standardQueue;
}

-(NSUInteger)numberOfPipes;
{
  return [self.pipes count];
}

-(CWPipe*)getRandomPipe;
{
  NSUInteger randomInt = random()%7;
  
  return [[CWPipe alloc] initWithType:randomInt];
}

-(CWPipe*) popPipe;
{
  [self addRandomPipeToQueue];
  return [self takeFirstPipeFromQueue];  
}


#pragma mark Help methods

-(void)addRandomPipeToQueue;
{
  CWPipe *pipe = [self getRandomPipe];
  [self.pipes addObject:pipe];
   NSLog(@"Added pipe of type %d - %d items remaining in queue",pipe.type,[self.pipes count]);
}

-(CWPipe*)takeFirstPipeFromQueue;
{
  
  CWPipe *pipe = [self.pipes takeObject];
  NSLog(@"Took pipe of type %d - %d items remaining in queue",pipe.type,[self.pipes count]);
  return pipe;
}


@end
