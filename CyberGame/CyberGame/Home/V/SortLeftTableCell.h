//
//  SortLeftTableCell.h
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJClubModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SortLeftTableCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (nonatomic, strong) DJClubModel *clubModel;

@end

NS_ASSUME_NONNULL_END
