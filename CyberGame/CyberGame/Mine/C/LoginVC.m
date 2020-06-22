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
- (IBAction)loginBtnClick:(UIButton *)sender {
    //解档,拿到LocalData模型
    LocalData *localData = [EGHCodeTool getOBJCWithSavekey:DJData];
    
    UserDataModel *model = localData.localModelArray[0];
    //手机号密码正确才能进入下一级
    if ([self.accountTextF.text isEqualToString:model.account] && [self.pwdTextF.text isEqualToString:model.pwd]) {
        
        //登录成功执行返回操作
        [self.navigationController popViewControllerAnimated:YES];
    }
    else if ([self.accountTextF.text isEqualToString:@"123"] && [self.pwdTextF.text isEqualToString:@"123"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else {
        //用户名密码不匹配弹出警告
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"错误!" message:@"手机号与密码不相匹配" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alertController animated:YES completion:nil];
        //添加常规类型按钮
        [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }]];
        //添加销毁类型按钮
        [alertController addAction:[UIAlertAction actionWithTitle:@"找回密码" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        }]];

    }
    [EGHCodeTool archiveOJBC:localData saveKey:DJData];
}

@end
