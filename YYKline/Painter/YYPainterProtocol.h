//
//  YYPainter.h
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#ifndef YYPainter_h
#define YYPainter_h
#import "YYMinMaxModel.h"
#import "YYKlineModel.h"

@class YYMinMaxModel;

@protocol YYPainterProtocol <NSObject>

@required
// 绘制
+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area models:(NSArray <YYKlineModel *> *)models minMax: (YYMinMaxModel *)minMaxModel;

@optional
// 获取边界值
+ (YYMinMaxModel *)getMinMaxValue:(NSArray <YYKlineModel *> *)data;

// 获取辅助展示文字
+ (NSAttributedString *)getText:(YYKlineModel *)model;

@end

@protocol YYVerticalTextPainterProtocol <NSObject>
+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area minMax: (YYMinMaxModel *)minMaxModel;
@end

#endif /* YYPainter_h */
