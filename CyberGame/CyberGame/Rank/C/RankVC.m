//
//  RankVC.m
//  CyberGame
//
//  Created by apple on 2020/6/6.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "RankVC.h"
#import "JXCategoryTitleView.h"

#import "UIImage+Image.h"
#import "UIColor+Hex.h"

//ViewControllers
#import "WzryVC.h"
#import "LscsVC.h"
#import "LolVC.h"
#import "OwVC.h"

@interface RankVC () <JXCategoryViewDelegate>

@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;

@end

@implementation RankVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"排名";
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#6716d6"]] forBarMetrics:UIBarMetricsDefault];
    

//    self.myCategoryView.indicators = @[lineView];
//    [self.myCategoryView removeFromSuperview];
//    self.navigationItem.titleView = self.myCategoryView;
//    self.myCategoryView.listContainer.contentScrollView.scrollEnabled = NO;
    
    self.titles = @[@"王者荣耀", @"炉石传说", @"英雄联盟", @"守望先锋", ];
    CGFloat totalItemWidth = self.view.bounds.size.width - 30*2;
    
    self.myCategoryView.titles = self.titles;
    self.myCategoryView.cellSpacing = 0;
    self.myCategoryView.cellWidth = totalItemWidth/self.titles.count;
    self.myCategoryView.titleFont = [UIFont systemFontOfSize:18];
//    self.myCategoryView.titleColor = RGBA(255, 255, 255, 1);
//    self.myCategoryView.titleSelectedColor = RGBA(255, 255, 255, 1);
    self.myCategoryView.titleColor = [UIColor redColor];
    self.myCategoryView.titleSelectedColor = [UIColor whiteColor];
    //cell之间的间距，默认20
    self.myCategoryView.cellSpacing = 34.5;
    //默认JXCategoryViewAutomaticDimension
    self.myCategoryView.cellWidth = 60;
    self.myCategoryView.titleLabelMaskEnabled = YES;

    JXCategoryIndicatorBackgroundView *backgroundView = [[JXCategoryIndicatorBackgroundView alloc] init];
    backgroundView.componentPosition = JXCategoryComponentPosition_Bottom;
    backgroundView.indicatorHeight = 2;
    //指示器宽度增量
//    backgroundView.indicatorWidthIncrement = 6;
    backgroundView.verticalMargin = 10;
    backgroundView.indicatorColor = [UIColor colorWithHexString:@"#FA810C"];;
    self.myCategoryView.indicators = @[backgroundView];
    
    //将CategoryView加到navigationItem上
//    self.navigationItem.titleView = self.myCategoryView;
//    self.myCategoryView.listContainer.contentScrollView.scrollEnabled = NO;
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    self.myCategoryView.frame = CGRectMake(0, 20, SCREEN_WIDTH, 30);
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

//- (void)viewDidLayoutSubviews {
//    [super viewDidLayoutSubviews];
//
//    CGFloat totalItemWidth = self.view.bounds.size.width - 30*2;
//    self.myCategoryView.frame = CGRectMake(30, 10, totalItemWidth, 30);
//}

//- (CGFloat)preferredCategoryViewHeight {
//    return 50;
//}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    if (index == 0)
    {
        WzryVC *wzryVC = [[WzryVC alloc]init];
        
        return wzryVC;
    }
    else if(index == 1)
    {
        LscsVC *lscsVC = [[LscsVC alloc]init];
        return lscsVC;
    }
    else if(index == 2)
    {
        LolVC *lolVC = [[LolVC alloc]init];
        return lolVC;
    }
    else
    {
        OwVC *owVC = [[OwVC alloc]init];
        return owVC;
    }
    
}

@end
