//
//  AppDelegate.m
//  CyberGame
//
//  Created by apple on 2020/6/3.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"

#import "UIColor+Hex.h"
#import <IQKeyboardManager.h>

@interface AppDelegate ()


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    [UIApplication sharedApplication].statusBarHidden = NO;
    // 设置主窗口,并设置根控制器
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    BaseTabBarController *rootViewController = [[BaseTabBarController alloc] init];
    [self.window setRootViewController:rootViewController];
    [self.window makeKeyAndVisible];
    
//    CustomTabBarController *customTabBarC = CustomTabBarController.new;
//    self.customTabBarC = customTabBarC;
//
//
//
//    HomeVC *homeVC = HomeVC.new;
//    homeVC.view.backgroundColor = UIColor.whiteColor;
//    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:homeVC];
//    [self addChildVC:homeNav title:@"首页" imgName:@"tab_ic_home_d" selectedImgName:@"tab_ic_home_s"];
//
//
//    MineVC *mineVC = MineVC.new;
//    mineVC.view.backgroundColor = UIColor.whiteColor;
//    UINavigationController *mineNav = [[UINavigationController alloc] initWithRootViewController:mineVC];
//    [self addChildVC:mineNav title:@"我的" imgName:@"tab_ic_mine_d" selectedImgName:@"tab_ic_mine_s"];
//
//
//    NSArray *array = [NSArray arrayWithObjects:homeNav, mineNav, nil];
//
//    UITabBarController *tabar = [[UITabBarController alloc] init];
//    tabar.viewControllers = array;
//
//    self.window.rootViewController = tabar;
//    [self.window makeKeyAndVisible];
//
    
    //默认开启IQKeyboard键盘
    [IQKeyboardManager sharedManager];
    //点击背景收回键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    return YES;
}

//- (void)addChildVC:(UINavigationController *)nav title:(NSString *)title imgName:(NSString *)imageName selectedImgName:(NSString *)selectedImgName
//{
//    nav.tabBarItem.title = title;
//    nav.tabBarItem.image = [UIImage imageNamed:imageName];
////    [self.customTabBarC addChildViewController:nav];
//}




@end
