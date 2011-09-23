//
//  CWPipeQueueViewController.h
//  PipeWay
//
//  Created by Christian Hedin on 2011-09-23.
//  Copyright (c) 2011 Jayway AB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWPipeQueueView.h"
#import "CWGridViewController.h"
@interface CWPipeQueueViewController : UIViewController <CWPipeQueueDataSource, CWPipeQueue>
@property (nonatomic, retain) NSMutableArray* pipes;
@property (nonatomic, retain) NSMutableArray* pipeViews;
-(CWPipe*) popPipe;
-(CWPipe*) getRandomPipe;
@end
