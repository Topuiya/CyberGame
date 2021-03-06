//
//  FightOtherCell.m
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FightOtherCell.h"
#import "FightDetailVC.h"

@implementation FightOtherCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //监听点击
    [self.phoneBtn addTarget:self action:@selector(didClickSortButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.emailBtn addTarget:self action:@selector(didClickSortButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.ruleBtn addTarget:self action:@selector(didClickSortButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.otherBtn addTarget:self action:@selector(didClickSortButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.sureBtn addTarget:self action:@selector(didClickSureBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didClickSortButton:(UIButton *)button {
    if([self.delegate respondsToSelector:@selector(didClickSortButton:)])
    {
        [self.delegate didClickSortButton:button];
    }
}

- (void)didClickSureBtn:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(didClickSureBtn:)]) {
        [self.delegate didClickSureBtn:button];
    }
}


@end
