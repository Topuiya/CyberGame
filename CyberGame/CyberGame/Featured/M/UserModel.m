//
//  UserModel.m
//  CyberGame
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "DataUserModel.h"

@implementation DataUserModel

+ (NSDictionary*) JSONKeyPathsByPropertyKey{
    return @{
        NSStringFromSelector(@selector(head)):@"head",
        NSStringFromSelector(@selector(nickName)):@"nickName",
        NSStringFromSelector(@selector(uesrId)):@"uesrId",
        NSStringFromSelector(@selector(publishTime)):@"publishTime",
    };
}

@end
