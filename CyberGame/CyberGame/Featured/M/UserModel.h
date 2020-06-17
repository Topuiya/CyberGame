//
//  UserModel.h
//  CyberGame
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : BaseModel

@property (nonatomic, copy)NSString *head;
@property (nonatomic, copy)NSString *nickName;
//用户id
@property (nonatomic, assign)NSNumber *uesrId;
//发表时间
@property (nonatomic, strong)NSDate *publishTime;
@end

NS_ASSUME_NONNULL_END
