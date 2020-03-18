//
//  Y_VolumeMAView.h
//  BTC-Kline
//
//  Created by yate1996 on 16/5/3.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Y_KLineModel;
@interface Y_VolumeMAView : UIView

+(instancetype)view;

-(void)maProfileWithModel:(Y_KLineModel *)model;
@end
