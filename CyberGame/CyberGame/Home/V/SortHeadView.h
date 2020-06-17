//
//  SortHeadView.h
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SortHeadView : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rightImageView;
/** 临时按钮(用来记录哪个按钮为选中状态) */
@property (nonatomic, weak) UIButton *tempBtn;

@property (nonatomic, copy)void (^selectedLeftHeadBlock)(void);
@property (nonatomic, copy)void (^selectedRightHeadBlock)(void);

@end

NS_ASSUME_NONNULL_END
