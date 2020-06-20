//
//  FightRuleDetailCell.m
//  CyberGame
//
//  Created by apple on 2020/6/20.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FightRuleDetailCell.h"
#import "UIColor+Hex.h"

@implementation FightRuleDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.detailTextV.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
    self.detailTextV.tintColor = [UIColor colorWithHexString:@"#999999"];
}

@end
