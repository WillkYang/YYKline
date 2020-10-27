//
//  YYKlineConstant.h
//  YYKline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#ifndef YYKlineConstant_h
#define YYKlineConstant_h

#endif /* YYKlineConstant_h */

/**
 *  K线图Y的View的宽度
 */
#define YYKlineLinePriceViewWidth 47

/**
 *  K线最大的宽度
 */
#define YYKlineLineMaxWidth 20

/**
 *  K线图最小的宽度
 */
#define YYKlineLineMinWidth 2

/**
 *  K线图缩放界限
 */
#define YYKlineScaleBound 0.02

/**
 *  K线的缩放因子
 */
#define YYKlineScaleFactor 0.07

/**
 *  长按时的线的宽度
 */
#define YYKlineLongPressVerticalViewWidth 0.5

/**
 *  上下影线宽度
 */
#define YYKlineLineWidth 1

// Kline种类
typedef NS_ENUM(NSInteger, YYKlineType) {
    YYKlineTypeKline = 1, //K线
    YYKlineTypeTimeLine,  //分时图
    YYKlineTypeIndicator
};
