//
//  Y_KLineAccessory.m
//  BTC-Kline
//
//  Created by yate1996 on 16/5/4.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_KLineAccessory.h"
#import "Y_StockChartGlobalVariable.h"
#import "UIColor+Y_StockChart.h"
@interface Y_KLineAccessory()

@property (nonatomic, assign) CGContextRef context;

@end


@implementation Y_KLineAccessory
- (instancetype)initWithContext:(CGContextRef)context
{
    self = [super init];
    if(self)
    {
        _context = context;
    }
    return self;
}

- (void)draw
{
    if(!self.kLineModel || !self.positionModel || !self.context || !self.lineColor)
    {
        return;
    }
    CGContextRef context = self.context;
    CGContextSetStrokeColorWithColor(context, [UIColor increaseColor].CGColor);
    CGContextSetLineWidth(context, [Y_StockChartGlobalVariable kLineWidth]);
    
    CGPoint solidPoints[] = {self.positionModel.StartPoint, self.positionModel.EndPoint};
    
    if(self.kLineModel.MACD.floatValue > 0)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor decreaseColor].CGColor);
    }
    CGContextStrokeLineSegments(context, solidPoints, 2);
}
@end
