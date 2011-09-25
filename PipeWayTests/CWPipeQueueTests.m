//
//  CWPipeQueueTests.m
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-25.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import "CWPipeQueueTests.h"
#import "CWPipeQueue.h"

@implementation CWPipeQueueTests


-(void)testCreateStandardQueue;
{
  CWPipeQueue *pipeQueue = [CWPipeQueue standardQueue];
  STAssertNotNil(pipeQueue, @"There should be a pipe queue after creation but there was not.");
}

- (void)testPopPipes;
{
  CWPipeQueue *pipeQueue = [CWPipeQueue standardQueue];
  CWPipe *firstPipe = [[pipeQueue pipes] objectAtIndex:0];
  CWPipe *poppedPipe = [pipeQueue popPipe];
  STAssertEquals(firstPipe, poppedPipe, @"The popped pipe should be equal to the one that was first in the queue.");
  CWPipe *newFirstPipe = [[pipeQueue pipes] objectAtIndex:0];
  STAssertFalse(newFirstPipe==firstPipe, @"The popped pipe should not be equal to the one that was first in the queue previously.");
}

@end
