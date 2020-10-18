## YYKline


[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)]() &nbsp;
[![Support](https://img.shields.io/badge/support-iOS7.0+-blue.svg?style=flat)]() &nbsp;
[![Support](https://img.shields.io/badge/support-Autolayout-orange.svg?style=flatt)]() &nbsp;

## 介绍
- [x] 支持MA、EMA、BOLL、KDJ、MACD、RSI、WR等技术指标，支持更多指标扩展
- [x] 支持运行于iOS、MacOS上
- [x] OC开发，如需Swift可直接翻译

## 图表示例

| 普通K线+MACD | 分时图+MACD
|------------|------------
| ![普通K线+MACD](https://github.com/WillkYang/Y_KLine/blob/master/Screenshot/MACD.png?raw=true) |![分时图+MACD](https://github.com/WillkYang/Y_KLine/blob/master/Screenshot/MACD.png?raw=true)
| 普通K线+KDJ | 分时图
| ![普通K线+KDJ](https://github.com/WillkYang/Y_KLine/blob/master/Screenshot/KDJ.png?raw=true) |![分时图](https://github.com/WillkYang/Y_KLine/blob/master/Screenshot/Timeline.png?raw=true)
| 更多指标 | 综合演示
| ![更多指标](https://github.com/WillkYang/Y_KLine/blob/master/Screenshot/More.png?raw=true) |![综合演示](https://github.com/WillkYang/Y_KLine/blob/master/Screenshot/record.gif?raw=true)

## 集成方法
1. 下载Demo项目，将Y_Kline文件夹拖入需要的工程中
2. 参考Demo，将YYKlineView添加到需要展示的view即可，其他部分(如指标)可参考Demo中Y_StockChartView进行配置。

### 自定义指标
1. 实现YYPainterProtocol，可参考Painter文件夹下的其他已有指标。
```objc
@protocol YYPainterProtocol <NSObject>
// 绘制
+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area models:(NSArray <YYKlineModel *> *)models minMax: (YYMinMaxModel *)minMaxModel;
// 获取边界值
+ (YYMinMaxModel *)getMinMaxValue:(NSArray <YYKlineModel *> *)data;
@end
```

2. 以绘制KDJ图为例，新建YYKDJPainter，实现YYPainterProtocol

```objc
+ (YYMinMaxModel *)getMinMaxValue:(NSArray <YYKlineModel *> *)data {
    if(!data) {
        return [YYMinMaxModel new];
    }
    __block CGFloat minAssert = 999999999999.f;
    __block CGFloat maxAssert = 0.f;
    [data enumerateObjectsUsingBlock:^(YYKlineModel * _Nonnull m, NSUInteger idx, BOOL * _Nonnull stop) {
        maxAssert = MAX(maxAssert, MAX(m.KDJ.J.floatValue, MAX(m.KDJ.K.floatValue, m.KDJ.D.floatValue)));
        minAssert = MIN(minAssert, MIN(m.KDJ.J.floatValue, MIN(m.KDJ.K.floatValue, m.KDJ.D.floatValue)));
    }];
    return [YYMinMaxModel modelWithMin:minAssert max:maxAssert];
}

+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area models:(NSArray <YYKlineModel *> *)models minMax: (YYMinMaxModel *)minMaxModel {
    if(!models) {
        return;
    }
    CGFloat maxH = CGRectGetHeight(area);
    CGFloat unitValue = maxH/minMaxModel.distance;
    
    YYKDJPainter *sublayer = [[YYKDJPainter alloc] init];
    sublayer.frame = area;
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    UIBezierPath *path3 = [UIBezierPath bezierPath];
    [models enumerateObjectsUsingBlock:^(YYKlineModel * _Nonnull m, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat w = [Y_StockChartGlobalVariable kLineWidth];
        CGFloat x = idx * (w + [Y_StockChartGlobalVariable kLineGap]);
        CGPoint point1 = CGPointMake(x+w/2, maxH - (m.KDJ.K.floatValue - minMaxModel.min)*unitValue);
        CGPoint point2 = CGPointMake(x+w/2, maxH - (m.KDJ.D.floatValue - minMaxModel.min)*unitValue);
        CGPoint point3 = CGPointMake(x+w/2, maxH - (m.KDJ.J.floatValue - minMaxModel.min)*unitValue);
        if (idx == 0) {
            [path1 moveToPoint:point1];
            [path2 moveToPoint:point2];
            [path3 moveToPoint:point3];
        } else {
            [path1 addLineToPoint:point1];
            [path2 addLineToPoint:point2];
            [path3 addLineToPoint:point3];
        }
    }];
    
    {
        CAShapeLayer *l = [CAShapeLayer layer];
        l.path = path1.CGPath;
        l.lineWidth = Y_StockChartLineWidth;
        l.strokeColor = UIColor.line1Color.CGColor;
        l.fillColor =   [UIColor clearColor].CGColor;
        [sublayer addSublayer:l];
    }
    {
        CAShapeLayer *l = [CAShapeLayer layer];
        l.path = path2.CGPath;
        l.lineWidth = Y_StockChartLineWidth;
        l.strokeColor = UIColor.line2Color.CGColor;
        l.fillColor =   [UIColor clearColor].CGColor;
        [sublayer addSublayer:l];
    }
    {
        CAShapeLayer *l = [CAShapeLayer layer];
        l.path = path3.CGPath;
        l.lineWidth = Y_StockChartLineWidth;
        l.strokeColor = UIColor.line3Color.CGColor;
        l.fillColor =   [UIColor clearColor].CGColor;
        [sublayer addSublayer:l];
    }
    [layer addSublayer:sublayer];
}
```
3. 实现对应的Model，参考YYIndicatorModel，计算指标数据
4. 在Y_StockChartView.m中加上该Painter对应的case
```objc
- (void)y_StockChartSegmentView:(Y_StockChartSegmentView *)segmentView clickSegmentButtonIndex:(NSInteger)index {
    ...
    case YYKlineIncicatorKDJ:
        self.kLineView.indicator2Painter = YYKDJPainter.class;
        break;
    ...
}
```
5. 运行查看效果

### 加群讨论更多：755873102

感谢[@牛眼行情](https://niuyan.com)的K线数据源。

