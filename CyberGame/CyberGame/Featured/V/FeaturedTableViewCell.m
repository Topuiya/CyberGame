//
//  FeaturedTableViewCell.m
//  CyberGame
//
//  Created by apple on 2020/6/10.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FeaturedTableViewCell.h"
#import <SDWebImage.h>

@implementation FeaturedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    if (SCREEN_WIDTH == 375) {
        _labelWidth.constant = 55;
    }else {
        _labelWidth.constant = 15;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFeaturedDataModel:(FeaturedDataModel *)featuredDataModel {
    UserModel *userModel = featuredDataModel.user;
    
    if (featuredDataModel.content != nil) {
        self.contentLabel.text = featuredDataModel.content;
        
        //截取掉下标26之前的字符串
        NSString *str1 = [featuredDataModel.content substringToIndex:26];
        self.titleLabel.text = str1;
    }
    if (featuredDataModel.picture != nil) {
        //设置图片,取第一张图片为主图
        NSString *picURL = [featuredDataModel.picture componentsSeparatedByString:@","][0];
        [self.picImageView sd_setImageWithURL:[NSURL URLWithString:picURL]];
    }
    if (userModel.head != nil) {
        NSURL *headURL = [NSURL URLWithString:userModel.head];
        [self.headImageView sd_setImageWithURL:headURL];
    }
    if (userModel.nickName != nil) {
        self.nickNameLabel.text = userModel.nickName;
    }
}

@end
