//
//  FightTeamCell.m
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FightTeamCell.h"
#import <BRPickerView/BRPickerView.h>
#import <MJExtension/MJExtension.h>
#import "RankTeamListModel.h"
#import "RankListModel.h"

@interface FightTeamCell ()

@property (nonatomic, strong)NSMutableArray *nameArray;
@property (nonatomic, strong)NSMutableArray *imageArray;

@end

@implementation FightTeamCell

- (void)awakeFromNib {
    [super awakeFromNib];
    //左边图片点击
    _iconLImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *iconTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapIconImageView)];
    [_iconLImageView addGestureRecognizer:iconTap];
    self.nameArray = [NSMutableArray array];
    self.imageArray = [NSMutableArray array];
    
    //中间图片点击
//    _iconCImageView.userInteractionEnabled = YES;
    
}

- (void)didTapIconImageView {
    NSArray *nameListArr = _model.list;
    for (RankListModel *rankListModel in nameListArr) {
        [self.nameArray addObject:rankListModel.teamName];
        [self.imageArray addObject:rankListModel.iconName];
    }
    
    BRStringPickerView *stringPickerView = [[BRStringPickerView alloc]init];
    stringPickerView.pickerMode = BRStringPickerComponentSingle;
    stringPickerView.title = @"添加战队";
    stringPickerView.dataSourceArr = self.nameArray;
    stringPickerView.resultModelBlock = ^(BRResultModel * _Nullable resultModel) {
        self.leftTextF.text = resultModel.value;
        self.iconLImageView.image = [UIImage imageNamed:self.imageArray[resultModel.index]];
        //左边有值才能点击
        if (self.leftTextF.text.length > 1) {
            self.iconCImageView.userInteractionEnabled = YES;
            UITapGestureRecognizer *centerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(centerImageViewTap)];
            [self.iconCImageView addGestureRecognizer:centerTap];

            self.iconCImageView.image = [UIImage imageNamed:@"ic_add can"];
        }
    };
    [stringPickerView show];
}

- (void)centerImageViewTap {
    NSArray *nameListArr = _model.list;
    for (RankListModel *rankListModel in nameListArr) {
        [self.nameArray addObject:rankListModel.teamName];
        [self.imageArray addObject:rankListModel.iconName];
    }
    
    BRStringPickerView *stringPickerView = [[BRStringPickerView alloc]init];
    stringPickerView.pickerMode = BRStringPickerComponentSingle;
    stringPickerView.title = @"添加战队";
    stringPickerView.dataSourceArr = self.nameArray;
    stringPickerView.resultModelBlock = ^(BRResultModel * _Nullable resultModel) {
        self.centerTextF.text = resultModel.value;
        NSLog(@"%ld",(long)resultModel.index);
        self.iconCImageView.image = [UIImage imageNamed:self.imageArray[resultModel.index]];
        //点击之后设置中间图片为+号
        if (self.centerTextF.text) {
            self.iconRImageView.image = [UIImage imageNamed:@"ic_add can"];
            self.rightTextF.text = @"添加成功!";
        }
    };
    [stringPickerView show];
}



@end
