//
//  YYKlineGlobalVariable.m
//  YYKline
//
//  Copyright © 2016年 WillkYang. All rights reserved.
//
#import "YYKlineGlobalVariable.h"

/**
 *  K线图的宽度，默认20
 */
static CGFloat kYYKlineLineWidth = 2;

/**
 *  K线图的间隔，默认1
 */
static CGFloat kYYKlineLineGap = 1;


/**
 *  MainView的高度占比,默认为0.5
 */
static CGFloat kYYKlineMainViewRadio = 0.5;

/**
 *  VolumeView的高度占比,默认为0.5
 */
static CGFloat kYYKlineVolumeViewRadio = 0.2;


@implementation YYKlineGlobalVariable

/**
 *  K线图的宽度，默认20
 */
+ (CGFloat)kLineWidth {
    return kYYKlineLineWidth;
}

+ (void)setkLineWith:(CGFloat)kLineWidth {
    if (kLineWidth > YYKlineLineMaxWidth) {
        kLineWidth = YYKlineLineMaxWidth;
    }else if (kLineWidth < YYKlineLineMinWidth){
        kLineWidth = YYKlineLineMinWidth;
    }
    kYYKlineLineWidth = kLineWidth;
}


/**
 *  K线图的间隔，默认1
 */
+ (CGFloat)kLineGap {
    return kYYKlineLineGap;
}

+ (void)setkLineGap:(CGFloat)kLineGap {
    kYYKlineLineGap = kLineGap;
}

/**
 *  MainView的高度占比,默认为0.5
 */
+ (CGFloat)kLineMainViewRadio {
    return kYYKlineMainViewRadio;
}

+ (void)setkLineMainViewRadio:(CGFloat)radio {
    kYYKlineMainViewRadio = radio;
}

/**
 *  VolumeView的高度占比,默认为0.2
 */
+ (CGFloat)kLineVolumeViewRadio {
    return kYYKlineVolumeViewRadio;
}

+ (void)setkLineVolumeViewRadio:(CGFloat)radio {
    kYYKlineVolumeViewRadio = radio;
}

@end
