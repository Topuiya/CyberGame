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

#import <SDWebImage/SDWebImage.h>
#import <MJExtension/MJExtension.h>
#import "UIImage+OriginalImage.h"

#define KbaseUrlString @"http://image.yysc.online/files/"

@interface HomeVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *clubArray;
@property (nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    //修改navigationBar背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg"] forBarMetrics:UIBarMetricsDefault];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //自适应高度
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 152;
    
    [self addNavBarButtonItem];
    
    [self addRegisterXib];

    
    //隐藏滚动条
    self.tableView.showsVerticalScrollIndicator = NO;
    
    _clubArray = [DJClubModel mj_objectArrayWithFilename:@"DJClub.plist"];
    
    
       
}

NSString *BannerTabCellID = @"BannerTabCell";
NSString *GameTabCellID = @"GameTabCell";
NSString *SortLeftTableCellID = @"SortLeftTableCell";
NSString *SortRightTableCellID = @"SortRightTableCell";

- (void)addRegisterXib {
    //注册轮播图tableViewCell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HomeBannerCell class]) bundle:nil] forCellReuseIdentifier:BannerTabCellID];
    
    //注册游戏分区tableViewCell
       [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([GameSortTabCell class]) bundle:nil] forCellReuseIdentifier:GameTabCellID];
    
    //注册电竞馆tableViewCell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SortLeftTableCell class]) bundle:nil] forCellReuseIdentifier:SortLeftTableCellID];
    
    //注册排行榜tableViewCell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SortRightTableCellID class]) bundle:nil] forCellReuseIdentifier:SortRightTableCellID];
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


#pragma mark - 三个功能键跳转界面按钮
- (void)setSortBtn:(UIView *)sortView {
    CGFloat spaceW = (SCREEN_WIDTH - 3*61 - 14.5*2)/2;
    //电竞快讯(第一个)按钮
    UIButton *gameNewsBtn = [[UIButton alloc] initWithFrame:CGRectMake(14.5, -20, 100, 41.5)];
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
    UIButton *gameRankBtn = [[UIButton alloc] initWithFrame:CGRectMake(61 + spaceW, -20, 120, 41.5)];;
    [gameRankBtn setTitle:@"游戏排名榜" forState:UIControlStateNormal];
    gameRankBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [gameRankBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [gameRankBtn setImage:[UIImage imageNamed:@"ic_02"] forState:UIControlStateNormal];
    gameRankBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [gameRankBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [sortView addSubview:gameRankBtn];
//    [gameRankBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    //每日签到(第三个)按钮
    UIButton *daySignBtn = [[UIButton alloc] initWithFrame:CGRectMake(122 + spaceW * 2 - 14.5, -20, 100, 41.5)];;
    [daySignBtn setTitle:@"每日签到" forState:UIControlStateNormal];
    daySignBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [daySignBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [daySignBtn setImage:[UIImage imageNamed:@"ic_03"] forState:UIControlStateNormal];
    daySignBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [daySignBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [sortView addSubview:daySignBtn];
    
    
    UIImageView *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title_sar zone"]];
    titleImageView.frame = CGRectMake((SCREEN_WIDTH - 151.5) / 2, 40, 151.5, 15.5);
    [sortView addSubview:titleImageView];
}

- (void)gameNewsBtnClick {
    NSLog(@"gameNewsBtnClick");
}

#pragma mark - UITableViewViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1) {
        return 1;
    }else {
        return _clubArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0 && indexPath.row == 0)
    {
        HomeBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:BannerTabCellID];
        //去掉cell的选中效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        self.tableView.separatorStyle = NO;
        return cell;
    }
    else if (indexPath.section == 1 && indexPath.row == 0) {
        GameSortTabCell *cell = [tableView dequeueReusableCellWithIdentifier:GameTabCellID];
        //去掉cell的选中效果
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else {
        SortLeftTableCell *cell = [tableView dequeueReusableCellWithIdentifier:SortLeftTableCellID];
        DJClubModel *tempModel = self.clubArray[indexPath.row];
        
        //设置图片
        NSURL *picURL = [NSURL URLWithString:tempModel.pic];
        [cell.picImageView sd_setImageWithURL:picURL];
        
        cell.nameLabel.text = tempModel.name;
        return cell;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        self.tableView.estimatedRowHeight = 100;
        return 200;
    }
    else if (indexPath.section == 1 && indexPath.row == 0) {
        return 220;
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
        return 60;
    }
    else {
        return 65;
    }
}

@end
