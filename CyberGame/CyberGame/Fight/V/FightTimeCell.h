//
//  FightTimeCell.h
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FightInfoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FightTimeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *downImageView;
@property (weak, nonatomic) IBOutlet UITextField *dateTextF;
@property (nonatomic, strong) FightInfoModel  *model;

@property (nonatomic, copy)void (^selectedTimeBlock)(NSString *timeStr);
@end

NS_ASSUME_NONNULL_END
