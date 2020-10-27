//
//  YYVerticalTextPainter.m
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import "YYVerticalTextPainter.h"
#import "YYKlineGlobalVariable.h"
#import "UIColor+YYKline.h"

@implementation YYVerticalTextPainter
+ (void)drawToLayer:(CALayer *)layer area:(CGRect)area minMax: (YYMinMaxModel *)minMaxModel {
    CGFloat maxH = CGRectGetHeight(area);
    if (maxH <= 0) {
        return;
    }

    YYVerticalTextPainter *sublayer = [[YYVerticalTextPainter alloc] init];
    sublayer.frame = area;
    [layer addSublayer:sublayer];
    
    // 数字40只是一个magic数字，没啥特殊意义
    NSInteger count = maxH/40;
    count++;
    CGFloat lineH = [UIFont systemFontOfSize:12.f].lineHeight;
    CGFloat textGap = (maxH - lineH)/(count-1);
    CGFloat decimalGap = minMaxModel.distance / (count-1);
    
    for (int i = 0; i < count; i++) {
        CATextLayer *layer = [CATextLayer layer];
        CGFloat number = minMaxModel.max - i * decimalGap;
        NSString * text = @"";
        if (number >= 1e8) {
            text = [NSString stringWithFormat:@"%.2f亿", number/1e8];
        } else if (number >= 1e4) {
            text = [NSString stringWithFormat:@"%.2f万", number/1e4];
        } else if (number >= 10) {
            text = [NSString stringWithFormat:@"%.2f", number];
        } else {
            text = [NSString stringWithFormat:@"%.3f", number];
        }
        layer.string = text;
        layer.alignmentMode = kCAAlignmentCenter;
        layer.fontSize = 11.f;
        layer.foregroundColor = UIColor.grayColor.CGColor;
        layer.frame = CGRectMake(0, i*textGap, CGRectGetWidth(area), lineH);
        layer.contentsScale = UIScreen.mainScreen.scale;
        [sublayer addSublayer:layer];
    }
}
@end
