//
//  YYMinMaxModel.h
//  YYKline
//
//  Copyright © 2019 WillkYang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YYMinMaxModel : NSObject

@property (nonatomic, assign) CGFloat min;
@property (nonatomic, assign) CGFloat max;

- (CGFloat)distance;

+ (instancetype)modelWithMin:(CGFloat)min max:(CGFloat)max;

- (void)combine: (YYMinMaxModel *)m;

@end

NS_ASSUME_NONNULL_END
