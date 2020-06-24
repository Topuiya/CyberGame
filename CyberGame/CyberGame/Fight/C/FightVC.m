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
#import "FightInfoModel.h"
#import "RankTeamListModel.h"
#import <MJExtension/MJExtension.h>
#import <WRNavigationBar.h>

//TableViewCell
#import "FihghtThemeCell.h"
#import "FightTimeCell.h"
#import "FightRuleCell.h"
#import "FightTeamCell.h"
#import "FightOtherCell.h"

#import "FightDetailVC.h"

@interface FightVC () <UITableViewDelegate, UITableViewDataSource,FightOtherCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)FightInfoModel *infoModel;
@property (nonatomic, strong)RankTeamListModel *listModel;
@property (nonatomic, strong)NSArray *nameArray;
@property (nonatomic, strong)NSArray *saveListArray;

@property (nonatomic, copy)NSString *timeString;
@property (nonatomic, copy)NSString *teamNameString1;
@property (nonatomic, copy)NSString *teamImgString1;
@property (nonatomic, copy)NSString *teamNameString2;
@property (nonatomic, copy)NSString *teamImgString2;
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
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"teamList.plist" ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    //使用MJ框架转数组会变成NSArray不可变数组
    _nameArray = [RankTeamListModel mj_objectArrayWithKeyValuesArray:dic[@"data"] context:nil];
    RankTeamListModel *wzryListModel = _nameArray[0];
    RankTeamListModel *LOLListModel = _nameArray[1];
    RankTeamListModel *PUBGListModel = _nameArray[2];
    RankTeamListModel *OWListModel = _nameArray[3];
    
    self.saveListArray = [NSArray arrayWithObjects:wzryListModel, LOLListModel, PUBGListModel, OWListModel, nil];
    
}

- (void)addNavigationItem {
    self.title = @"发布约战";
    [self.navigationController.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:18],
      NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#333333"]}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forBarMetrics:UIBarMetricsDefault];

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
        cell.selectionStyle = UITableViewScrollPositionNone;
        return cell;
    }
    else if (indexPath.section == 1) {
        FightTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:FightTimeID];
        WEAKSELF
        cell.selectedTimeBlock = ^(NSString * _Nonnull timeStr) {
            weakSelf.timeString = timeStr;
        };
        return cell;
    }
    else if (indexPath.section == 2) {
        FightRuleCell *cell = [tableView dequeueReusableCellWithIdentifier:FightRuleID];
        cell.selectionStyle = UITableViewScrollPositionNone;
        return  cell;
    }
    else if (indexPath.section == 3) {
        FightTeamCell *cell = [tableView dequeueReusableCellWithIdentifier:FightTeamID];
        RankTeamListModel *dataModel = _saveListArray[indexPath.row];
        cell.model = dataModel;
        WEAKSELF
        cell.selectedTeam1Block = ^(NSString * _Nonnull teamNameStr1, NSString * _Nonnull teamImgStr1) {
            weakSelf.teamNameString1 = teamNameStr1;
            weakSelf.teamImgString1 = teamImgStr1;
        };
        cell.selectedTeam2Block = ^(NSString * _Nonnull teamNameStr2, NSString * _Nonnull teamImgStr2) {
            weakSelf.teamNameString2 = teamNameStr2;
            weakSelf.teamImgString2 = teamImgStr2;
        };
        return  cell;
    }
    else{
        FightOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:FightOtherID];
        cell.delegate = self;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 4) {
        return 240;
    }
    else if (indexPath.section == 0) {
        return 90;
    }
    else if (indexPath.section == 2) {
        return 90;
    }
    else {
        return UITableViewAutomaticDimension;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
/*SectionView*/
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

#pragma mark - FightOtherCellDelegate
- (void)didClickSortButton:(UIButton *)button {
    FightDetailVC *detailVC = FightDetailVC.new;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didClickSureBtn:(UIButton *)button {
    // 1.解档
    LocalData *localModel = [EGHCodeTool getOBJCWithSavekey:DJData];
    NSArray *fightDataArray = [EGHCodeTool getOBJCWithSavekey:localModel.userModel.uesrID];
   
    // 2.修改数据
    //  2.1判断当前用户是否登录
    if (localModel.login == YES) {
        // 2.2保存约战主题,约战时间,添加的战队名
        NSMutableArray *fightArray = NSMutableArray.new;
        for (FightDataModel *fightModel in fightDataArray) {
            [fightArray addObject:fightModel];
        }
        FightDataModel *fightModel = FightDataModel.new;
        //保存发布时间
        fightModel.publishTime = self.timeString;
        //保存战队信息
        fightModel.fightTeam1 = self.teamNameString1;
        fightModel.fightTeamImg1 = self.teamImgString1;
        fightModel.fightTeam2 = self.teamNameString2;
        fightModel.fightTeamImg2 = self.teamImgString2;
        [fightArray addObject:fightModel];
        // 3.归档
        [EGHCodeTool archiveOJBC:fightArray saveKey:localModel.userModel.uesrID];
        
        [Toast makeText:self.view Message:@"发布成功" afterHideTime:2];
    } else {
        // 没有登录提示去登录
        [Toast makeText:self.view Message:@"请先注册或登录" afterHideTime:2];
    }
}

@end
