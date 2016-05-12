//
//  Y_KLineAccessory.h
//  BTC-Kline
//
//  Created by yate1996 on 16/5/4.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Y_KLineVolumePositionModel.h"
#import "Y_KLineModel.h"
@interface Y_KLineAccessory : NSObject

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
