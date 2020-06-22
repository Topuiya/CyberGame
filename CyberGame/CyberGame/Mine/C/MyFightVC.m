//
//  MyFightVC.m
//  CyberGame
//
//  Created by apple on 2020/6/20.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "MyFightVC.h"
#import "UIImage+OriginalImage.h"
#import "UIColor+Hex.h"
#import "MyFightTableCell.h"
#import <WRNavigationBar.h>

@interface MyFightVC () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyFightVC

NSString *MyFightTableCellID = @"MyFightTableCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    //右边按钮
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageWithName:@"ic_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 220;

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyFightTableCell class]) bundle:nil] forCellReuseIdentifier:MyFightTableCellID];
}

- (void)viewWillAppear:(BOOL)animated {
    //设置导航栏背景图
    UIImage *navImg =[UIImage imageNamed:@"bg"];
    navImg = [navImg resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:navImg forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.contentMode = UIViewContentModeScaleAspectFill;
    //设置导航栏标题
    self.title = self.titleStr;
    [self wr_setNavBarTitleColor:UIColor.whiteColor];
}



- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyFightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MyFightTableCellID];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"box"]];
    cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"box_over"]];
    return cell;
}

@end
