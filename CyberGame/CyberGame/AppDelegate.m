//
//  AppDelegate.m
//  CyberGame
//
//  Created by apple on 2020/6/3.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "HomeVC.h"
#import "RankVC.h"
#import "FightVC.h"
#import "Featured.h"
#import "MineVC.h"

#import "BaseNavigationController.h"

#import "WRNavigationBar.h"
#import "UIColor+Hex.h"
#import <IQKeyboardManager.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [UIApplication sharedApplication].statusBarHidden = NO;
    // 设置主窗口,并设置根控制器
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    BaseNavigationController *homeNav = [[BaseNavigationController alloc] initWithRootViewController:[HomeVC new]];
    BaseNavigationController *rankNav = [[BaseNavigationController alloc] initWithRootViewController:[RankVC new]];
    BaseNavigationController *fightNav = [[BaseNavigationController alloc] initWithRootViewController:[FightVC new]];
    BaseNavigationController *chosenNav = [[BaseNavigationController alloc] initWithRootViewController:[Featured new]];
    BaseNavigationController *mineNav = [[BaseNavigationController alloc] initWithRootViewController:[MineVC new]];
    
    //开启AxcAE_TabBar
    BaseTabBarController *tabBarVC = [BaseTabBarController new];
//    UITabBarController *tabBarVC = [UITabBarController new];
    tabBarVC.viewControllers = @[homeNav, rankNav, fightNav, chosenNav, mineNav];
//    [self setTabBarItems:tabBarVC];
    self.window.rootViewController = tabBarVC;
    
    [self setNavBarAppearence];
    
    
    [self.window makeKeyAndVisible];
  
    
    //默认开启IQKeyboard键盘
    [IQKeyboardManager sharedManager];
    //点击背景收回键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    return YES;
}



- (void)setNavBarAppearence {
    // 设置是 广泛使用WRNavigationBar，还是局部使用WRNavigationBar，目前默认是广泛使用
    [WRNavigationBar wr_widely];
    [WRNavigationBar wr_setBlacklist:@[@"HomeVC",
                                       @"RankVC",
                                       @"FightVC",
                                       @"Featured",
                                       @"MineVC"]];
    //#6716d6
    // 设置导航栏默认的背景颜色
//    [WRNavigationBar wr_setDefaultNavBarBarTintColor:[UIColor colorWithHexString:@"#6716d6"]];
    // 设置导航栏所有按钮的默认颜色
    [WRNavigationBar wr_setDefaultNavBarTintColor:[UIColor whiteColor]];
    // 设置导航栏标题默认颜色
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor whiteColor]];
    // 统一设置状态栏样式
    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    // 如果需要设置导航栏底部分割线隐藏，可以在这里统一设置
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];
}

@end
