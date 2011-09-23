//
//  CWGridView.h
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWPipeView.h"
#import "CWGridView.h"

@protocol CWGridViewDelegate;
@protocol CWGridDataSource;

@interface CWGridView : UIView {
    id <CWGridViewDelegate> _delegate;
    UIGestureRecognizer* _tapGestureRecognizer;
}

@end

@protocol CWGridViewDelegate<NSObject>

- (CWPipeView*) gridView:(CWGridView*) view viewForCellAtRow:(NSUInteger)row inColumn:(NSUInteger)col;

-(void) gridView:(CWGridView*) view didTapCellAtRow:(NSUInteger)row inColumn:(NSUInteger)col;


@end
@protocol CWGridDataSource<NSObject>;

- (UIView*)gridView:(CWGridView*)view pipeForRow:(NSUInteger)row column:(NSUInteger)column;
- (NSUInteger)numberOfRowsForGridView:(CWGridView*)view;
- (NSUInteger)numberOfColumnsForGridView:(CWGridView*)view;
@end