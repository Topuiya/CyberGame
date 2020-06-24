//
//  MyFightTableCell.h
//  CyberGame
//
//  Created by apple on 2020/6/20.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyFightTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *timeLeftLbael;
@property (weak, nonatomic) IBOutlet UILabel *timeRightLabel;
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UIImageView *rightImage;
@property (weak, nonatomic) IBOutlet UILabel *leftNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightNameLabel;

@property (nonatomic, strong) FightDataModel *fightModel;

@end

NS_ASSUME_NONNULL_END
