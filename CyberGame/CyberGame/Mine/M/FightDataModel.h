//
//  fightInfoModel.h
//  CyberGame
//
//  Created by apple on 2020/6/22.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "BaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FightDataModel : BaseModel

//约战主题
@property (nonatomic, copy) NSString *fightSort;
//发布时间
@property (nonatomic, copy) NSString *publishTime;
//时间
@property (nonatomic, copy) NSString *time;
//赛制
@property (nonatomic, copy) NSString *fightRule;
//战队添加
@property (nonatomic, copy) NSString *fightTeam;
//其他
@property (nonatomic, copy) NSString *fightOther;

@end

NS_ASSUME_NONNULL_END
