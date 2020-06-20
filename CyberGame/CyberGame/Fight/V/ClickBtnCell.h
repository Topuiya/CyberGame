//
//  ClickBtnCell.h
//  CyberGame
//
//  Created by apple on 2020/6/20.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ClickBtnCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@property (nonatomic, copy)void (^selectedClickButtonBlock)(void);

@end

NS_ASSUME_NONNULL_END
