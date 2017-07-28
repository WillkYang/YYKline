//
//  Y_StockChartGlobalVariable.h
//  BTC-Kline
//
//  Created by yate1996 on 16/4/30.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y_StockChartConstant.h"
@interface Y_StockChartGlobalVariable : NSObject

/**
 *  K线图的宽度，默认20
 */
+(CGFloat)kLineWidth;

+(void)setkLineWith:(CGFloat)kLineWidth;

/**
 *  K线图的间隔，默认1
 */
+(CGFloat)kLineGap;

+(void)setkLineGap:(CGFloat)kLineGap;

/**
 *  MainView的高度占比,默认为0.5
 */
+ (CGFloat)kLineMainViewRadio;
+ (void)setkLineMainViewRadio:(CGFloat)radio;

/**
 *  VolumeView的高度占比,默认为0.2
 */
+ (CGFloat)kLineVolumeViewRadio;
+ (void)setkLineVolumeViewRadio:(CGFloat)radio;


/**
 *  isEMA线
 */
+ (CGFloat)isEMALine;
+ (void)setisEMALine:(Y_StockChartTargetLineStatus)type;



/**
 *  isBOLL线
 */
+ (CGFloat)isBOLLLine;
+ (void)setisBOLLLine:(Y_StockChartTargetLineStatus)type;

@end
