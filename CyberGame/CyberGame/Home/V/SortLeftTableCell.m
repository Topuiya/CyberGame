//
//  SortLeftTableCell.m
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "SortLeftTableCell.h"

@implementation SortLeftTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setClubModel:(DJClubModel *)clubModel {
    _clubModel = clubModel;
    
    //设置图片
    NSURL *picURL = [NSURL URLWithString:clubModel.pic];
    [self.picImageView sd_setImageWithURL:picURL];
    self.nameLabel.text = clubModel.name;
}

@end
