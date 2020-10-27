//
//  YYKlineModel.h
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYIndicatorModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYKlineModel : NSObject

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, weak) YYKlineModel *PrevModel;

@property (nonatomic, strong) NSNumber *Timestamp;
@property (nonatomic, strong) NSNumber *Open;
@property (nonatomic, strong) NSNumber *Close;
@property (nonatomic, strong) NSNumber *High;
@property (nonatomic, strong) NSNumber *Low;
@property (nonatomic, strong) NSNumber *Volume;

@property (nonatomic, strong) YYMACDModel *MACD;
@property (nonatomic, strong) YYKDJModel *KDJ;
@property (nonatomic, strong) YYMAModel *MA;
@property (nonatomic, strong) YYEMAModel *EMA;
@property (nonatomic, strong) YYRSIModel *RSI;
@property (nonatomic, strong) YYBOLLModel *BOLL;
@property (nonatomic, strong) YYWRModel *WR;

@property (nonatomic, assign) BOOL isUp;
@property (nonatomic, assign) BOOL isDrawTime;

@property (nonatomic, copy) NSString *V_Date;
@property (nonatomic, copy) NSString *V_HHMM;
@property (nonatomic, copy) NSAttributedString *V_Price;
@property (nonatomic, copy) NSAttributedString *V_MA;
@property (nonatomic, copy) NSAttributedString *V_EMA;
@property (nonatomic, copy) NSAttributedString *V_BOLL;
@property (nonatomic, copy) NSAttributedString *V_Volume;
@property (nonatomic, copy) NSAttributedString *V_MACD;
@property (nonatomic, copy) NSAttributedString *V_KDJ;
@property (nonatomic, copy) NSAttributedString *V_WR;
@property (nonatomic, copy) NSAttributedString *V_RSI;

@end

NS_ASSUME_NONNULL_END
