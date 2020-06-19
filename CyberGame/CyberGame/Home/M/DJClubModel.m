//
//  DJClubModel.m
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "DJClubModel.h"

@implementation DJClubModel

+ (instancetype)djWithDict:(NSDictionary *)dict {
    DJClubModel *djModel = [DJClubModel new];
    djModel.address = dict[@"address"];
    djModel.name = dict[@"name"];
    djModel.pic = dict[@"pic"];
    djModel.star = dict[@"star"];
    
    return djModel;
}

@end
