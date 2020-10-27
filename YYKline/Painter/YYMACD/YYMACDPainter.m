//
//  YYMACDPainter.m
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import "YYMACDPainter.h"
#import "YYKlineGlobalVariable.h"
#import "UIColor+YYKline.h"

@implementation YYMACDPainter
+ (YYMinMaxModel *)getMinMaxValue:(NSArray <YYKlineModel *> *)data {
    if(!data) {
        return [YYMinMaxModel new];
    }
    __block CGFloat maxAssert = 0.f;
    [data enumerateObjectsUsingBlock:^(YYKlineModel * _Nonnull m, NSUInteger idx, BOOL * _Nonnull stop) {
        maxAssert = MAX(maxAssert, MAX(fabsf(m.MACD.DIFF.floatValue), MAX(fabsf(m.MACD.DEA.floatValue), fabsf(m.MACD.MACD.floatValue))));
    }];
    return [YYMinMaxModel modelWithMin:-maxAssert max:maxAssert];
}

+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area models:(NSArray <YYKlineModel *> *)models minMax: (YYMinMaxModel *)minMaxModel {
    if(!models) {
        return;
    }
    CGFloat maxH = CGRectGetHeight(area);
    CGFloat unitValue = maxH/minMaxModel.distance;
    
    YYMACDPainter *sublayer = [[YYMACDPainter alloc] init];
    sublayer.frame = area;
    [layer addSublayer:sublayer];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [models enumerateObjectsUsingBlock:^(YYKlineModel * _Nonnull m, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat w = [YYKlineGlobalVariable kLineWidth];
        CGFloat x = idx * (w + [YYKlineGlobalVariable kLineGap]);
        // 开收
        CGFloat h = fabsf(m.MACD.MACD.floatValue) * unitValue;
        CGFloat y = 0.f;
        if (m.MACD.MACD.floatValue > 0) {
            y = maxH - h + minMaxModel.min * unitValue;
        } else {
            y = maxH + minMaxModel.min * unitValue;
        }
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(x, y, w - [YYKlineGlobalVariable kLineGap], h)];
        CAShapeLayer *l = [CAShapeLayer layer];
        l.path = path.CGPath;
        l.lineWidth = YYKlineLineWidth;
        
        l.strokeColor = m.MACD.MACD.floatValue < 0 ? [UIColor upColor].CGColor : [UIColor downColor].CGColor;
        l.fillColor =   m.MACD.MACD.floatValue < 0 ? [UIColor upColor].CGColor : [UIColor downColor].CGColor;
        [sublayer addSublayer:l];
        
        
        CGPoint point1 = CGPointMake(x+w/2, maxH - (m.MACD.DEA.floatValue - minMaxModel.min)*unitValue);
        CGPoint point2 = CGPointMake(x+w/2, maxH - (m.MACD.DIFF.floatValue - minMaxModel.min)*unitValue);
        if (idx == 0) {
            [path1 moveToPoint:point1];
            [path2 moveToPoint:point2];
        } else {
            [path1 addLineToPoint:point1];
            [path2 addLineToPoint:point2];
        }
    }];
    
    {
        CAShapeLayer *l = [CAShapeLayer layer];
        l.path = path1.CGPath;
        l.lineWidth = YYKlineLineWidth;
        l.strokeColor = UIColor.line1Color.CGColor;
        l.fillColor =   [UIColor clearColor].CGColor;
        [sublayer addSublayer:l];
    }
    {
        CAShapeLayer *l = [CAShapeLayer layer];
        l.path = path2.CGPath;
        l.lineWidth = YYKlineLineWidth;
        l.strokeColor = UIColor.line2Color.CGColor;
        l.fillColor =   [UIColor clearColor].CGColor;
        [sublayer addSublayer:l];
    }
}

+ (NSAttributedString *)getText:(YYKlineModel *)model {
    return model.V_MACD;
}
@end
