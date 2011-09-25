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
      NSMutableArray *columnArray = [[NSMutableArray alloc] initWithCapacity:kNumberOfColumns];
      [_grid.rowArray insertObject:columnArray atIndex:i];
      for (int j=0; j<=kNumberOfColumns; j++) {
        NSObject *obj = [[NSObject alloc] init];
        [columnArray insertObject:obj atIndex:j];
      }
    }
  }
  return _grid;
}

-(CWPipe*)pipeForRow:(NSUInteger)row column:(NSUInteger)column;
{
  NSArray *columnArray = [self.rowArray objectAtIndex:row];
  if (columnArray!=nil) {
    CWPipe *pipe = [columnArray objectAtIndex:column];
    if (pipe!=nil && [pipe isKindOfClass:[CWPipe class]]) {
      return pipe;
    }
    else {
      
    }
    return nil;
  }
  else {
    return nil;
  }
  
  
}

-(CWPipe*)setPipe:(CWPipe*)pipe forRow:(NSUInteger)row column:(NSUInteger)column;
{
  //CWPipe *oldPipe = [self pipeForRow:row column:column];
  NSMutableArray *columnArray = [self.rowArray objectAtIndex:row];
  if (columnArray!=nil) {
    [columnArray replaceObjectAtIndex:column withObject:pipe];
  }
  else {
    
  }
  
  return nil;
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
      if (pipe!=nil && [pipe isKindOfClass:[CWPipe class]]) {
        counter++;
      }
    }
  }
  return counter;
}

@end
