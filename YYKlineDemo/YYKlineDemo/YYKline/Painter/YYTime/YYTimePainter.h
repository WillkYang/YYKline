//
//  YYTimePainter.h
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "YYKlineModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface YYTimePainter : CALayer
+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area models:(NSArray <YYKlineModel *> *)models;
@end

NS_ASSUME_NONNULL_END
