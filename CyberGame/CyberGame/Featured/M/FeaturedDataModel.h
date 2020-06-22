//
//  FeaturedDataModel.h
//  CyberGame
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "BaseModel.h"
#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeaturedDataModel : BaseModel

//内容
@property (nonatomic, copy)NSString *content;
//主图
@property (nonatomic, copy)NSString *picture;

@property (nonatomic, strong)UserInfoModel *user;

@end

NS_ASSUME_NONNULL_END
