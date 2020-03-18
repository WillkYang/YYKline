//
//  Y_MALine.h
//  BTC-Kline
//
//  Created by yate1996 on 16/5/2.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y_KLineModel.h"
typedef NS_ENUM(NSInteger, Y_MAType){
    Y_MA7Type = 0,
    Y_MA30Type,
    Y_BOLL_MB,
    Y_BOLL_UP,
    Y_BOLL_DN
};

/**
 *  画均线的线
 */
@interface Y_MALine : NSObject

@property (nonatomic, strong) NSArray *MAPositions;

@property (nonatomic, strong) NSArray *BOLLPositions;

@property (nonatomic, assign) Y_MAType MAType;
/**
 *  k线的model
 */
@property (nonatomic, strong) Y_KLineModel *kLineModel;

/**
 *  最大的Y
 */
@property (nonatomic, assign) CGFloat maxY;

/**
 *  根据context初始化均线画笔
 */
- (instancetype)initWithContext:(CGContextRef)context;

- (void)draw;

@end
