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

//约战主题(tag)
@property (nonatomic, assign)NSInteger fightSortTag;
//发布时间
@property (nonatomic, copy) NSString *publishTime;
//赛制
@property (nonatomic, copy) NSString *fightRule;
//战队添加
@property (nonatomic, copy) NSString *fightTeam1;
@property (nonatomic, copy) NSString *fightTeamImg1;
@property (nonatomic, copy) NSString *fightTeam2;
@property (nonatomic, copy) NSString *fightTeamImg2;
//其他
@property (nonatomic, copy) NSString *otherPhone;
@property (nonatomic, copy) NSString *otherEmail;
@property (nonatomic, copy) NSString *otherRule;
@property (nonatomic, copy) NSString *otherInfo;

@end

NS_ASSUME_NONNULL_END
