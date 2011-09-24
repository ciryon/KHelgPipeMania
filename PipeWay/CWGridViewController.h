//
//  CWGridViewController.h
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWGrid.h"
#import "CWGridView.h"
#import "CWPipe.h"

@protocol CWPipeRandomizer;

@interface CWGridViewController : UIViewController 
<CWGridViewDelegate,CWGridDataSource>
{

}

@property(nonatomic, retain) IBOutlet UILabel *timerLabel;
@property(nonatomic, retain) NSDate *startDate;
@property(nonatomic,retain) NSTimer *timer;

@property(nonatomic, retain) UIGestureRecognizer *tapGestureRecognizer;
@property(nonatomic, retain) IBOutlet id<CWPipeRandomizer> pipeRandomizer;

@end


@protocol CWPipeRandomizer

-(CWPipe*) popPipeForGridViewController:(CWGridViewController*)controller;

@end
