//
//  userLocalData.h
//  CyberGame
//
//  Created by apple on 2020/6/22.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "BaseModel.h"
#import "useModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface
aseModel

@property (assign, nonatomic, getter=isLogin) BOOL login;
@property (nonatomic, strong) useModel *userModel;
@property (nonatomic, strong) NSMutableArray *localModelArray;

@end

NS_ASSUME_NONNULL_END
