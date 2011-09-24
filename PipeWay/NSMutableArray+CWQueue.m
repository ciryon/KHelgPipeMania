//
//  NSMutableArray+CWQueue.m
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-24.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import "NSMutableArray+CWQueue.h"

@implementation NSMutableArray (CWQueue)




- (id)takeObject
{
  id object=nil;
  if ([self count])
  {
    object=[self objectAtIndex:0];
    [object retain];
    [self removeObjectAtIndex:0];
  }
  return [object autorelease];
}
@end

