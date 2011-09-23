//
//  CWGrid.m
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-23.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import "CWGrid.h"


@implementation CWGrid

@synthesize rowArray = _rowArray;


static CWGrid *_grid;

+(CWGrid*)standardGrid;
{
  if(_grid==nil) {
    _grid = [[CWGrid alloc] init];
    _grid.rowArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfRows];
    for (int i=0; i<=kNumberOfRows; i++) {
      NSArray *columnArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfColumns];
      [_grid.rowArray insertObject:columnArray atIndex:i];
    }
  }
  return _grid;
}

-(CWPipe*)pipeForRow:(NSUInteger)row column:(NSUInteger)column;
{
  NSArray *columnArray = [self.rowArray objectAtIndex:row];
  CWPipe *pipe = [columnArray objectAtIndex:column];
  return pipe;
}

-(CWPipe*)setPipe:(CWPipe*)pipe forRow:(NSUInteger)row column:(NSUInteger)column;
{
  CWPipe *oldPipe = [self pipeForRow:row column:column];
  NSMutableArray *columnArray = [self.rowArray objectAtIndex:row];
  [columnArray insertObject:pipe atIndex:column];
  return oldPipe;
}

-(NSUInteger)numberOfRows;
{
  return kNumberOfRows;
}

-(NSUInteger)numberOfColumns;
{
  return kNumberOfColumns;
}

-(NSUInteger)numberOfPipes;
{
  int counter = 0;
  for (NSArray *columnArray in self.rowArray) {
    for (CWPipe *pipe in columnArray) {
      if (pipe!=nil) {
        counter++;
      }
    }
  }
  return counter;
}

@end
