//
//  FihghtThemeCell.h
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class FightTeamCell;

@protocol FightTeamCellDelegate <NSObject>

- (void)didClickSortGameButton:(UIButton *)button;

@end

@interface FihghtThemeCell : UITableViewCell

@property (nonatomic, weak) id <FightTeamCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
