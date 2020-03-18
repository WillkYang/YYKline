//
//  YStockChartViewController.m
//  BTC-Kline
//
//  Created by yate1996 on 16/4/27.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_StockChartViewController.h"
#import "Masonry.h"
#import "Y_StockChartView.h"
#import "Y_StockChartView.h"
#import "NetWorking.h"
#import "Y_KLineGroupModel.h"
#import "UIColor+Y_StockChart.h"
#import "AppDelegate.h"

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define SCREEN_MAX_LENGTH MAX(kScreenWidth,kScreenHeight)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH == 812.0)

@interface Y_StockChartViewController ()<Y_StockChartViewDataSource>

@property (nonatomic, strong) Y_StockChartView *stockChartView;

@property (nonatomic, strong) Y_KLineGroupModel *groupModel;

@property (nonatomic, strong) NSMutableDictionary <NSString*, Y_KLineGroupModel*> *modelsDict;

@property (nonatomic, assign) NSInteger currentIndex;

@property (nonatomic, copy) NSString *type;

@end

@implementation Y_StockChartViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentIndex = -1;
    [self initChartView];
}



- (void)reloadData {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"interval"] = self.type;
    param[@"exchange_id"] = @"zb";
    param[@"base_symbol"] = @"VSYS";
    param[@"quote_symbol"] = @"QC";
    param[@"lan"] = @"zh-ch";
    param[@"size"] = @"100";
    __weak typeof(self) weakSelf = self;
    [NetWorking requestWithApi:@"https://h5-market.niuyan.com/web/v1/ticker/kline" param:param thenSuccess:^(NSDictionary *responseObject) {
        if (weakSelf) {
            Y_KLineGroupModel *groupModel = [Y_KLineGroupModel objectWithArray:responseObject[@"data"][@"data"]];
            weakSelf.groupModel = groupModel;
            [weakSelf.modelsDict setObject:groupModel forKey:weakSelf.type];
            [weakSelf.stockChartView reloadData];
        }
    } fail:^{
        
    }];
}

- (void)initChartView {
    self.stockChartView = [Y_StockChartView new];
    // 定义K线支持的类型
    self.stockChartView.itemModels = @[
                                   [Y_StockChartViewItemModel itemModelWithTitle:@"指标" type:Y_StockChartcenterViewTypeIndicator],
                                   [Y_StockChartViewItemModel itemModelWithTitle:@"分时" type:Y_StockChartcenterViewTypeTimeLine],
                                   [Y_StockChartViewItemModel itemModelWithTitle:@"1分" type:Y_StockChartcenterViewTypeKline],
                                   [Y_StockChartViewItemModel itemModelWithTitle:@"5分" type:Y_StockChartcenterViewTypeKline],
                                   [Y_StockChartViewItemModel itemModelWithTitle:@"30分" type:Y_StockChartcenterViewTypeKline],
                                   [Y_StockChartViewItemModel itemModelWithTitle:@"60分" type:Y_StockChartcenterViewTypeKline],
                                   [Y_StockChartViewItemModel itemModelWithTitle:@"日线" type:Y_StockChartcenterViewTypeKline],
                                   [Y_StockChartViewItemModel itemModelWithTitle:@"周线" type:Y_StockChartcenterViewTypeKline],
                                   ];
    self.stockChartView.backgroundColor = [UIColor orangeColor];
    self.stockChartView.dataSource = self;
    [self.view addSubview:_stockChartView];
    [_stockChartView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IS_IPHONE_X) {
            make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 30, 0, 0));
        } else {
            make.edges.equalTo(self.view);
        }
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    tap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap];
    self.stockChartView.backgroundColor = [UIColor backgroundColor];
}

# pragma mark - Delegate
-(id) stockDatasWithIndex:(NSInteger)index {
    NSDictionary *dict = @{
        @0: @"1m",
        @1: @"1m",
        @2: @"1m",
        @3: @"5m",
        @4: @"30m",
        @5: @"1h",
        @6: @"1d",
        @7: @"1w",
    };
    self.currentIndex = index;
    self.type = dict[@(index)];
    if(![self.modelsDict objectForKey:self.type]) {
        [self reloadData];
    } else {
        return [self.modelsDict objectForKey:self.type].models;
    }
    return nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarHidden = NO;
}

- (void)dismiss {
    AppDelegate *appdelegate = [UIApplication sharedApplication].delegate;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

#pragma mark - Getter

- (NSMutableDictionary<NSString *,Y_KLineGroupModel *> *)modelsDict {
    if (!_modelsDict) {
        _modelsDict = @{}.mutableCopy;
    }
    return _modelsDict;
}
@end
