//
//  Y-KLineGroupModel.m
//  BTC-Kline
//
//  Created by yate1996 on 16/4/28.
//  Copyright © 2016年 yate1996. All rights reserved.
//

#import "Y_KLineGroupModel.h"
#import "Y_KLineModel.h"
@implementation Y_KLineGroupModel
+ (instancetype) objectWithArray:(NSArray *)arr {
    
    NSAssert([arr isKindOfClass:[NSArray class]], @"arr不是一个数组");
    
    Y_KLineGroupModel *groupModel = [Y_KLineGroupModel new];
    NSMutableArray *mutableArr = @[].mutableCopy;
    __block Y_KLineModel *preModel = [[Y_KLineModel alloc]init];
    
    //设置数据 1或2 选择一个即可
    // 数组类型的源数据
    for (NSArray *item in arr)
    {
        Y_KLineModel *model = [Y_KLineModel new];
        model.PreviousKlineModel = preModel;
        [model initWithArray:item];
        model.ParentGroupModel = groupModel;
        [mutableArr addObject:model];

        preModel = model;
    }
    
    // 字典类型的源数据
//    for (NSDictionary *dict in arr)
//    {
//        Y_KLineModel *model = [Y_KLineModel new];
//        model.PreviousKlineModel = preModel;
//        [model initWithDict:dict];
//        model.ParentGroupModel = groupModel;
//
//        [mutableArr addObject:model];
//
//        preModel = model;
//    }
    
    groupModel.models = mutableArr;
    
    //初始化第一个Model的数据
    Y_KLineModel *firstModel = mutableArr[0];
    [firstModel initFirstModel];
    
    //初始化其他Model的数据
    [mutableArr enumerateObjectsUsingBlock:^(Y_KLineModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        [model initData];
    }];

    return groupModel;
}
@end
