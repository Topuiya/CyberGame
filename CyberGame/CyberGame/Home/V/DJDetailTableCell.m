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
    [self.sureBtn addTarget:self action:@selector(didSureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (IBAction)didSureBtnClick:(id)sender {
    _btnSeleted = !_btnSeleted;
    //解档,拿到LocalData模型
    LocalData *dataModel = [EGHCodeTool getOBJCWithSavekey:DJData];
    //新建一个user模型,保存输入的内容
    UserDataModel *nowUserModel = UserDataModel.new;
    
    NSInteger num = 0;
    BOOL hasUserLogin = NO;
    
    for (UserDataModel *userDataModel in dataModel.localModelArray) {
        //判断当前用户是否登录
        if ([userDataModel.uesrID isEqualToString:nowUserModel.uesrID]) {
            hasUserLogin = YES;
        }
    }
    //如果没有登录,提示去登录
    if (hasUserLogin == NO) {
        [Toast makeText:self Message:@"请先注册或登录" afterHideTime:0.5];
    }else {
        if(_btnSeleted) {
            //选中
            [self.sureBtn setTitleColor:UIColor.grayColor forState:UIControlStateHighlighted];
            //预约数点击一下加1
            num ++;
            nowUserModel.reservation = [NSNumber numberWithInteger:num];
            //归档保存到本地
            [EGHCodeTool archiveOJBC:dataModel saveKey:DJData];
        }else {
            //取消选中
            [self.sureBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
            //再点取消加1
            num --;
            nowUserModel.reservation = [NSNumber numberWithInteger:num];
            //归档保存到本地
            [EGHCodeTool archiveOJBC:dataModel saveKey:DJData];
        }
    }
    
    
}

@end
