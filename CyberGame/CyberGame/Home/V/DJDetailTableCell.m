//
//  DJDetailTableCell.m
//  CyberGame
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "DJDetailTableCell.h"

@implementation DJDetailTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)sureBtnClick:(UIButton *)btn {
    //解档,拿到LocalData模型
    LocalData *localData = [EGHCodeTool getOBJCWithSavekey:DJData];
    
    UserDataModel *model = localData.localModelArray[0];
    NSInteger num = model.focus.integerValue;
    num += 1;
    model.reservation = [NSNumber numberWithInteger:num];
  
    model.focus = @0;
    //归档
    [EGHCodeTool archiveOJBC:localData saveKey:DJData];
}

@end
