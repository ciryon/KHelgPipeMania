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


@protocol CWGridDataSource;

@interface CWGrid : NSObject

@property(nonatomic, retain) NSMutableArray *rowArray;

+(CWGrid*)standardGrid;


@end

@protocol CWGridDataSource<NSObject>;

-(CWPipe*)setPipe:(CWPipe*)pipe forRow:(NSUInteger)row column:(NSUInteger)column;
-(CWPipe*)pipeForRow:(NSUInteger)row column:(NSUInteger)column;
-(NSUInteger)numberOfPipes;

@end