//
//  FihghtThemeCell.h
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FihghtThemeCell : UITableViewCell

@property (nonatomic, copy)void (^didClickSortGameButtonBlock)(NSInteger btnTag);

@end

NS_ASSUME_NONNULL_END
