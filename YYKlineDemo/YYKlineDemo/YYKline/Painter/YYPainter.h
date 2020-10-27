//
//  YYPainter.h
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#ifndef YYPainter_h
#define YYPainter_h

#import "YYCandlePainter.h"
#import "YYMAPainter.h"
#import "YYVolPainter.h"
#import "YYMACDPainter.h"
#import "YYKDJPainter.h"
#import "YYVerticalTextPainter.h"
#import "YYTimePainter.h"
#import "YYWRPainter.h"
#import "YYRSIPainter.h"
#import "YYEMAPainter.h"
#import "YYBOLLPainter.h"
#import "YYTimelinePainter.h"

@protocol YYPainterProtocol <NSObject>
// 绘制
+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area models:(NSArray <YYKlineModel *> *)models minMax: (YYMinMaxModel *)minMaxModel;
// 获取边界值
+ (YYMinMaxModel *)getMinMaxValue:(NSArray <YYKlineModel *> *)data;
// 获取辅助展示文字
+ (NSAttributedString *)getText:(YYKlineModel *)model;
@end

@protocol YYVerticalTextPainterProtocol <NSObject>
+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area minMax: (YYMinMaxModel *)minMaxModel;
@end

#endif /* YYPainter_h */
