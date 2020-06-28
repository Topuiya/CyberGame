//
//  SortRightTableCell.m
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "SortRightTableCell.h"

@implementation SortRightTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setClubModel:(DJClubModel *)clubModel {
    _clubModel = clubModel;
    
    NSURL *picURL = [NSURL URLWithString:clubModel.pic];
    [self.picImageView sd_setImageWithURL:picURL];
    self.nameLabel.text = clubModel.name;
    self.addressLabel.text = clubModel.address;
    if (clubModel.isHot == NO) {
        self.hotImage.hidden = NO;
    }
    else {
        self.hotImage.hidden = YES;
    }
    
}

@end
