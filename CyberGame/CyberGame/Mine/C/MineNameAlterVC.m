//
//  MineNameAlterVC.m
//  CyberGame
//
//  Created by apple on 2020/6/24.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "MineNameAlterVC.h"

@interface MineNameAlterVC ()

@end

@implementation MineNameAlterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.saveBtn addTarget:self action:@selector(saveButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.title = @"修改信息";
}

- (void)saveButtonClick:(UIButton *)button {
    // 1.解档
     LocalData *localModel = [EGHCodeTool getOBJCWithSavekey:DJData];
    
     // 2.修改数据
     //  2.1判断当前用户是否登录
     if (localModel.login == YES) {
         // 2.2修改并保存保存用户昵称,添加到用户数组
         NSMutableArray *newUserArray = NSMutableArray.new;
         for (UserDataModel *nowUserModel in localModel.localModelArray) {
             if ([nowUserModel.uesrID isEqualToString:localModel.userModel.uesrID]) {
                 nowUserModel.name = self.nickNameLabel.text;
                 [newUserArray addObject:nowUserModel];
                 localModel.userModel = nowUserModel;
             } else
                 [newUserArray addObject:nowUserModel];
         }
         // 3.归档
         //更新dataModel.localModelArray
         localModel.localModelArray = newUserArray;
         //归档保存到本地
         [EGHCodeTool archiveOJBC:localModel saveKey:DJData];
         
         
         [Toast makeText:self.view Message:@"修改成功" afterHideTime:2];
         
         if (_selectedSaveButtonBlock) {
             _selectedSaveButtonBlock();
         }
     }
     else {
         // 没有登录提示去登录
         [Toast makeText:self.view Message:@"请先注册或登录" afterHideTime:2];
     }
    
    
}

@end
