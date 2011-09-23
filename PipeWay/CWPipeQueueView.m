//
//  CWPipeQueueView.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import "CWPipeQueueView.h"


@implementation CWPipeQueueView

@synthesize datasource;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void)layoutSubviews;
{

    NSUInteger numberOfPipes = [self.datasource numberOfItemsInQueue:self];
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    for (int i = 0; i<numberOfPipes; i++) {
        CWPipeView* pipeView = [self.datasource pipeQueueView:self pipeForIndex:i];
        if (pipeView!=nil) {
                    float pipeHeight = height/numberOfPipes;
                    float x = 0;
                    float y = 0 + pipeHeight*i;
                    pipeView.frame = CGRectMake(x, y,width, pipeHeight);
                      }
        [self addSubview:pipeView];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc
{
    [super dealloc];
}

@end
