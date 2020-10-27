//
//  ViewController.m
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import "ViewController.h"
#import "ChartViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)presentKlineVc:(id)sender {
    ChartViewController *stockChartVC = [ChartViewController new];
    stockChartVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:stockChartVC animated:YES completion:nil];
}

@end
