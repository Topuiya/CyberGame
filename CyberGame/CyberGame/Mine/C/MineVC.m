//
//  MineVC.m
//  CyberGame
//
//  Created by apple on 2020/6/3.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "MineVC.h"
#import "UIImage+Image.h"
#import "UIImage+OriginalImage.h"
#import "MineTableCell.h"

@interface MineVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MineVC

NSString *MineID = @"Mine";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self.navigationController.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:18],
      NSForegroundColorAttributeName:UIColor.blackColor}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forBarMetrics:UIBarMetricsDefault];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F1F1F9"];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MineTableCell class]) bundle:nil] forCellReuseIdentifier:MineID];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else if (section == 1) {
        return 4;
    }else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MineID forIndexPath:indexPath];
    //设置右边的指示样式
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.section == 0 && indexPath.row == 0) {
            cell.title.text = @"我的约战";
            cell.iconImageView.image = [UIImage imageNamed:@"ic_fight"];
            cell.ortherLbael.text = @"99";
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        cell.title.text = @"我的消息";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_inform"];
        cell.ortherLbael.text = @"3条未读消息";
    }else if (indexPath.section == 0 && indexPath.row == 2) {
        cell.title.text = @"我的点赞";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_love"];
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        cell.title.text = @"关于我们";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_aboutus"];
        cell.ortherLbael.text = @"最新版本1.1.0";
    }else if (indexPath.section == 1 && indexPath.row == 1) {
        cell.title.text = @"切换账号";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_account nmb"];
        cell.ortherLbael.text = nil;
    }
    else if (indexPath.section == 1 && indexPath.row == 2) {
        cell.title.text = @"修改密码";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_code"];
        cell.ortherLbael.text = nil;
    }else if (indexPath.section == 1 && indexPath.row == 3) {
        cell.title.text = @"反馈中心";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_feedback center"];
        cell.ortherLbael.text = nil;
    }
    
    else if (indexPath.section == 2) {
        cell.title.text = @"设置 ";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_site"];
        cell.ortherLbael.text = nil;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 6;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = UIView.new;
    view.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
    return view;
}
@end
