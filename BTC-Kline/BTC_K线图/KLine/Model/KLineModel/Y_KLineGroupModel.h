//
//  Y-KLineGroupModel.h
//  BTC-Kline
//
//  Created by yate1996 on 16/4/28.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
@class Y_KLineModel;

@interface Y_KLineGroupModel : NSObject


@property (nonatomic, copy) NSArray<Y_KLineModel *> *models;

//初始化Model
+ (instancetype) objectWithArray:(NSArray *)arr;
@end

//初始化第一个Model
//第一个 EMA(12) 是前n1个c相加和后除以n1,第一个 EMA(26) 是前n2个c相加和后除以n2
