//
//  BannerCollectionViewCell.m
//  CyberGame
//
//  Created by apple on 2020/6/5.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "BannerCollectionViewCell.h"
#import "HomeBannerDataM.h"

@interface BannerCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImgName;

@end

@implementation BannerCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setBannerModel:(HomeBannerDataM *)bannerModel {
    _bannerModel = bannerModel;
    self.avatarImgName.image = [UIImage imageNamed:bannerModel.avatarImgName];
    self.label.text = bannerModel.name;
}

@end
