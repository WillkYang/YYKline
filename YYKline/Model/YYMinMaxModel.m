//
//  YYMinMaxModel.m
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import "YYMinMaxModel.h"

@implementation YYMinMaxModel

+ (instancetype)modelWithMin:(CGFloat)min max:(CGFloat)max {
    YYMinMaxModel *m = [YYMinMaxModel new];
    m.min = min;
    m.max = max;
    return m;
}

- (CGFloat)distance {
    return self.max - self.min;
}


- (void)combine: (YYMinMaxModel *)m {
    self.min = MIN(self.min, m.min);
    self.max = MAX(self.max, m.max);
}

@end
