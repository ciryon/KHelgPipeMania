//
//  CWGridTests.m
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-25.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import "CWGridTests.h"
#import "CWGrid.h"

@implementation CWGridTests

-(void)testCreateGrid;
{
  CWGrid *grid = [CWGrid standardGrid];
  STAssertNotNil(grid, @"Grid should exist after creation");
}

-(void)testInsertTwoCrossPipes;
{
  CWGrid *grid = [CWGrid standardGrid];
  CWPipe *testPipe1 = [[CWPipe alloc] initWithType:CWPipeTypeCross];
  CWPipe *testPipe2 = [[CWPipe alloc] initWithType:CWPipeTypeCross];
  [grid setPipe:testPipe1 forRow:0 column:0];
  [grid setPipe:testPipe2 forRow:0 column:1];
  NSUInteger numberOfPipesInGrid = [grid numberOfPipes];
  STAssertTrue(numberOfPipesInGrid==2, @"There should be 2 pipes in grid after inserting two pipes but there were %d",numberOfPipesInGrid);
}

@end
