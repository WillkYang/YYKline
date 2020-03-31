//
//  Y_KLineView.h
//  Y_Kline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Y_StockChartConstant.h"
#import "YYKlineModel.h"
#import "Y_KLineRootModel.h"
#import "YYPainter.h"
@interface Y_KLineView : UIView

@property(nonatomic, strong) Y_KLineRootModel *rootModel; // 数据

@property (nonatomic) Class <YYPainterProtocol> linePainter;
@property (nonatomic) Class <YYPainterProtocol> indicator1Painter;
@property (nonatomic) Class <YYPainterProtocol> indicator2Painter;

- (void)reDraw; // 重绘
@end
