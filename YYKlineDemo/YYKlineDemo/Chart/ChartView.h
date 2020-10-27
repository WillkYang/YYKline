//
//  Y-StockChartView.h
//  YYKline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKline.h"
#import "ChartSegmentView.h"

@protocol ChartViewDataSource <NSObject>
- (void) stockDatasWithIndex:(NSInteger)index;
@end

@interface ChartView : UIView
@property (nonatomic, strong) NSArray *itemModels;
@property (nonatomic, strong) ChartSegmentView *segmentView;
- (instancetype)initWithItemModels: (NSArray *)itemModels;
@property (nonatomic, weak) id<ChartViewDataSource> dataSource;
- (void)reloadWithData:(YYKlineRootModel *)rootModel;
@end

@interface ChartViewItemModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) YYKlineType centerViewType;
+ (instancetype)itemModelWithTitle:(NSString *)title type:(YYKlineType)type;

@end
