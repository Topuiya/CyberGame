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
    _team1.text = fightModel.fightTeam1;
    _team2.text = fightModel.fightTeam2;
    
    NSString *leftTimeStr = [fightModel.publishTime substringToIndex:11];
    _timeRightLabel.text = [NSString stringWithFormat:@"%@时",fightModel.publishTime];
    _timeLeftLbael.text = leftTimeStr;
    
    if (_selectedMyFightVCBlock) {
        _selectedMyFightVCBlock(fightModel);
    }
}

@end
