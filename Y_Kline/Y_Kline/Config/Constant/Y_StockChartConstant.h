//
//  Y_StockChartConstant.h
//  Y_Kline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#ifndef Y_StockChartConstant_h
#define Y_StockChartConstant_h

#endif /* Y_StockChartConstant_h */

/**
 *  K线图Y的View的宽度
 */
#define Y_StockChartKLinePriceViewWidth 47

/**
 *  K线最大的宽度
 */
#define Y_StockChartKLineMaxWidth 20

/**
 *  K线图最小的宽度
 */
#define Y_StockChartKLineMinWidth 2

/**
 *  K线图缩放界限
 */
#define Y_StockChartScaleBound 0.02

/**
 *  K线的缩放因子
 */
#define Y_StockChartScaleFactor 0.07

/**
 *  长按时的线的宽度
 */
#define Y_StockChartLongPressVerticalViewWidth 0.5

/**
 *  上下影线宽度
 */
#define Y_StockChartLineWidth 1

// Kline种类
typedef NS_ENUM(NSInteger, Y_StockLineType) {
    Y_StockLineTypeKline = 1, //K线
    Y_StockLineTypeTimeLine,  //分时图
    Y_StockLineTypeIndicator
};
