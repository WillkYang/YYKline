//
//  Y_StockChartSegmentView.h
//  Y_Kline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Y_StockChartSegmentView;

@protocol Y_StockChartSegmentViewDelegate <NSObject>

- (void)y_StockChartSegmentView:(Y_StockChartSegmentView *)segmentView clickSegmentButtonIndex:(NSInteger)index;

@end


@interface Y_StockChartSegmentView : UIView

- (instancetype)initWithItems:(NSArray *)items;

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id <Y_StockChartSegmentViewDelegate> delegate;

@property (nonatomic, assign) NSUInteger selectedIndex;

@end
