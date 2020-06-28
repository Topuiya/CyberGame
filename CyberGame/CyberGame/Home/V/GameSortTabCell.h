//
//  GameSortTabCell.h
//  CyberGame
//
//  Created by apple on 2020/6/5.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GameSortTabCell;

@protocol GameSortTabCellDelegate <NSObject>

- (void)didSelectedLolView;
- (void)didSelectedOwView;
- (void)didSelectedWzryView;
- (void)didSelectedPubgView;

@end

@interface GameSortTabCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *lolView;
@property (weak, nonatomic) IBOutlet UIView *owView;
@property (weak, nonatomic) IBOutlet UIView *wzryView;
@property (weak, nonatomic) IBOutlet UIView *pubgView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftWid;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightWid;

@property (nonatomic, weak) id <GameSortTabCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
