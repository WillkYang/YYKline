//
//  Y_StockChartRightYView.m
//  BTC-Kline
//
//  Created by yate1996 on 16/5/3.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_StockChartRightYView.h"
#import "UIColor+Y_StockChart.h"
#import "Masonry.h"

@interface Y_StockChartRightYView ()

@property(nonatomic,strong) UILabel *maxValueLabel;

@property(nonatomic,strong) UILabel *middleValueLabel;

@property(nonatomic,strong) UILabel *minValueLabel;

@end


@implementation Y_StockChartRightYView

-(void)setMaxValue:(CGFloat)maxValue
{
    _maxValue = maxValue;
    self.maxValueLabel.text = [NSString stringWithFormat:@"%.2f",maxValue];
}

-(void)setMiddleValue:(CGFloat)middleValue
{
    _middleValue = middleValue;
    self.middleValueLabel.text = [NSString stringWithFormat:@"%.2f",middleValue];
}

-(void)setMinValue:(CGFloat)minValue
{
    _minValue = minValue;
    self.minValueLabel.text = [NSString stringWithFormat:@"%.2f",minValue];
}

-(void)setMinLabelText:(NSString *)minLabelText
{
    _minLabelText = minLabelText;
    self.minValueLabel.text = minLabelText;
}

#pragma mark - get方法
#pragma mark maxPriceLabel的get方法
-(UILabel *)maxValueLabel
{
    if (!_maxValueLabel) {
        _maxValueLabel = [self private_createLabel];
        [self addSubview:_maxValueLabel];
        [_maxValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.width.equalTo(self);
            make.height.equalTo(@20);
        }];
    }
    return _maxValueLabel;
}

#pragma mark middlePriceLabel的get方法
-(UILabel *)middleValueLabel
{
    if (!_middleValueLabel) {
        _middleValueLabel = [self private_createLabel];
        [self addSubview:_middleValueLabel];
        [_middleValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.right.equalTo(self);
            make.height.width.equalTo(self.maxValueLabel);
        }];
    }
    return _middleValueLabel;
}

#pragma mark minPriceLabel的get方法
-(UILabel *)minValueLabel
{
    if (!_minValueLabel) {
        _minValueLabel = [self private_createLabel];
        [self addSubview:_minValueLabel];
        [_minValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(self);
            make.height.width.equalTo(self.maxValueLabel);
        }];
    }
    return _minValueLabel;
}

#pragma mark - 私有方法
#pragma mark 创建Label
- (UILabel *)private_createLabel
{
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor assistTextColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.adjustsFontSizeToFitWidth = YES;
    [self addSubview:label];
    return label;
}
@end
