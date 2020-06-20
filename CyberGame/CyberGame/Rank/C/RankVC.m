//
//  RankVC.m
//  CyberGame
//
//  Created by apple on 2020/6/6.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "RankVC.h"
#import "RankTeamListModel.h"
#import "RankListModel.h"

#import "UIImage+Image.h"
#import "UIColor+Hex.h"
#import "JXCategoryTitleView.h"
#import <MJExtension/MJExtension.h>
#import "MutableCopyCatetory.h"
#import <WRNavigationBar.h>

//ViewControllers
#import "WzryVC.h"
#import "LolVC.h"
#import "PubgVC.h"
#import "OwVC.h"

@interface RankVC () <JXCategoryViewDelegate>

@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;

@property(nonatomic,strong)NSArray *teamListArray;


@end

@implementation RankVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"teamList.plist" ofType:nil];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    //使用MJ框架转数组会变成NSArray不可变数组
    _teamListArray = [RankTeamListModel mj_objectArrayWithKeyValuesArray:dic[@"data"] context:nil];
 
    
    self.navigationItem.title = @"排名";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#6716d6"]] forBarMetrics:UIBarMetricsDefault];
    
    
    self.titles = @[@"王者荣耀", @"英雄联盟", @"绝地求生", @"守望先锋", ];
    CGFloat totalItemWidth = self.view.bounds.size.width - 30*2;
    
    self.myCategoryView.titles = self.titles;
    self.myCategoryView.cellSpacing = 0;
    self.myCategoryView.cellWidth = totalItemWidth/self.titles.count;
    self.myCategoryView.titleFont = [UIFont systemFontOfSize:15];
    self.myCategoryView.titleColor = RGBA(255, 255, 255, 1);
    self.myCategoryView.titleSelectedColor = RGBA(255, 255, 255, 1);
    //cell之间的间距，默认20
    self.myCategoryView.cellSpacing = 34.5;
    //默认JXCategoryViewAutomaticDimension
    self.myCategoryView.cellWidth = 60;
    self.myCategoryView.titleLabelMaskEnabled = YES;
    self.myCategoryView.titleLabelVerticalOffset = -10;

    JXCategoryIndicatorBackgroundView *backgroundView = [[JXCategoryIndicatorBackgroundView alloc] init];
    backgroundView.componentPosition = JXCategoryComponentPosition_Bottom;
    backgroundView.indicatorHeight = 2;
    //指示器宽度增量
    backgroundView.indicatorWidthIncrement = -6;
    backgroundView.verticalMargin = -12;
    backgroundView.indicatorColor = [UIColor colorWithHexString:@"#FA810C"];;
    self.myCategoryView.indicators = @[backgroundView];
    
    //将CategoryView加到navigationItem上
//    self.navigationItem.titleView = self.myCategoryView;
//    self.myCategoryView.listContainer.contentScrollView.scrollEnabled = NO;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.myCategoryView.frame = CGRectMake(0, 10, SCREEN_WIDTH, 40);
}

- (void)viewWillAppear:(BOOL)animated {
    [self wr_setNavBarTitleColor:UIColor.whiteColor];
}

- (JXCategoryTitleView *)myCategoryView {
    return (JXCategoryTitleView *)self.categoryView;
}

- (JXCategoryBaseView *)preferredCategoryView {
    return [[JXCategoryTitleView alloc] init];
}

- (CGFloat)preferredCategoryViewHeight {
    return 0;
}


-(NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView{
    return  4;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    if (index == 0)
    {
        WzryVC *wzryVC = [[WzryVC alloc]init];
        //拿到要使用的模型数组
        RankTeamListModel *tempModel = _teamListArray[0];
        //对改数组排序
        NSArray *wzryArray = [self mySortArray:tempModel.list];
        tempModel.list = wzryArray;
        //传递模型
        wzryVC.WzryModel = tempModel;
        return wzryVC;
    }
    else if(index == 1)
    {
        LolVC *lolVC = [[LolVC alloc]init];
        //拿到要使用的模型数组
        RankTeamListModel *tempModel = _teamListArray[1];
        //对改数组排序
        NSArray *lscsArray = [self mySortArray:tempModel.list];
        tempModel.list = lscsArray;
        lolVC.LscsModel = tempModel;
        return lolVC;
    }
    else if(index == 2)
    {
        PubgVC *pubgVC = [[PubgVC alloc]init];
        RankTeamListModel *tempModel = _teamListArray[2];
        NSArray *pubgArray = [self mySortArray:tempModel.list];
        tempModel.list = pubgArray;
        pubgVC.PubgModel = tempModel;
        return pubgVC;
    }
    else
    {
        OwVC *owVC = [[OwVC alloc]init];
        RankTeamListModel *tempModel = _teamListArray[3];
        NSArray *owArray = [self mySortArray:tempModel.list];
        tempModel.list = owArray;
        owVC.OwModel = tempModel;
        return owVC;
    }
    
}

- (NSArray *)mySortArray:(NSArray *)list {
    //降序
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"score" ascending:NO];
    NSArray *arr = [list sortedArrayUsingDescriptors:[NSArray arrayWithObject:sort]];
    return arr;
}

@end
