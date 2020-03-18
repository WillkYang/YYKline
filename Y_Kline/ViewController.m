//
//  ViewController.m
//  Y_Kline
//
//  Created by WillkYang on 2020/3/18.
//  Copyright © 2020 WillkYang. All rights reserved.
//

#import "ViewController.h"
#import "Y_StockChartViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)presentKlineVc:(id)sender {
    Y_StockChartViewController *stockChartVC = [Y_StockChartViewController new];
    [self presentViewController:stockChartVC animated:YES completion:nil];
}

@end
