//
//  MyFightTableCell.m
//  CyberGame
//
//  Created by apple on 2020/6/20.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "MyFightTableCell.h"

@implementation MyFightTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"box"]];
    self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"box"]];
}

- (void)setFightModel:(FightDataModel *)fightModel {
    _fightModel = fightModel;
    
    
    _leftImage.image = [UIImage imageNamed:fightModel.fightTeamImg1];
    _rightImage.image = [UIImage imageNamed:fightModel.fightTeamImg2];
    _timeLeftLbael.text = fightModel.fightTeam1;
    _timeRightLabel.text = fightModel.fightTeam2;
    
    _timeRightLabel.text = fightModel.publishTime;
    _timeLeftLbael.text = fightModel.publishTime;
    
}

@end
