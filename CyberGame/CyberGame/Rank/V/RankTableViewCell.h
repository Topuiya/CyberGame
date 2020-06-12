//
//  RankTableViewCell.h
//  CyberGame
//
//  Created by apple on 2020/6/10.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RankTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *numBtn;

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *teamName;
@property (weak, nonatomic) IBOutlet UILabel *winLabel;
@property (weak, nonatomic) IBOutlet UILabel *loseLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;


@end

NS_ASSUME_NONNULL_END
