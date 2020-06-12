//
//  LscsVC.h
//  CyberGame
//
//  Created by apple on 2020/6/6.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "ContentBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class RankTeamListModel;
@interface LolVC : ContentBaseViewController <JXCategoryListContentViewDelegate>

@property (nonatomic, strong)RankTeamListModel *LscsModel;

@end

NS_ASSUME_NONNULL_END
