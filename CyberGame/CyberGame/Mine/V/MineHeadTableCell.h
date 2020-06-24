//
//  MineHeadTableCell.h
//  CyberGame
//
//  Created by apple on 2020/6/23.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MineHeadTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *attentionLabel;
@property (weak, nonatomic) IBOutlet UILabel *historyLabel;
@property (weak, nonatomic) IBOutlet UILabel *reservationLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idnumLabel;
@property (weak, nonatomic) IBOutlet UIView *idView;

@property (nonatomic, copy)void (^selectedMineHeadTableViewCellBlock)(void);
@property (nonatomic, copy)void (^selectedMineIDViewCellBlock)(void);

@end

NS_ASSUME_NONNULL_END
