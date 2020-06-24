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
    [self.sureBtn addTarget:self action:@selector(didSureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didSureBtnClick:(UIButton *)sender {
    _btnSeleted = !_btnSeleted;
    //解档,拿到LocalData模型
    LocalData *localModel = [EGHCodeTool getOBJCWithSavekey:DJData];
    NSInteger num = 0;
    int i = [localModel.userModel.reservation intValue];
    num = i;
    
    //判断当前用户是否登录
    if (localModel.login == YES) {
        //登录 -> 修改关注数据,更新本地数据
        NSMutableArray *newUserArray = [NSMutableArray array];
        if(_btnSeleted) {
            //拿到当前登录的用户: localModel.userModel ,修改用户的数据,保存进新的数组,替代现在的用户
            //当前用户的预约数加1
            num ++;
            localModel.userModel.reservation = [NSNumber numberWithInteger:num];
            for (UserDataModel *nowUserModel in localModel.localModelArray) {
                if ([nowUserModel.uesrID isEqualToString:localModel.userModel.uesrID]) {
                    nowUserModel.reservation = localModel.userModel.reservation;
                    [newUserArray addObject:nowUserModel];
                    localModel.userModel = nowUserModel;
                } else
                [newUserArray addObject:nowUserModel];
            }
            //拿到当前保存用户的localModel.localModelArray数组,判断userID,如果不一样则不是当前用户,添加到newUserArray,
            //是一样的则为当前用户,
            //用newUserArray数组替换掉
            

            //更新dataModel.localModelArray
            localModel.localModelArray = newUserArray;
            //归档保存到本地
            [EGHCodeTool archiveOJBC:localModel saveKey:DJData];
        
            //修改按钮的选中状态
            [self.sureBtn setTitleColor:UIColor.grayColor forState:UIControlStateHighlighted];
            
            
            
        }
        //如果按钮已经点击
        else {
            //选中
            [self.sureBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        }
    }
    
    
    //如果没有登录,提示去登录
    if (localModel.login == NO) {
        [Toast makeText:self Message:@"请先注册或登录" afterHideTime:2];
    }
        
    if (_didSureBtnBlock) {
        _didSureBtnBlock();
    }
}

@end
