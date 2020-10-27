//
//  Y-KlineGroupModel.h
//  YYKline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <math.h>
#import "YYKlineModel.h"

typedef NS_ENUM(NSInteger, YYKlineIncicator) {
    YYKlineIncicatorMA = 100,        // MA线
    YYKlineIncicatorEMA,        // EMA线
    YYKlineIncicatorBOLL,       // BOLL线
    YYKlineIncicatorMACD = 104,   //MACD线
    YYKlineIncicatorKDJ,        // KDJ线
    YYKlineIncicatorRSI,         // RSI
    YYKlineIncicatorWR,         // WR
    
};

@interface YYKlineRootModel : NSObject

+ (instancetype) objectWithArray:(NSArray *)arr;

@property (nonatomic, copy) NSArray<YYKlineModel *> *models;

- (void)calculateIndicators:(YYKlineIncicator)key;

- (void)calculateNeedDrawTimeModel;

@end
