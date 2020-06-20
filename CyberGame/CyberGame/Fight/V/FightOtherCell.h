//
//  FightOtherCell.h
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FightOtherCell;

@protocol FightOtherCellDelegate <NSObject>

- (void)didClickSortButton:(UIButton *)button;

@end

@interface FightOtherCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;
@property (weak, nonatomic) IBOutlet UIButton *emailBtn;
@property (weak, nonatomic) IBOutlet UIButton *ruleBtn;
@property (weak, nonatomic) IBOutlet UIButton *otherBtn;

@property (nonatomic, weak) id <FightOtherCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
