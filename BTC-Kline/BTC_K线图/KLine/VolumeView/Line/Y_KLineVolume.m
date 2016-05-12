//
//  Y_KLineVolume.m
//  BTC-Kline
//
//  Created by yate1996 on 16/5/3.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_KLineVolume.h"
#import "Y_StockChartGlobalVariable.h"
@interface Y_KLineVolume ()
@property (nonatomic, assign) CGContextRef context;
@end

@implementation Y_KLineVolume

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
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    CGContextSetLineWidth(context, [Y_StockChartGlobalVariable kLineWidth]);
    
    const CGPoint solidPoints[] = {self.positionModel.StartPoint, self.positionModel.EndPoint};
    CGContextStrokeLineSegments(context, solidPoints, 2);
}
@end
