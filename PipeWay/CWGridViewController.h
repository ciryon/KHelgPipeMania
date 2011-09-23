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
@protocol CWPipeQueue;
@interface CWGridViewController : UIViewController 
<CWGridViewDelegate,CWGridDataSource>
{

}
@property(nonatomic, retain) UIGestureRecognizer* tapGestureRecognizer;
@property(nonatomic, retain) IBOutlet id<CWPipeQueue> pipeQueue;
@end

@protocol CWPipeQueue <NSObject>;

    -(CWPipe*) popPipe;

@end
