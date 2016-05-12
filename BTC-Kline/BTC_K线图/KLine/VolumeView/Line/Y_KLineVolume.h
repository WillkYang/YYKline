//
//  Y_KLineVolume.h
//  BTC-Kline
//
//  Created by yate1996 on 16/5/3.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y_KLineVolumePositionModel.h"
#import "Y_KLineModel.h"
@interface Y_KLineVolume : NSObject

/**
 *  位置model
 */
@property (nonatomic, strong) Y_KLineVolumePositionModel *positionModel;

/**
 *  k线model
 */
@property (nonatomic, strong) Y_KLineModel *kLineModel;

/**
 *  线颜色
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 *  根据context初始化均线画笔
 */
- (instancetype)initWithContext:(CGContextRef)context;

/**
 *  绘制成交量
 */
- (void)draw;
@end
