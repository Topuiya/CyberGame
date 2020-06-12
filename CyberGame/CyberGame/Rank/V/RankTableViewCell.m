//
//  RankTableViewCell.m
//  CyberGame
//
//  Created by apple on 2020/6/10.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "RankTableViewCell.h"
#import "UIColor+Hex.h"

@implementation RankTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // 除排名之外的字体颜色:  #BB94F2
    self.teamName.textColor = [UIColor colorWithHexString:@"#BB94F2"];
    self.winLabel.textColor = [UIColor colorWithHexString:@"#BB94F2"];
    self.loseLabel.textColor = [UIColor colorWithHexString:@"#BB94F2"];
    self.scoreLabel.textColor = [UIColor colorWithHexString:@"#BB94F2"];
    //排名按钮
    self.numBtn.tintColor = [UIColor colorWithHexString:@"#999999"];
    self.numBtn.enabled = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
