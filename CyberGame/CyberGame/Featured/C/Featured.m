//
//  Featured.m
//  CyberGame
//
//  Created by apple on 2020/6/10.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "Featured.h"
#import "UIImage+Image.h"
#import "UIImage+OriginalImage.h"

#import "FeatureWzry.h"
#import "FeaturedPubg.h"
#import "FeaturedLol.h"
#import "FeaturedOw.h"

#import "JXCategoryTitleView.h"

@interface Featured () <JXCategoryViewDelegate>

@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;

@end

@implementation Featured

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电竞快讯";
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg"] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBA(255, 255, 255, 0)] forBarMetrics:UIBarMetricsDefault];
    
    [self addNavBarButtonItem];
    
    
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
    
    
    JXCategoryIndicatorImageView *indicatorImageView = [[JXCategoryIndicatorImageView alloc] init];
    indicatorImageView.indicatorImageView.image = [UIImage imageNamed:@"ic_selector"];
//    indicatorImageView.verticalMargin = - 5;
    indicatorImageView.indicatorImageViewSize = CGSizeMake(22.5, 9);
    self.myCategoryView.indicators = @[indicatorImageView];
}

#pragma mark - navBarButtonItem
- (void)addNavBarButtonItem {
    //右边按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageWithName:@"ic_search"] style:UIBarButtonItemStyleDone target:self action:@selector(searchBtnClick)];
    
}

- (void)searchBtnClick {
    
}

#pragma mark - JXCategoryListContentViewDelegate
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (SCREEN_WIDTH == 414) {
        self.myCategoryView.frame = CGRectMake(0, 80, SCREEN_WIDTH, 50);
    } else {
        self.myCategoryView.frame = CGRectMake(0, 80, SCREEN_WIDTH, 40);
    }
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
    if (index == 0) {
        FeatureWzry *fewzryVC = FeatureWzry.new;
        return fewzryVC;
    }
    if (index == 1) {
        FeaturedLol *felolVC = FeaturedLol.new;
        return felolVC;
    }
    if (index == 2) {
        FeaturedPubg *felscsVC = FeaturedPubg.new;
        return felscsVC;
    }
    else {
        FeaturedOw *feowVC = FeaturedOw.new;
        return feowVC;
    }
}



@end
