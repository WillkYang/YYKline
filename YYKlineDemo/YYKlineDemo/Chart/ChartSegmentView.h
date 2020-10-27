//
//  chartSegmentView.h
//  YYKline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ChartSegmentView;

@protocol ChartSegmentViewDelegate <NSObject>

- (void)chartSegmentView:(ChartSegmentView *)segmentView clickSegmentButtonIndex:(NSInteger)index;

@end


@interface ChartSegmentView : UIView

- (instancetype)initWithItems:(NSArray *)items;

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id <ChartSegmentViewDelegate> delegate;

@property (nonatomic, assign) NSUInteger selectedIndex;

@end
