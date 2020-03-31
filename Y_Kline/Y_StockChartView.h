//
//  Y-StockChartView.h
//  Y_Kline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y_StockChartConstant.h"
#import "Y_KLineRootModel.h"
#import "Y_StockChartSegmentView.h"

@protocol Y_StockChartViewDataSource <NSObject>
- (void) stockDatasWithIndex:(NSInteger)index;
@end

@interface Y_StockChartView : UIView
@property (nonatomic, strong) NSArray *itemModels;
@property (nonatomic, strong) Y_StockChartSegmentView *segmentView;
- (instancetype)initWithItemModels: (NSArray *)itemModels;
@property (nonatomic, weak) id<Y_StockChartViewDataSource> dataSource;
- (void)reloadWithData:(Y_KLineRootModel *)rootModel;
@end

@interface Y_StockChartViewItemModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) Y_StockLineType centerViewType;
+ (instancetype)itemModelWithTitle:(NSString *)title type:(Y_StockLineType)type;

@end
