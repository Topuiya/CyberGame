//
//  ClickBtnCell.m
//  CyberGame
//
//  Created by apple on 2020/6/20.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "ClickBtnCell.h"

@implementation ClickBtnCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.sureBtn addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sureButtonClick:(UIButton *)button {
    if (_selectedClickButtonBlock) {
        _selectedClickButtonBlock();
    }
}

@end
