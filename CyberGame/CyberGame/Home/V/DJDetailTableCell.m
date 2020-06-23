//
//  DJDetailTableCell.m
//  CyberGame
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "DJDetailTableCell.h"
#import "UIImage+Image.h"

@implementation DJDetailTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    [self.sureBtn addTarget:self action:@selector(didSureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

//此方法有问题闪退
- (void)didSureBtnClick:(UIButton *)sender {
//    _btnSeleted = !_btnSeleted;
    //解档,拿到LocalData模型
    LocalData *localModel = [EGHCodeTool getOBJCWithSavekey:DJData];
    //新建一个user模型,保存输入的内容
    UserDataModel *nowUserModel = UserDataModel.new;
    
    NSInteger num = 0;
    BOOL hasUserLogin = NO;
    
    for (UserDataModel *userDataModel in localModel.localModelArray) {
        //判断当前用户是否登录
        if ([userDataModel.uesrID isEqualToString:nowUserModel.uesrID]) {
            //相等说明用户已经登陆
            hasUserLogin = YES;
        }
    }
    //如果没有登录,提示去登录
    if (hasUserLogin == NO) {
        [Toast makeText:self Message:@"请先注册或登录" afterHideTime:2];
    }
    else {
        //如果存在,修改关注数据,更新本地数据
        NSMutableArray *newUserArray = [NSMutableArray array];
        for (UserDataModel *userLocalModel in localModel.localModelArray) {
           if(_btnSeleted) {
               //选中
               [self.sureBtn setTitleColor:UIColor.grayColor forState:UIControlStateHighlighted];
               //预约数点击一下加1
               num ++;
               userLocalModel.reservation = [NSNumber numberWithInteger:num];
               
               //更新dataModel.userModel
               localModel.userModel = nowUserModel;
               //更新dataModel.localModelArray
               localModel.localModelArray = newUserArray;
               //归档保存到本地
               [EGHCodeTool archiveOJBC:localModel saveKey:DJData];
           }else {
               //取消选中
               [self.sureBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
               [self.sureBtn setBackgroundImage:[UIImage imageWithColor:UIColor.grayColor] forState:UIControlStateNormal];
               //再点取消加1
               num --;
               userLocalModel.reservation = [NSNumber numberWithInteger:num];
               
               //更新dataModel.userModel
               localModel.userModel = nowUserModel;
               //更新dataModel.localModelArray
               localModel.localModelArray = newUserArray;
               //归档保存到本地
               [EGHCodeTool archiveOJBC:localModel saveKey:DJData];
           }
        }
    }
    
    if (_didSureBtnBlock) {
        _didSureBtnBlock();
    }
}

@end
