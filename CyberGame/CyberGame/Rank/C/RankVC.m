//
//  RankVC.m
//  CyberGame
//
//  Created by apple on 2020/6/3.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "RankVC.h"

@interface RankVC ()

@end

@implementation RankVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"排名";
    UIImage *bgNav = [UIImage imageNamed:@"bg"];
    [self.navigationController.navigationBar setBackgroundImage:bgNav forBarMetrics:UIBarMetricsDefault];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
