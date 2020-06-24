//
//  LoginVC.m
//  CyberGame
//
//  Created by apple on 2020/6/15.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "LoginVC.h"
#import "UIImage+Image.h"
#import "UIImage+OriginalImage.h"
#import "UIColor+Hex.h"
#import "WRNavigationBar.h"
#import "BaseNavigationController.h"
#import "HomeVC.h"
#import "MineVC.h"

@interface LoginVC () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *accountTextF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTextF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addNavBarButtonItem];
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor colorWithHexString:@"#333333"]];
    
    //监听文本框内容的改变
    [self.accountTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.pwdTextF addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    //启用右滑返回手势
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self textChange];
    
    _pwdTextF.keyboardType = UIKeyboardTypeDefault;
    _accountTextF.keyboardType = UIKeyboardTypeNumberPad;
    
}

- (void)addNavBarButtonItem {
    self.title = @"登录中心";
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:18],
       NSForegroundColorAttributeName:[UIColor blackColor]}];
    //右边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageWithName:@"ic_back 拷贝"] style:UIBarButtonItemStyleDone target:self action:@selector(backBtnClick)];
    
}

- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)textChange
{
    //账号和密码同时有值时,才让登录按钮能够点击
    self.loginBtn.enabled = self.accountTextF.text.length && self.pwdTextF.text.length;
}

//点击登录按钮判断有没有注册,没有注册就注册,有就修改密码
- (IBAction)loginBtnClick:(UIButton *)sender {
    //判断需不需要新建一个user模型
    //和本地数据的user数组比较,当前输入的账号,这个人有没有在本地
    LocalData *dataModel = [EGHCodeTool getOBJCWithSavekey:DJData];
    //新建一个user模型,保存输入的内容
    UserDataModel *nowUserModel = UserDataModel.new;
    nowUserModel.uesrID = self.accountTextF.text;
    nowUserModel.pwd = self.pwdTextF.text;
    //将login判断改为真
    dataModel.login = YES;
    BOOL hasSameUser = NO;
    for (UserDataModel *userLocalModel in dataModel.localModelArray) {
        if ([userLocalModel.uesrID isEqualToString:nowUserModel.uesrID]) {
            hasSameUser = YES;
        }
    }
    
    
    if (hasSameUser == NO) {
        //如果没有在本地,nowUserModel模型保存到本地
        NSMutableArray *newUserArray = [NSMutableArray array];
        for (UserDataModel *userLocalModel in dataModel.localModelArray) {
            [newUserArray addObject:userLocalModel];
        }
        [newUserArray addObject:nowUserModel];
        
        //更新dataModel.userModel
        dataModel.userModel = nowUserModel;
        //更新dataModel.localModelArray
        dataModel.localModelArray = newUserArray;
        
        //归档保存到本地
        [EGHCodeTool archiveOJBC:dataModel saveKey:DJData];
    }
    else{
        //如果存在,修改密码,更新本地数据
        NSMutableArray *newUserArray = [NSMutableArray array];
        for (UserDataModel *userLocalModel in dataModel.localModelArray) {
            //数组里面的userLocalModel模型  是否和当前输入的nowUserModel 相等
            if ([userLocalModel.uesrID isEqualToString:nowUserModel.uesrID]) {
                [newUserArray addObject:nowUserModel];
            }
            else{
                [newUserArray addObject:userLocalModel];
            }
        }
        
        //更新dataModel.userModel
        dataModel.userModel = nowUserModel;
        //更新dataModel.localModelArray
        dataModel.localModelArray = newUserArray;
        
        //归档保存到本地
        [EGHCodeTool archiveOJBC:dataModel saveKey:DJData];
    }
    
    
    [self dismissViewControllerAnimated:self completion:nil];
    
}

@end
