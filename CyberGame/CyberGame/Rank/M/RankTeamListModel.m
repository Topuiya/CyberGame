//
//  RankTeamListModel.m
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "RankTeamListModel.h"
#import <MJExtension/MJExtension.h>
#import "RankListModel.h"

@implementation RankTeamListModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list": [RankListModel class]};
}

@end
