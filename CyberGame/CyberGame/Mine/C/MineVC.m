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
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
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
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MineID];
    //设置右边的指示样式
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = @"1";
    cell.imageView.image = [UIImage imageNamed:@"ic_fight"];
    cell.detailTextLabel.text = @"乌拉乌拉";
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
