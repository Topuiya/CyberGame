//
//  Featured.m
//  CyberGame
//
//  Created by apple on 2020/6/4.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "Featured.h"

@interface Featured ()

@end

@implementation Featured

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精选";
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
