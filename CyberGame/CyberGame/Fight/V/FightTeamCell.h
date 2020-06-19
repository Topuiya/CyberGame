//
//  FightTeamCell.h
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankTeamListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FightTeamCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconLImageView;
@property (weak, nonatomic) IBOutlet UITextField *leftTextF;

@property (weak, nonatomic) IBOutlet UIImageView *iconCImageView;
@property (weak, nonatomic) IBOutlet UITextField *centerTextF;


@property (weak, nonatomic) IBOutlet UIImageView *iconRImageView;
@property (weak, nonatomic) IBOutlet UITextField *rightTextF;

@property (nonatomic, strong)RankTeamListModel *model;

@end

NS_ASSUME_NONNULL_END
