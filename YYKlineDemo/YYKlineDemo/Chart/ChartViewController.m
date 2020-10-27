//
//  YStockChartViewController.m
//  YYKline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import "ChartViewController.h"
#import "Masonry.h"
#import "ChartView.h"
#import "YYKline.h"
#import "AppDelegate.h"

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define SCREEN_MAX_LENGTH MAX(kScreenWidth,kScreenHeight)
#define IS_IPHONE_X (IS_IPHONE && SCREEN_MAX_LENGTH >= 812.0)
#define defer __strong void(^block)(void) __attribute__((cleanup(blockCleanUp), unused)) = ^

@interface ChartViewController ()<ChartViewDataSource>
@property (nonatomic, strong) ChartView *stockChartView;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@end

static void blockCleanUp(__strong void(^*block)(void)) {
    (*block)();
}

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.backgroundColor;
    // 初始化K线View
    self.stockChartView = [[ChartView alloc] initWithItemModels:@[
        [ChartViewItemModel itemModelWithTitle:@"指标" type:YYKlineTypeIndicator],
        [ChartViewItemModel itemModelWithTitle:@"分时" type:YYKlineTypeTimeLine],
        [ChartViewItemModel itemModelWithTitle:@"1分" type:YYKlineTypeKline],
        [ChartViewItemModel itemModelWithTitle:@"5分" type:YYKlineTypeKline],
        [ChartViewItemModel itemModelWithTitle:@"15分" type:YYKlineTypeKline],
        [ChartViewItemModel itemModelWithTitle:@"30分" type:YYKlineTypeKline],
        [ChartViewItemModel itemModelWithTitle:@"60分" type:YYKlineTypeKline],
        [ChartViewItemModel itemModelWithTitle:@"日线" type:YYKlineTypeKline],
        [ChartViewItemModel itemModelWithTitle:@"周线" type:YYKlineTypeKline],
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

    [self.indicatorView startAnimating];
    
    NSDictionary *dict = @{ @1: @"1m", @2: @"1m", @3: @"5m", @4: @"15m", @5: @"30m", @6: @"1h", @7: @"1d", @8: @"1w",};
    NSString *url = [NSString stringWithFormat:@"https://h5-market.niuyan.com/web/v1/ticker/kline?exchange_id=zb&base_symbol=VSYS&quote_symbol=QC&lan=zh-cn&size=500&interval=%@", dict[@(index)]];
    
    __weak typeof(self) weakSelf = self;
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        defer {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicatorView stopAnimating];
            });
        };
        
        if (error) return;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        if (error) return;
        
        YYKlineRootModel *groupModel = [YYKlineRootModel objectWithArray:dict[@"data"][@"data"]];
        [weakSelf.stockChartView reloadWithData:groupModel];
    }];
    
    [task resume];
}

- (UIActivityIndicatorView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        [self.view addSubview:_indicatorView];
        _indicatorView.frame = CGRectMake(0, 0, 100, 100);
        _indicatorView.center = self.view.center;
        
    }
    return _indicatorView;
}
@end
