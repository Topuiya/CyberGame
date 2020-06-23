//
//  MineTableCell.m
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "MineTableCell.h"
#import "MineTableCellModel.h"

@implementation MineTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(MineTableCellModel *)model
{
    _model = model;
    
    self.title.text = model.titleStr;
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.ortherLbael.text = model.textStr;
}

@end
