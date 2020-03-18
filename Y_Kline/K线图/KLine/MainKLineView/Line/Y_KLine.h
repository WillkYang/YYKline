//
//  Y_KLine.h
//  BTC-Kline
//
//  Created by yate1996 on 16/5/2.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Y_KLinePositionModel.h"
#import "Y_KLineModel.h"
/**
 *  K线的线
 */
@interface Y_KLine : NSObject

/**
 *  K线的位置model
 */
@property (nonatomic, strong) Y_KLinePositionModel *kLinePositionModel;

/**
 *  k线的model
 */
@property (nonatomic, strong) Y_KLineModel *kLineModel;

/**
 *  最大的Y
 */
@property (nonatomic, assign) CGFloat maxY;

/**
 *  根据context初始化
 */
- (instancetype)initWithContext:(CGContextRef)context;

/**
 *  绘制K线
 */
- (UIColor *)draw;


@end
