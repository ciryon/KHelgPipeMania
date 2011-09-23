//
//  CWGridView.h
//  PipeWay
//
//  Created by Ester Ytterbrink on 2011-09-23.
//  Copyright 2011 Jayway AB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWPIpeView.h"

@interface CWGridView : UIView {
    id <CWGridViewDelegate> _delegate;
    UIGestureRecognizer* _tapGestureRecognizer;
}

@end

@protocol CWGridViewDelegate

- (CWPipeView*) gridView:(CWGridView*) view viewForCellAtRow:(NSUInteger)row inColumn:(NSUInteger)col;

-(void) gridView:(CWGridView*) view didTapCellAtRow:(NSUInteger)row inColumn:(NSUInteger)col;


@end
