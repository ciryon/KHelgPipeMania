//
//  CWGridView.m
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import "CWGridView.h"


@implementation CWGridView


@synthesize tapGestureRecognizer;
@synthesize delegate;
@synthesize datasource;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
        [self addGestureRecognizer:self.tapGestureRecognizer];
    }
    return self;
}
- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer;
{
    self.backgroundColor = [UIColor redColor];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)dealloc;
{
    [super dealloc];
}

@end
