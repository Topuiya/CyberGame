//
//  BannerCollectionViewCell.h
//  CyberGame
//
//  Created by apple on 2020/6/5.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class HomeBannerDataM;

@interface BannerCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic)HomeBannerDataM *bannerModel;

@end

NS_ASSUME_NONNULL_END
