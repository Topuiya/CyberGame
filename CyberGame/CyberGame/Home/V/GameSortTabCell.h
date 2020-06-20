//
//  GameSortTabCell.h
//  CyberGame
//
//  Created by apple on 2020/6/5.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GameSortTabCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *lolView;
@property (weak, nonatomic) IBOutlet UIView *owView;
@property (weak, nonatomic) IBOutlet UIView *wzryView;
@property (weak, nonatomic) IBOutlet UIView *pubgView;


@property (nonatomic, copy)void (^selectedLolViewBlock)(void);
@property (nonatomic, copy)void (^selectedOwViewBlock)(void);
@property (nonatomic, copy)void (^selectedWzryViewBlock)(void);
@property (nonatomic, copy)void (^selectedPubgViewBlock)(void);

@end

NS_ASSUME_NONNULL_END
