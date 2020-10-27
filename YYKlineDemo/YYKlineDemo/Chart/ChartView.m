//
//  Y-StockChartView.m
//  YYKline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import "ChartView.h"
#import "Masonry.h"
#import "YYKline.h"

@interface ChartView() <ChartSegmentViewDelegate>

/**
 *  K线图View
 */
@property (nonatomic, strong) YYKlineView *kLineView;

/**
 *  图表类型
 */
@property(nonatomic,assign) YYKlineType currentCenterViewType;

/**
 *  当前索引
 */
@property(nonatomic,assign,readwrite) NSInteger currentIndex;


@property (nonatomic, strong) NSMutableDictionary *cacheKlineData;
@end

@implementation ChartView

- (instancetype)initWithItemModels: (NSArray *)itemModels {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor backgroundColor];
        self.cacheKlineData = @{}.mutableCopy;
        [self initUI];
        self.itemModels = itemModels;
        NSMutableArray *items = [NSMutableArray array];
        for(ChartViewItemModel *item in self.itemModels) {
            [items addObject:item.title];
        }
        self.segmentView.items = items;
        ChartViewItemModel *firstModel = self.itemModels.firstObject;
        self.currentCenterViewType = firstModel.centerViewType;
        if(self.dataSource) {
           self.segmentView.selectedIndex = 4;
        }
    }
    return self;
}

- (void)initUI {
    self.segmentView = [ChartSegmentView new];
    self.segmentView.delegate = self;
    [self addSubview:_segmentView];
    [self.segmentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.top.equalTo(self);
        make.width.equalTo(@50);
    }];
    
    self.kLineView = [YYKlineView new];
    [self addSubview:self.kLineView];
    [self.kLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.top.equalTo(self);
        make.left.equalTo(self.segmentView.mas_right);
    }];
}

- (void)reloadWithData:(YYKlineRootModel *)rootModel {
    self.cacheKlineData[@(self.currentIndex)] = rootModel;
    ChartViewItemModel *itemModel = self.itemModels[self.currentIndex];
    self.kLineView.rootModel = rootModel;
    self.kLineView.linePainter = itemModel.centerViewType == YYKlineTypeTimeLine ? YYTimelinePainter.class : YYCandlePainter.class;
    [self.kLineView reDraw];
}

#pragma mark - 代理方法
- (void)chartSegmentView:(ChartSegmentView *)segmentView clickSegmentButtonIndex:(NSInteger)index {
    self.currentIndex = index;
    if(index >= 100) {
        switch (index) {
            case YYKlineIncicatorMACD:
                self.kLineView.indicator2Painter = YYMACDPainter.class;
                break;
            case YYKlineIncicatorRSI:
                self.kLineView.indicator2Painter = YYRSIPainter.class;
                break;
            case YYKlineIncicatorKDJ:
                self.kLineView.indicator2Painter = YYKDJPainter.class;
                break;
            case YYKlineIncicatorWR:
                self.kLineView.indicator2Painter = YYWRPainter.class;
                break;
            case YYKlineIncicatorMA:
                self.kLineView.indicator1Painter = YYMAPainter.class;
                break;
            case YYKlineIncicatorEMA:
                self.kLineView.indicator1Painter = YYEMAPainter.class;
                break;
            case YYKlineIncicatorBOLL:
                self.kLineView.indicator1Painter = YYBOLLPainter.class;
                break;
            default:
                self.kLineView.indicator1Painter = nil;
                break;
        }
        [self.kLineView reDraw];
        [self bringSubviewToFront:self.segmentView];
    } else {
        if (self.cacheKlineData[@(index)]) {
            [self reloadWithData: self.cacheKlineData[@(index)]];
        } else {
            if(self.dataSource && [self.dataSource respondsToSelector:@selector(stockDatasWithIndex:)]) {
                [self.dataSource stockDatasWithIndex:index];
            }
        }
    }
}

@end

/************************ItemModel类************************/
@implementation ChartViewItemModel

+ (instancetype)itemModelWithTitle:(NSString *)title type:(YYKlineType)type {
    ChartViewItemModel *itemModel = [ChartViewItemModel new];
    itemModel.title = title;
    itemModel.centerViewType = type;
    return itemModel;
}

@end
