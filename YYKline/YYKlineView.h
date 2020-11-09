//
//  YYKlineView.h
//  YYKline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKlineConstant.h"
#import "YYKlineModel.h"
#import "YYKlineRootModel.h"
#import "YYPainterProtocol.h"

@interface YYKlineView : UIView

@property(nonatomic, strong) YYKlineRootModel *rootModel; // 数据

@property (nonatomic) Class <YYPainterProtocol> linePainter;
@property (nonatomic) Class <YYPainterProtocol> indicator1Painter;
@property (nonatomic) Class <YYPainterProtocol> indicator2Painter;

- (void)reDraw; // 重绘
@end
