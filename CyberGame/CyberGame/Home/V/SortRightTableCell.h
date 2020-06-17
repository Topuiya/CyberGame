//
//  SortRightTableCell.h
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SortRightTableCell : UITableViewCell
//@property (nonatomic, assign)NSNumber *star;
//@property (nonatomic, assign)Boolean hot;
//@property (nonatomic, copy)NSString *address;
//@property (nonatomic, copy)NSString *pic;
//@property (nonatomic, copy)NSString *name;


@property (weak, nonatomic) IBOutlet UIImageView *picImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UIImageView *hotImage;


@end

NS_ASSUME_NONNULL_END
