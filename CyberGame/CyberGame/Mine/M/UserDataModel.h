//
//  UserDataModel.h
//  CyberGame
//
//  Created by apple on 2020/6/22.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "BaseModel.h"
#import "FightDataModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserDataModel : BaseModel

@property (nonatomic, strong) FightDataModel *fightModel;
@property (nonatomic, strong) NSArray *fightArray;

@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *pwd;
//点赞
@property (nonatomic, strong) NSNumber *like;
//关注
@property (nonatomic, strong) NSNumber *focus;
//足迹
@property (nonatomic, strong) NSNumber *history;
//预约
@property (nonatomic, strong) NSNumber *reservation;
//我的收藏
@property (nonatomic, strong) NSNumber *collection;

@end

NS_ASSUME_NONNULL_END
