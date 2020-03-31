//
//  UIColor+Y_StockChart.h
//  Y_Kline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Y_StockChart)

/**
 *  所有图表的背景颜色
 */
+ (UIColor *)backgroundColor;

/**
 *  辅助背景色
 */
+ (UIColor *)assistBackgroundColor;

/**
 *  涨的颜色
 */
+ (UIColor *)upColor;

/**
 *  跌的颜色
 */
+ (UIColor *)downColor;

/**
 *  主文字颜色
 */
+ (UIColor *)mainTextColor;

/**
 *  分时线的颜色
 */
+ (UIColor *)timeLineLineColor;

/**
 *  长按时线的颜色
 */
+ (UIColor *)longPressLineColor;

+ (UIColor *)line1Color;
+ (UIColor *)line2Color;
+ (UIColor *)line3Color;

@end
