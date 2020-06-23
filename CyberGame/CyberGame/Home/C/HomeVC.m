//
//  HomeVC.m
//  CyberGame
//
//  Created by apple on 2020/6/5.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "HomeVC.h"
#import "HomeBannerCell.h"
#import "HomeBannerDataM.h"
#import "GameSortTabCell.h"
#import "SortHeadView.h"
#import "SortLeftTableCell.h"
#import "SortRightTableCell.h"
#import "DJClubModel.h"
#import "DJDetailVC.h"
#import "RankVC.h"
#import "Featured.h"
#import "MyFightVC.h"

#import <SDWebImage/SDWebImage.h>
#import <MJExtension/MJExtension.h>
#import "UIImage+OriginalImage.h"
#import <WRNavigationBar.h>

@interface HomeVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *clubArray;
//保存排序之后的模型数组
@property (nonatomic, strong)NSArray *arr;
/** 记录点击的是第几个Button */
@property (nonatomic, assign) NSInteger menuTag;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _menuTag = 1;
    self.title = @"首页";
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //自适应高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 152;
    
    [self addNavBarButtonItem];
    
    [self addRegisterXib];
    //隐藏滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    //隐藏分割线
    self.tableView.separatorStyle = UITableViewScrollPositionNone;
    
//    _clubArray = [DJClubModel mj_objectArrayWithFilename:@"DJClub.plist"];
    
    
    NSMutableArray *dictArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"DJClub.plist" ofType:nil]];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *dict in dictArray) {
        DJClubModel *djModel = [DJClubModel djWithDict:dict];
        [temp addObject:djModel];
    }
    _clubArray = temp;
    
    [self ifHasLocalData];
}

//判断本地有没有userLocalData
-(void)ifHasLocalData{
    LocalData *dataModel = [EGHCodeTool getOBJCWithSavekey:DJData];
    if (dataModel == nil) {
        dataModel = LocalData.new;
    }
    //归档
    [EGHCodeTool archiveOJBC:dataModel saveKey:DJData];
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    self.navigationController.navigationBar.hidden = NO;
    
    UIImage *navImg =[UIImage imageNamed:@"bg"];
    navImg = [navImg resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    
    [self.navigationController.navigationBar setBackgroundImage:navImg forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.contentMode = UIViewContentModeScaleAspectFill;
    
}


NSString *BannerTabCellID = @"BannerTabCell";
NSString *GameTabCellID = @"GameTabCell";
NSString *SortLeftTableCellID = @"SortLeftTableCell";
NSString *SortRightTableCellID = @"SortRightTableCell";
NSString *SortHeadViewID = @"SortHeadView";

- (void)addRegisterXib {
    //注册轮播图tableViewCell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeBannerCell class]) bundle:nil] forCellReuseIdentifier:BannerTabCellID];
    
    //注册游戏分区tableViewCell
       [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GameSortTabCell class]) bundle:nil] forCellReuseIdentifier:GameTabCellID];
    
    //注册电竞馆tableViewCell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SortLeftTableCell class]) bundle:nil] forCellReuseIdentifier:SortLeftTableCellID];
    
    //注册排行榜tableViewCell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SortRightTableCell class]) bundle:nil] forCellReuseIdentifier:SortRightTableCellID];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SortHeadView class]) bundle:nil] forCellReuseIdentifier:SortHeadViewID];
}

- (void)addNavBarButtonItem {
    //左边按钮
    UIButton *addressBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    //设置Normal下的图片和偏移
    [addressBtn setImage:[UIImage originalImageWithName:@"ic_id"] forState:UIControlStateNormal];
    [addressBtn setImageEdgeInsets:UIEdgeInsetsMake(0,- addressBtn.currentImage.size.height + 10, 0, 0)];
    
    [addressBtn setImage:[UIImage originalImageWithName:@"ic_address"] forState:UIControlStateHighlighted];
    //设置Normal下的Title
    [addressBtn setTitle:@"成都" forState:UIControlStateNormal];
    [addressBtn setTintColor:UIColor.whiteColor];
    [addressBtn setTitleColor:UIColor.orangeColor forState:UIControlStateHighlighted];
    
    [addressBtn addTarget:self action:@selector(addressBtnClick) forControlEvents:UIControlEventTouchUpInside];
    //按钮自适应
    [addressBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addressBtn];
    
    
    //右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageWithName:@"ic_search"] style:UIBarButtonItemStyleDone target:self action:@selector(searchBtnClick)];
    
}


