//
//  CWGrid.h
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-23.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CWPipe.h"




@interface CWGrid : NSObject

@property(nonatomic, retain) NSMutableArray *rowArray;

+(CWGrid*)standardGrid;

-(CWPipe*)setPipe:(CWPipe*)pipe forRow:(NSUInteger)row column:(NSUInteger)column;
-(CWPipe*)pipeForRow:(NSUInteger)row column:(NSUInteger)column;
-(NSUInteger)numberOfPipes;
-(NSUInteger)numberOfRows;
-(NSUInteger)numberOfColumns;

@end


