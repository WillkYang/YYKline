//
//  Y_KLineVolumeView.h
//  BTC-Kline
//
//  Created by yate1996 on 16/5/3.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y_StockChartConstant.h"
@protocol Y_KLineVolumeViewDelegate <NSObject>

@optional

/**
 *  当前VolumeView的最大值和最小值
 */
- (void)kLineVolumeViewCurrentMaxVolume:(CGFloat)maxVolume minVolume:(CGFloat)minVolume;

@end

@interface Y_KLineVolumeView : UIView

/**
 * 需要绘制的K线模型数组
 */
@property (nonatomic, strong) NSArray *needDrawKLineModels;

/**
 * 需要绘制的K线位置数组
 */
@property (nonatomic, strong) NSArray *needDrawKLinePositionModels;

/**
 *  K线的颜色
 */
@property (nonatomic, strong) NSArray *kLineColors;

/**
 *  代理
 */
@property (nonatomic, weak) id<Y_KLineVolumeViewDelegate> delegate;


/**
 *  Accessory指标种类
 */
@property (nonatomic, assign) Y_StockChartTargetLineStatus targetLineStatus;

/**
 *  绘制
 */
- (void)draw;
@end
