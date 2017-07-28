//
//  Y_StockChartConstant.h
//  BTC-Kline
//
//  Created by yate1996 on 16/4/30.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#ifndef Y_StockChartConstant_h
#define Y_StockChartConstant_h


#endif /* Y_StockChartConstant_h */

/**
 *  K线图需要加载更多数据的通知
 */
#define Y_StockChartKLineNeedLoadMoreDataNotification @"Y_StockChartKLineNeedLoadMoreDataNotification"

/**
 *  K线图Y的View的宽度
 */
#define Y_StockChartKLinePriceViewWidth 47

/**
 *  K线图的X的View的高度
 */
#define Y_StockChartKLineTimeViewHeight 20

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
#define Y_StockChartScaleBound 0.03

/**
 *  K线的缩放因子
 */
#define Y_StockChartScaleFactor 0.03

/**
 *  UIScrollView的contentOffset属性
 */
#define Y_StockChartContentOffsetKey @"contentOffset"

/**
 *  时分线的宽度
 */
#define Y_StockChartTimeLineLineWidth 0.5

/**
 *  时分线图的Above上最小的X
 */
#define Y_StockChartTimeLineMainViewMinX 0.0

/**
 *  分时线的timeLabelView的高度
 */
#define Y_StockChartTimeLineTimeLabelViewHeight 19

/**
 *  时分线的成交量的线宽
 */
#define Y_StockChartTimeLineVolumeLineWidth 0.5

/**
 *  长按时的线的宽度
 */
#define Y_StockChartLongPressVerticalViewWidth 0.5

/**
 *  MA线的宽度
 */
#define Y_StockChartMALineWidth 0.8

/**
 *  上下影线宽度
 */
#define Y_StockChartShadowLineWidth 1
/**
 *  所有profileView的高度
 */
#define Y_StockChartProfileViewHeight 50

/**
 *  K线图上可画区域最小的Y
 */
#define Y_StockChartKLineMainViewMinY 20

/**
 *  K线图上可画区域最大的Y
 */
#define Y_StockChartKLineMainViewMaxY (self.frame.size.height - 15)

/**
 *  K线图的成交量上最小的Y
 */
#define Y_StockChartKLineVolumeViewMinY 20

/**
 *  K线图的成交量最大的Y
 */
#define Y_StockChartKLineVolumeViewMaxY (self.frame.size.height)

/**
 *  K线图的副图上最小的Y
 */
#define Y_StockChartKLineAccessoryViewMinY 20

/**
 *  K线图的副图最大的Y
 */
#define Y_StockChartKLineAccessoryViewMaxY (self.frame.size.height)

/**
 *  K线图的副图中间的Y
 */
//#define Y_StockChartKLineAccessoryViewMiddleY (self.frame.size.height-20)/2.f + 20
#define Y_StockChartKLineAccessoryViewMiddleY (maxY - (0.f-minValue)/unitValue)

/**
 *  时分线图的Above上最小的Y
 */
#define Y_StockChartTimeLineMainViewMinY 0

/**
 *  时分线图的Above上最大的Y
 */
#define Y_StockChartTimeLineMainViewMaxY (self.frame.size.height-Y_StockChartTimeLineTimeLabelViewHeight)


/**
 *  时分线图的Above上最大的Y
 */
#define Y_StockChartTimeLineMainViewMaxX (self.frame.size.width)

/**
 *  时分线图的Below上最小的Y
 */
#define Y_StockChartTimeLineVolumeViewMinY 0

/**
 *  时分线图的Below上最大的Y
 */
#define Y_StockChartTimeLineVolumeViewMaxY (self.frame.size.height)

/**
 *  时分线图的Below最大的X
 */
#define Y_StockChartTimeLineVolumeViewMaxX (self.frame.size.width)

/**
 * 时分线图的Below最小的X
 */
#define Y_StockChartTimeLineVolumeViewMinX 0

//Kline种类
typedef NS_ENUM(NSInteger, Y_StockChartCenterViewType) {
    Y_StockChartcenterViewTypeKline= 1, //K线
    Y_StockChartcenterViewTypeTimeLine,  //分时图
    Y_StockChartcenterViewTypeOther
};


//Accessory指标种类
typedef NS_ENUM(NSInteger, Y_StockChartTargetLineStatus) {
    Y_StockChartTargetLineStatusMACD = 100,    //MACD线
    Y_StockChartTargetLineStatusKDJ,    //KDJ线
    Y_StockChartTargetLineStatusAccessoryClose,    //关闭Accessory线
    Y_StockChartTargetLineStatusMA , //MA线
    Y_StockChartTargetLineStatusEMA,  //EMA线
    Y_StockChartTargetLineStatusBOLL,  //BOLL线
    Y_StockChartTargetLineStatusCloseMA  //MA关闭线

};
