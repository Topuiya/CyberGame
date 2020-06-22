//
//  FeaturedTableViewCell.h
//  CyberGame
//
//  Created by apple on 2020/6/10.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FeaturedDataModel.h"
#import "UserInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FeaturedTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nickNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *labelWidth;

@property (strong, nonatomic) FeaturedDataModel *featuredDataModel;
@end

NS_ASSUME_NONNULL_END
