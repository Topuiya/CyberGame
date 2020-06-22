//
//  FeaturedDataModel.m
//  CyberGame
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FeaturedDataModel.h"
#import "UserInfoModel.h"

@implementation FeaturedDataModel
//内容
//@property (nonatomic, copy)NSString *content;
////主图
//@property (nonatomic, copy)NSString *picture;
////发表时间
//@property (nonatomic, strong)NSDate *publishTime;
////头像
//@property (nonatomic, copy)NSString *head;
////昵称
//@property (nonatomic, copy)NSString *nickName;
+ (NSDictionary *) JSONKeyPathsByPropertyKey {
    return @{
        NSStringFromSelector(@selector(content)):@"content",
        NSStringFromSelector(@selector(picture)):@"picture",
        NSStringFromSelector(@selector(user)):@"user",
    };
}

+ (NSValueTransformer *)userJSONTransformer {
    return [MTLValueTransformer transformerUsingForwardBlock:^id(id value, BOOL *success, NSError *__autoreleasing *error) {
        NSError *newError;
        UserInfoModel *model = [MTLJSONAdapter modelOfClass:[UserInfoModel class] fromJSONDictionary:value error:&newError];
        return model;
    }];
}

@end
