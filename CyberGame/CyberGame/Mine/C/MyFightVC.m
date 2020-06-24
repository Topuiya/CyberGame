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
//存放解档之后的约战模型
@property (nonatomic, strong)NSArray *fightArray;

@end

@implementation MyFightVC

NSString *MyFightTableCellID = @"MyFightTableCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    //右边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageWithName:@"ic_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnClick)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = 220;

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MyFightTableCell class]) bundle:nil] forCellReuseIdentifier:MyFightTableCellID];
    
    
    // 1.解档拿到数据
    LocalData *localModel = [EGHCodeTool getOBJCWithSavekey:DJData];
    NSArray *fightDataArray = [EGHCodeTool getOBJCWithSavekey:localModel.userModel.uesrID];
    self.fightArray = fightDataArray;
    
    // 2.判断用户是否登录
    //  2.1是->赋值;否->提示用户登录
    if (localModel.login == YES) {
        
        // 3.归档
        [EGHCodeTool archiveOJBC:fightDataArray saveKey:localModel.userModel.uesrID];
        
        [Toast makeText:self.view Message:@"发布成功" afterHideTime:2];
    } else {
        // 没有登录提示去登录
        [Toast makeText:self.view Message:@"请先注册或登录" afterHideTime:2];
    }
    
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
    
    //刷新tableView,显示数据
    [self.tableView reloadData];
    
}


- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fightArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyFightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MyFightTableCellID];
    
    
    cell.fightModel = self.fightArray[indexPath.row];
    
    
    
    return cell;
}

@end
