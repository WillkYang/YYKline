//
//  Y_KLineVolumePositionModel.m
//  BTC-Kline
//
//  Created by yate1996 on 16/5/3.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_KLineVolumePositionModel.h"

@implementation Y_KLineVolumePositionModel
+ (instancetype) modelWithStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint
{
    Y_KLineVolumePositionModel *volumePositionModel = [Y_KLineVolumePositionModel new];
    volumePositionModel.StartPoint = startPoint;
    volumePositionModel.EndPoint = endPoint;
    return volumePositionModel;
}

@end
