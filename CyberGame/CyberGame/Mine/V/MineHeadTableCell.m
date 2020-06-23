//
//  MineHeadTableCell.m
//  CyberGame
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "MineHeadTableCell.h"

@implementation MineHeadTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.userImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *userTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapUserImageView)];
    [self.userImageView addGestureRecognizer:userTap];
}

- (void)didTapUserImageView {
    if (_selectedMineHeadTableViewCellBlock) {
        _selectedMineHeadTableViewCellBlock();
    }
}

@end
