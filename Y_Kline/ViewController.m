//
//  ViewController.m
//  Y_Kline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import "ViewController.h"
#import "Y_StockChartViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self presentKlineVc:nil];
}

- (IBAction)presentKlineVc:(id)sender {
    Y_StockChartViewController *stockChartVC = [Y_StockChartViewController new];
    stockChartVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:stockChartVC animated:YES completion:nil];
}

@end
