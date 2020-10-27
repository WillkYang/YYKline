//
//  YYMAPainter.h
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYMinMaxModel.h"
#import "YYKlineModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYMAPainter : CALayer
+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area models:(NSArray <YYKlineModel *> *)models minMax: (YYMinMaxModel *)minMaxModel;
+ (YYMinMaxModel *)getMinMaxValue:(NSArray <YYKlineModel *> *)data;
+ (NSAttributedString *)getText:(YYKlineModel *)model;
@end

NS_ASSUME_NONNULL_END
