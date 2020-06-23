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

@property (nonatomic, copy)void (^selectedMineHeadTableViewCellBlock)(void);

@end

NS_ASSUME_NONNULL_END
