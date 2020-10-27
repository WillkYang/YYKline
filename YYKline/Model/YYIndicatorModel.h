//
//  YYIndicatorModel.h
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YYKlineModel;

NS_ASSUME_NONNULL_BEGIN

@interface YYMACDModel : NSObject
@property (nonatomic, strong) NSNumber *DIFF;
@property (nonatomic, strong) NSNumber *DEA;
@property (nonatomic, strong) NSNumber *MACD;
+ (void)calMACDWithData:(NSArray<YYKlineModel *>*)datas params:(NSArray *)params;
@end

@interface YYKDJModel : NSObject
@property (nonatomic, strong) NSNumber *K;
@property (nonatomic, strong) NSNumber *D;
@property (nonatomic, strong) NSNumber *J;
@property (nonatomic, strong) NSNumber *RSV;
+ (void)calKDJWithData:(NSArray<YYKlineModel *>*)datas params:(NSArray *)params;
@end

@interface YYMAModel : NSObject
@property (nonatomic, strong) NSNumber *MA1;
@property (nonatomic, strong) NSNumber *MA2;
@property (nonatomic, strong) NSNumber *MA3;
+ (void)calMAWithData:(NSArray<YYKlineModel *>*)datas params:(NSArray *)params;
@end

@interface YYRSIModel : NSObject
@property (nonatomic, strong) NSNumber *RSI1;
@property (nonatomic, strong) NSNumber *RSI2;
@property (nonatomic, strong) NSNumber *RSI3;
+ (void)calRSIWithData:(NSArray<YYKlineModel *>*)datas params:(NSArray *)params;
@end

@interface YYBOLLModel : NSObject
@property (nonatomic, strong) NSNumber *UP;
@property (nonatomic, strong) NSNumber *MID;
@property (nonatomic, strong) NSNumber *LOW;
+ (void)calBOLLWithData:(NSArray<YYKlineModel *>*)datas params:(NSArray *)params;
@end

@interface YYWRModel : NSObject
@property (nonatomic, strong) NSNumber *WR1;
@property (nonatomic, strong) NSNumber *WR2;
+ (void)calWRWithData:(NSArray<YYKlineModel *>*)datas params:(NSArray *)params;
@end

@interface YYEMAModel : NSObject
@property (nonatomic, strong) NSNumber *EMA1;
@property (nonatomic, strong) NSNumber *EMA2;
+ (void)calEmaWithData:(NSArray<YYKlineModel *>*)datas params:(NSArray *)params;
@end

NS_ASSUME_NONNULL_END