- (void)addressBtnClick {
    
}

- (void)searchBtnClick {
    
}

- (void)addSortHeadView {
    
}

- (void)buildUserLocalData {
   
    //首先创建一个userID(思路为userID+当前时间的时间戳)
    //当前时间,格式为:1592898100073
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)([datenow timeIntervalSince1970]*1000)];
    NSString *userID = [NSString stringWithFormat:@"userID%@",timeSp];
 
}

#pragma mark - 三个功能键跳转界面按钮
- (void)setSortBtn:(UIView *)sortView {
    CGFloat spaceW = (SCREEN_WIDTH - 3*61 - 14.5*2)/2;
    //电竞快讯(第一个)按钮
    UIButton *gameNewsBtn = [[UIButton alloc] initWithFrame:CGRectMake(14.5, 0, 100, 41.5)];
    [gameNewsBtn setTitle:@"电竞快讯" forState:UIControlStateNormal];
//    [gameNewsBtn setFont:[UIFont systemFontOfSize:13]];
    gameNewsBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [gameNewsBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [gameNewsBtn setImage:[UIImage imageNamed:@"ic_01"] forState:UIControlStateNormal];
    gameNewsBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [gameNewsBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [sortView addSubview:gameNewsBtn];
    [gameNewsBtn addTarget:self action:@selector(gameNewsBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //游戏排名榜(第二个)按钮
    UIButton *gameRankBtn = [[UIButton alloc] initWithFrame:CGRectMake(61 + spaceW, 0, 120, 41.5)];;
    [gameRankBtn setTitle:@"游戏排名榜" forState:UIControlStateNormal];
    gameRankBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [gameRankBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [gameRankBtn setImage:[UIImage imageNamed:@"ic_02"] forState:UIControlStateNormal];
    gameRankBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [gameRankBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [sortView addSubview:gameRankBtn];
    [gameRankBtn addTarget:self action:@selector(gameRankBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //每日签到(第三个)按钮
    UIButton *daySignBtn = [[UIButton alloc] initWithFrame:CGRectMake(122 + spaceW * 2 - 14.5, 0, 100, 41.5)];;
    [daySignBtn setTitle:@"每日签到" forState:UIControlStateNormal];
    daySignBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [daySignBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [daySignBtn setImage:[UIImage imageNamed:@"ic_03"] forState:UIControlStateNormal];
    daySignBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [daySignBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [sortView addSubview:daySignBtn];
    
    
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_sar zone"]];
    titleImageView.frame = CGRectMake((SCREEN_WIDTH - 151.5) / 2, 60, 151.5, 15.5);
    [sortView addSubview:titleImageView];
}

- (void)gameNewsBtnClick {
    NSLog(@"gameNewsBtnClick");
    RankVC *rankVC = RankVC.new;
    [self.navigationController pushViewController:rankVC animated:YES];
}

- (void)gameRankBtnClick {
    Featured *featureVC = Featured.new;
    [self.navigationController pushViewController:featureVC animated:YES];
}

#pragma mark - UITableViewViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 1;
    }else if (section == 2) {
        return 1;
    }
    else {
        return _clubArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0 && indexPath.row == 0)
    {
        HomeBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:BannerTabCellID];
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 0) {
        GameSortTabCell *cell = [tableView dequeueReusableCellWithIdentifier:GameTabCellID];
        
        WEAKSELF
        cell.selectedLolViewBlock = ^{
            MyFightVC *lolFightVC = MyFightVC.new;
            lolFightVC.titleStr = @"英雄联盟约战专区";
            [weakSelf.navigationController pushViewController:lolFightVC animated:YES];
        };
        cell.selectedOwViewBlock = ^{
            MyFightVC *owFightVC = MyFightVC.new;
            owFightVC.titleStr = @"守望先锋约战专区";
            [weakSelf.navigationController pushViewController:owFightVC animated:YES];
        };
        cell.selectedWzryViewBlock = ^{
            MyFightVC *wzryFightVC = MyFightVC.new;
            wzryFightVC.titleStr = @"王者荣耀约战专区";
            [weakSelf.navigationController pushViewController:wzryFightVC animated:YES];
        };
        cell.selectedPubgViewBlock = ^{
            MyFightVC *pubgFightVC = MyFightVC.new;
            pubgFightVC.titleStr = @"绝地求生约战专区";
            [weakSelf.navigationController pushViewController:pubgFightVC animated:YES];
        };
        return cell;
    }else if (indexPath.section == 2 && indexPath.row == 0) {
        SortHeadView *cell = [tableView dequeueReusableCellWithIdentifier:SortHeadViewID];
        //去掉cell的选中效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        WEAKSELF
        cell.selectedLeftHeadBlock = ^{
            weakSelf.menuTag = 1;
            [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationFade];
        };
        cell.selectedRightHeadBlock = ^{
            weakSelf.menuTag = 2;
            [weakSelf.tableView reloadSections:[NSIndexSet indexSetWithIndex:3] withRowAnimation:UITableViewRowAnimationFade];
        };
        return cell;
    }
    else {
        //用star进行降序排序
        NSArray *tempArr = self.clubArray;
        //降序
        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"star" ascending:NO];
        _arr = [tempArr sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
        DJClubModel *rankModel = _arr[indexPath.row];
        
        //加载不同的cell
        switch (self.menuTag) {
            case 1:
                {
                    SortLeftTableCell *cell = [tableView dequeueReusableCellWithIdentifier:SortLeftTableCellID];
                    //设置图片
                    NSURL *picURL = [NSURL URLWithString:rankModel.pic];
                    [cell.picImageView sd_setImageWithURL:picURL];
                    cell.nameLabel.text = rankModel.name;
                    return cell;
                }
                break;
            case 2:
            {
                SortRightTableCell *cell = [tableView dequeueReusableCellWithIdentifier:SortRightTableCellID];
                NSURL *picURL = [NSURL URLWithString:rankModel.pic];
                [cell.picImageView sd_setImageWithURL:picURL];
                cell.nameLabel.text = rankModel.name;
                cell.addressLabel.text = rankModel.address;
                if (rankModel.isHot == NO) {
                    cell.hotImage.hidden = NO;
                }
                else {
                    cell.hotImage.hidden = YES;
                }
                return cell;
            }
            default:
                break;
        }
    }
    return nil;
}

 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        self.tableView.estimatedRowHeight = 100;
        return 200;
    }
    else if (indexPath.section == 1 && indexPath.row == 0) {
        return 220;
    }
    else if (indexPath.section == 2 && indexPath.row == 0) {
        return 70;
    }
    else {
        return UITableViewAutomaticDimension;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    else if (section == 1) {
        UIView *gameHeadView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
        [self setSortBtn:gameHeadView];
        return gameHeadView;
    }
    else if (section == 2) {
        return nil;
    }
    else {
        SortHeadView *sortHeadView = [[SortHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 65)];
        
        return sortHeadView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01f;
    }
    else if (section == 1) {
        return 80;
    }
    else if (section == 2) {
        return 0.01f;
    }
    else {
        return 0.01f;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 3) {
        DJClubModel *dataModel = _arr[indexPath.row];
        DJDetailVC *detailVC = DJDetailVC.new;
        detailVC.model = dataModel;
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}

@end
