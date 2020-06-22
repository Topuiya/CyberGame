//
//  userLocalData.h
//  CyberGame
//
//  Created by apple on 2020/6/22.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "BaseModel.h"
#import "UserDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LocalData : BaseModel

@property (assign, nonatomic, getter=isLogin) BOOL login;
@property (nonatomic, strong) UserDataModel *userModel;
@property (nonatomic, strong) NSArray *localModelArray;

@end

NS_ASSUME_NONNULL_END
