//
//  YStockChartViewController.m
//  Y_Kline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import "Y_StockChartViewController.h"
#import "Masonry.h"
#import "Y_StockChartView.h"
#import "Y_StockChartView.h"
#import "NetWorking.h"
#import "Y_KLineRootModel.h"
#import "UIColor+Y_StockChart.h"
#import "AppDelegate.h"
#import "YYKlineModel.h"

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define SCREEN_MAX_LENGTH MAX(kScreenWidth,kScreenHeight)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH >= 812.0)

@interface Y_StockChartViewController ()<Y_StockChartViewDataSource>
@property (nonatomic, strong) Y_StockChartView *stockChartView;
@end

@implementation Y_StockChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.backgroundColor;
    // 初始化K线View
    self.stockChartView = [[Y_StockChartView alloc] initWithItemModels:@[
        [Y_StockChartViewItemModel itemModelWithTitle:@"指标" type:Y_StockLineTypeIndicator],
        [Y_StockChartViewItemModel itemModelWithTitle:@"分时" type:Y_StockLineTypeTimeLine],
        [Y_StockChartViewItemModel itemModelWithTitle:@"1分" type:Y_StockLineTypeKline],
        [Y_StockChartViewItemModel itemModelWithTitle:@"5分" type:Y_StockLineTypeKline],
        [Y_StockChartViewItemModel itemModelWithTitle:@"15分" type:Y_StockLineTypeKline],
        [Y_StockChartViewItemModel itemModelWithTitle:@"30分" type:Y_StockLineTypeKline],
        [Y_StockChartViewItemModel itemModelWithTitle:@"60分" type:Y_StockLineTypeKline],
        [Y_StockChartViewItemModel itemModelWithTitle:@"日线" type:Y_StockLineTypeKline],
        [Y_StockChartViewItemModel itemModelWithTitle:@"周线" type:Y_StockLineTypeKline],
    ]];
    self.stockChartView.dataSource = self;
    [self.view addSubview:self.stockChartView];
    [_stockChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IS_IPHONE_X) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 30, 0, 0));
        } else {
            make.edges.equalTo(self.view);
        }
    }];
    
    // 双击屏幕退出全屏
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    tap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 可自定义：默认选中哪个tab
    self.stockChartView.segmentView.selectedIndex = 5;
}

- (void)dismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

# pragma mark - Delegate
- (void)stockDatasWithIndex:(NSInteger)index {
    if (index == 0) {
        NSAssert(YES, @"index不可能为0");
    }
    NSDictionary *dict = @{
        @1: @"1m",
        @2: @"1m",
        @3: @"5m",
        @4: @"15m",
        @5: @"30m",
        @6: @"1h",
        @7: @"1d",
        @8: @"1w",
    };
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"interval"] = dict[@(index)];
    param[@"exchange_id"] = @"zb";
    param[@"base_symbol"] = @"VSYS";
    param[@"quote_symbol"] = @"QC";
    param[@"lan"] = @"zh-ch";
    param[@"size"] = @"500";
    __weak typeof(self) weakSelf = self;
    [NetWorking requestWithApi:@"https://h5-market.niuyan.com/web/v1/ticker/kline" param:param thenSuccess:^(NSDictionary *responseObject) {
        if (weakSelf) {
            // 数据处理
            Y_KLineRootModel *groupModel = [Y_KLineRootModel objectWithArray:responseObject[@"data"][@"data"]];
            // 绘制K线
            [weakSelf.stockChartView reloadWithData:groupModel];
        }
    } fail:^{
        
    }];
}
@end
