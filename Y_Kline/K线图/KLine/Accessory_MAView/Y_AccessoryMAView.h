//
//  Y_AccessoryMAView.h
//  BTC-Kline
//
//  Created by yate1996 on 16/5/4.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y_StockChartConstant.h"
@class Y_KLineModel;
@interface Y_AccessoryMAView : UIView

+(instancetype)view;

-(void)maProfileWithModel:(Y_KLineModel *)model;

/**
 *  Accessory指标种类
 */
@property (nonatomic, assign) Y_StockChartTargetLineStatus targetLineStatus;

@end
