//
//  YYTimePainter.m
//  Y_Kline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import "YYTimePainter.h"
#import "Y_StockChartGlobalVariable.h"
#import "UIColor+Y_StockChart.h"

@implementation YYTimePainter

+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area models:(NSArray <YYKlineModel *> *)models {
    CGFloat maxH = CGRectGetHeight(area);
    if (maxH <= 0) {
        return;
    }
    
    YYTimePainter *sublayer = [[YYTimePainter alloc] init];
    sublayer.backgroundColor = UIColor.assistBackgroundColor.CGColor;
    sublayer.frame = area;
    [layer addSublayer:sublayer];
    
    CGFloat w = [Y_StockChartGlobalVariable kLineWidth];
    [models enumerateObjectsUsingBlock:^(YYKlineModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (!obj.isDrawTime) {
            return;
        }
        CGFloat x = idx * (w + [Y_StockChartGlobalVariable kLineGap]);
        CGFloat y = (maxH - [UIFont systemFontOfSize:12.f].lineHeight)/2.f;
        CATextLayer *textLayer = [CATextLayer layer];
        textLayer.string = obj.V_HHMM;
        textLayer.alignmentMode = kCAAlignmentCenter;
        textLayer.fontSize = 12.f;
        textLayer.foregroundColor = UIColor.grayColor.CGColor;
        textLayer.frame = CGRectMake(x-50, y, 100, maxH);
        textLayer.contentsScale = UIScreen.mainScreen.scale;
        [sublayer addSublayer:textLayer];
    }];
}
@end
