//
//  FightDetailVC.m
//  CyberGame
//
//  Created by apple on 2020/6/20.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FightDetailVC.h"
#import "UIImage+OriginalImage.h"
#import "FightRuleTableCell.h"
#import "FightRuleDetailCell.h"
#import "ClickBtnCell.h"
#import <WRNavigationBar.h>

@interface FightDetailVC () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FightDetailVC

NSString *FightRuleTableCellID = @"FightRuleTableCell";
NSString *ClickBtnCellID = @"ClickBtnCell";
NSString *FightRuleDetailCellID = @"FightRuleDetailCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"游戏规则";
    WEAKSELF
    [weakSelf wr_setNavBarTitleColor:[UIColor colorWithHexString:@"333333"]];
    
    //右边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageWithName:@"ic_back_g"] style:UIBarButtonItemStyleDone target:self action:@selector(backBtnClick)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //隐藏分割线
    self.tableView.separatorStyle = UITableViewScrollPositionNone;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FightRuleTableCell class]) bundle:nil] forCellReuseIdentifier:FightRuleTableCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClickBtnCell class]) bundle:nil] forCellReuseIdentifier:ClickBtnCellID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FightRuleDetailCell class]) bundle:nil] forCellReuseIdentifier:FightRuleDetailCellID];
    
}

- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}
- (UIImage *)wr_navBarBackgroundImage {
    return [UIImage new];
}

#pragma mark - UITableViewViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 4) {
        ClickBtnCell *cell = [tableView dequeueReusableCellWithIdentifier:ClickBtnCellID];
        
        WEAKSELF
        cell.selectedClickButtonBlock = ^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
        
        return cell;
    }
    else if (indexPath.section == 2) {
        FightRuleDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:FightRuleDetailCellID];
        return cell;
    }
    else if (indexPath.section == 3) {
        FightRuleDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:FightRuleDetailCellID];
        return cell ;
    }
    else {
        FightRuleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:FightRuleTableCellID];
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2) {
        return 160;
    }
    else if (indexPath.section == 3) {
        return 160;
    }
    else {
        return 68;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 4) {
        return 0.01f;
    }else {
        return 20;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //创建headView
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    UIImageView *headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 19.5, 18.5)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(45, 2, 80, 14)];
    titleLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    
    [headView addSubview:headImageView];
    [headView addSubview:titleLabel];
    
    if (section == 0) {
        headImageView.image = [UIImage imageNamed:@"ic_phone"];
        titleLabel.text = @"联系电话";
    }
    else if (section == 1) {
        headImageView.image = [UIImage imageNamed:@"ic_email"];
        titleLabel.text = @"电子邮件";
    }
    else if (section == 2) {
        headImageView.image = [UIImage imageNamed:@"ic_clan"];
        titleLabel.text = @"游戏规则";
    }
    else if (section == 3){
        headImageView.image = [UIImage imageNamed:@"ic_news"];
        titleLabel.text = @"备注信息";
    }else {
        headImageView.image = [UIImage new];
        titleLabel.text = @"";
    }
    
    return headView;
}
@end
