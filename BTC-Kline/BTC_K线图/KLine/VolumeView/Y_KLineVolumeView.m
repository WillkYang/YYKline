//
//  Y_KLineVolumeView.m
//  BTC-Kline
//
//  Created by yate1996 on 16/5/3.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_KLineVolumeView.h"
#import "Y_KLineModel.h"
#import "Y_StockChartConstant.h"
#import "UIColor+Y_StockChart.h"
#import "Y_KLineVolume.h"
#import "Y_KLineVolumePositionModel.h"
#import "Y_KLinePositionModel.h"
#import "Y_MALine.h"
@interface Y_KLineVolumeView()

/**
 *  需要绘制的成交量的位置模型数组
 */
@property (nonatomic, strong) NSArray *needDrawKLineVolumePositionModels;

/**
 *  Volume_MA7位置数组
 */
@property (nonatomic, strong) NSMutableArray *Volume_MA7Positions;


/**
 *  Volume_MA7位置数组
 */
@property (nonatomic, strong) NSMutableArray *Volume_MA30Positions;

@end

@implementation Y_KLineVolumeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor backgroundColor];
        self.Volume_MA7Positions = @[].mutableCopy;
        self.Volume_MA30Positions = @[].mutableCopy;
    }
    return self;
}

#pragma mark drawRect方法
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if(!self.needDrawKLineVolumePositionModels)
    {
        return;
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    Y_KLineVolume *kLineVolume = [[Y_KLineVolume alloc]initWithContext:context];
    
    [self.needDrawKLineVolumePositionModels enumerateObjectsUsingBlock:^(Y_KLineVolumePositionModel * _Nonnull volumePositionModel, NSUInteger idx, BOOL * _Nonnull stop) {
        kLineVolume.positionModel = volumePositionModel;
        kLineVolume.kLineModel = self.needDrawKLineModels[idx];
        kLineVolume.lineColor = self.kLineColors[idx];
        [kLineVolume draw];
    }];
    
   if(self.targetLineStatus != Y_StockChartTargetLineStatusCloseMA){
        Y_MALine *MALine = [[Y_MALine alloc]initWithContext:context];
        
        //画MA7线
        MALine.MAType = Y_MA7Type;
        MALine.MAPositions = self.Volume_MA7Positions;
        [MALine draw];
        
        //画MA30线
        MALine.MAType = Y_MA30Type;
        MALine.MAPositions = self.Volume_MA30Positions;
        [MALine draw];
   }
    
}

#pragma mark - 公有方法
#pragma mark 绘制volume方法
- (void)draw
{
    NSInteger kLineModelcount = self.needDrawKLineModels.count;
    NSInteger kLinePositionModelCount = self.needDrawKLinePositionModels.count;
    NSInteger kLineColorCount = self.kLineColors.count;
    NSAssert(self.needDrawKLineModels && self.needDrawKLinePositionModels && self.kLineColors && kLineColorCount == kLineModelcount && kLinePositionModelCount == kLineModelcount, @"数据异常，无法绘制Volume");
    self.needDrawKLineVolumePositionModels = [self private_convertToKLinePositionModelWithKLineModels:self.needDrawKLineModels];
    [self setNeedsDisplay];
}

#pragma mark - 私有方法
#pragma mark 根据KLineModel转换成Position数组
- (NSArray *)private_convertToKLinePositionModelWithKLineModels:(NSArray *)kLineModels
{
    CGFloat minY = Y_StockChartKLineVolumeViewMinY;
    CGFloat maxY = Y_StockChartKLineVolumeViewMaxY;
    
    Y_KLineModel *firstModel = kLineModels.firstObject;
    
    __block CGFloat minVolume = firstModel.Volume;
    __block CGFloat maxVolume = firstModel.Volume;
    
    [kLineModels enumerateObjectsUsingBlock:^(Y_KLineModel *  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if(model.Volume < minVolume)
        {
            minVolume = model.Volume;
        }
        
        if(model.Volume > maxVolume)
        {
            maxVolume = model.Volume;
        }
        if(model.Volume_MA7)
        {
            if (minVolume > model.Volume_MA7.floatValue) {
                minVolume = model.Volume_MA7.floatValue;
            }
            if (maxVolume < model.Volume_MA7.floatValue) {
                maxVolume = model.Volume_MA7.floatValue;
            }
        }
        if(model.Volume_MA30)
        {
            if (minVolume > model.Volume_MA30.floatValue) {
                minVolume = model.Volume_MA30.floatValue;
            }
            if (maxVolume < model.Volume_MA30.floatValue) {
                maxVolume = model.Volume_MA30.floatValue;
            }
        }
    }];

    CGFloat unitValue = (maxVolume - minVolume) / (maxY - minY);
    
    NSMutableArray *volumePositionModels = @[].mutableCopy;
    [self.Volume_MA7Positions removeAllObjects];
    [self.Volume_MA30Positions removeAllObjects];
    
    [kLineModels enumerateObjectsUsingBlock:^(Y_KLineModel *  _Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
        Y_KLinePositionModel *kLinePositionModel = self.needDrawKLinePositionModels[idx];
        CGFloat xPosition = kLinePositionModel.HighPoint.x;
        CGFloat yPosition = ABS(maxY - (model.Volume - minVolume)/unitValue);
        if(ABS(yPosition - Y_StockChartKLineVolumeViewMaxY) < 0.5)
        {
            yPosition = Y_StockChartKLineVolumeViewMaxY - 1;
        }
        CGPoint startPoint = CGPointMake(xPosition, yPosition);
        CGPoint endPoint = CGPointMake(xPosition, Y_StockChartKLineVolumeViewMaxY);
        Y_KLineVolumePositionModel *volumePositionModel = [Y_KLineVolumePositionModel modelWithStartPoint:startPoint endPoint:endPoint];
        [volumePositionModels addObject:volumePositionModel];
        
        //MA坐标转换
        CGFloat ma7Y = maxY;
        CGFloat ma30Y = maxY;
        if(unitValue > 0.0000001)
        {
            if(model.Volume_MA7)
            {
                ma7Y = maxY - (model.Volume_MA7.floatValue - minVolume)/unitValue;
            }
            
        }
        if(unitValue > 0.0000001)
        {
            if(model.Volume_MA30)
            {
                ma30Y = maxY - (model.Volume_MA30.floatValue - minVolume)/unitValue;
            }
        }
        
        NSAssert(!isnan(ma7Y) && !isnan(ma30Y), @"出现NAN值");
        
        CGPoint ma7Point = CGPointMake(xPosition, ma7Y);
        CGPoint ma30Point = CGPointMake(xPosition, ma30Y);
        
        if(model.Volume_MA7)
        {
            [self.Volume_MA7Positions addObject: [NSValue valueWithCGPoint: ma7Point]];
        }
        if(model.Volume_MA30)
        {
            [self.Volume_MA30Positions addObject: [NSValue valueWithCGPoint: ma30Point]];
        }
    }];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(kLineVolumeViewCurrentMaxVolume:minVolume:)])
    {
        [self.delegate kLineVolumeViewCurrentMaxVolume:maxVolume minVolume:minVolume];
    }
    return volumePositionModels;
}
@end
