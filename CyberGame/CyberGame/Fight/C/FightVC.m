//
//  FightVC.m
//  CyberGame
//
//  Created by apple on 2020/6/3.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FightVC.h"
#import "UIImage+Image.h"
#import "UIImage+OriginalImage.h"
#import "UIColor+Hex.h"

//ViewControllers
#import "FihghtThemeCell.h"
#import "FightTimeCell.h"
#import "FightRuleCell.h"
#import "FightTeamCell.h"
#import "FightOtherCell.h"

@interface FightVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation FightVC

NSString *FihghtThemeID = @"FihghtTheme";
NSString *FightTimeID = @"FightTime";
NSString *FightRuleID = @"FightRule";
NSString *FightTeamID = @"FightTeam";
NSString *FightOtherID = @"FightOther";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavigationItem];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self addRegisterNib];
}

- (void)addNavigationItem {
    self.title = @"发布约战";
    [self.navigationController.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:18],
      NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#333333"]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageWithName:@"ic_back_g"] style:UIBarButtonItemStyleDone target:self action:@selector(backBtnClick)];
}

- (void)backBtnClick {
//    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"=--------------");
}

- (void)addRegisterNib {
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FihghtThemeCell class]) bundle:nil] forCellReuseIdentifier:FihghtThemeID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FightTimeCell class]) bundle:nil] forCellReuseIdentifier:FightTimeID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FightRuleCell class]) bundle:nil] forCellReuseIdentifier:FightRuleID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FightTeamCell class]) bundle:nil] forCellReuseIdentifier:FightTeamID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FightOtherCell class]) bundle:nil] forCellReuseIdentifier:FightOtherID];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        FightTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:FihghtThemeID];
        return cell;
    }
    else if (indexPath.section == 1) {
        FightTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:FightTimeID];
        return cell;
    }
    else{
        UITableViewCell *cell = UITableViewCell.new;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        return 50;
    }else {
        return UITableViewAutomaticDimension;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //创建headView
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    //添加图片
    UIImageView *headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"list_org_bg"]];
    [headView addSubview:headImageView];
    //添加线条
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"line"]];
    lineImageView.frame = CGRectMake(15, 11.5, 4, 21);
    [headView addSubview:lineImageView];
    //添加标题
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(28, 14, 100, 15);
    titleLabel.textColor = UIColor.whiteColor;
    [headView addSubview:titleLabel];
    
    [self.tableView addSubview:headView];
    
    if (section == 0) {
        [headImageView setImage:[UIImage imageNamed:@"list_org_bg"]];
        titleLabel.text = @"约战主题";
    }
    if (section == 1) {
        [headImageView setImage:[UIImage imageNamed:@"list_blak_bg"]];
        titleLabel.text = @"约战时间";
    }
    if (section == 2) {
        [headImageView setImage:[UIImage imageNamed:@"list_org_bg"]];
        titleLabel.text = @"比赛赛制";
    }
    if (section == 3) {
        [headImageView setImage:[UIImage imageNamed:@"list_blak_bg"]];
        titleLabel.text = @"战队添加";
    }
    if (section == 4) {
        [headImageView setImage:[UIImage imageNamed:@"list_org_bg"]];
        titleLabel.text = @"其他";
    }
    
    return headView;
}
@end
