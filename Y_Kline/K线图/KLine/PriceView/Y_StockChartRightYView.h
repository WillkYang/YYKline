//
//  Y_StockChartRightYView.h
//  BTC-Kline
//
//  Created by yate1996 on 16/5/3.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Y_StockChartRightYView : UIView
@property(nonatomic,assign) CGFloat maxValue;

@property(nonatomic,assign) CGFloat middleValue;

@property(nonatomic,assign) CGFloat minValue;

@property(nonatomic,copy) NSString *minLabelText;


@end
