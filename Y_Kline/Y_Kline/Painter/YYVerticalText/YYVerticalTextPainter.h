//
//  YYVerticalTextPainter.h
//  Y_Kline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "YYMinMaxModel.h"
#import "YYKlineModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYVerticalTextPainter : CALayer
+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area minMax: (YYMinMaxModel *)minMaxModel;
@end

NS_ASSUME_NONNULL_END
