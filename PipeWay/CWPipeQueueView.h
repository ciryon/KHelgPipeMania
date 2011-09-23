//
//  CWPipeQueueView.h
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWPipeView.h"
@protocol CWPipeQueueDataSource;

@interface CWPipeQueueView : UIView {
    
}
@property(nonatomic, retain) IBOutlet id<CWPipeQueueDataSource> datasource;

@end
@protocol CWPipeQueueDataSource<NSObject>;

- (CWPipeView*)pipeQueueView:(CWPipeQueueView*)view pipeForIndex:(NSUInteger)index;

- (NSUInteger)numberOfItemsInQueue:(CWPipeQueueView*)view;
@end