//
//  YYKlineGlobalVariable.h
//  YYKline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKlineConstant.h"
@interface YYKlineGlobalVariable : NSObject

/**
 *  K线图的宽度，默认20
 */
+ (CGFloat)kLineWidth;

+ (void)setkLineWith:(CGFloat)kLineWidth;

/**
 *  K线图的间隔，默认1
 */
+ (CGFloat)kLineGap;

+ (void)setkLineGap:(CGFloat)kLineGap;

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

@end
