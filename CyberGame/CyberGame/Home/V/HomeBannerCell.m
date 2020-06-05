//
//  HomeBannerCell.m
//  CyberGame
//
//  Created by apple on 2020/6/4.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "HomeBannerCell.h"
#import "BannerCollectionViewCell.h"

#import "HomeBannerDataM.h"
#import "TYCyclePagerView.h"
#import "TYPageControl.h"

#import "UIColor+Hex.h"

@interface HomeBannerCell () <TYCyclePagerViewDataSource ,TYCyclePagerViewDelegate>

@property (nonatomic, strong) NSArray *bannerArray;

@property (weak, nonatomic) IBOutlet TYCyclePagerView *pagerView;

@property (nonatomic, strong) TYPageControl *pageControl;

@end

@implementation HomeBannerCell

- (NSArray *)bannerArray {
    if (_bannerArray == nil) {
        HomeBannerDataM *bannerModelA = HomeBannerDataM.new;
        bannerModelA.avatarImgName = @"banner01";
        bannerModelA.name = @"1";
        
        HomeBannerDataM *bannerModelB = HomeBannerDataM.new;
        bannerModelB.avatarImgName = @"banner03";
        bannerModelB.name = @"2";
        
        HomeBannerDataM *bannerModelC = HomeBannerDataM.new;
        bannerModelC.avatarImgName = @"banner01";
        bannerModelC.name = @"3";
        
        HomeBannerDataM *bannerModelD = HomeBannerDataM.new;
        bannerModelD.avatarImgName = @"banner03";
        bannerModelD.name = @"4";
        
        NSMutableArray *temp = NSMutableArray.new;
        [temp addObject:bannerModelA];
        [temp addObject:bannerModelB];
        [temp addObject:bannerModelC];
        [temp addObject:bannerModelD];
        _bannerArray = temp;
    }
    return _bannerArray;
}

NSString *HomeBannerCellID = @"BannerCell";

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self addPagerView];
    [self pageControl];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _pagerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    _pageControl.frame = CGRectMake(145, 165 - 5, CGRectGetWidth(_pagerView.frame), 26);
    
}
 

- (void)addPagerView {
    self.pagerView.layer.borderWidth = 0;
    self.pagerView.isInfiniteLoop = NO;
//    self.pagerView.autoScrollInterval = 0.0;
    
    self.pagerView.dataSource = self;
    self.pagerView.delegate = self;
    
    [self.pagerView registerNib:[UINib nibWithNibName:NSStringFromClass([BannerCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:HomeBannerCellID];
}

- (void)addPageControl {
    TYPageControl *pageControl = [[TYPageControl alloc]init];
    pageControl.currentPageIndicatorSize = CGSizeMake(30, 10);
    pageControl.pageIndicatorSize = CGSizeMake(30, 10);
    pageControl.currentPageIndicatorTintColor = UIColor.whiteColor;
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    [self.pagerView addSubview:pageControl];
    _pageControl = pageControl;
}


- (void)loadData {
    _pageControl.numberOfPages = self.bannerArray.count;
    [_pagerView reloadData];
    //[_pagerView scrollToItemAtIndex:3 animate:YES];
}


#pragma mark - TYCyclePagerViewDataSource
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    _pageControl.numberOfPages = self.bannerArray.count;
    return self.bannerArray.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index
{
    BannerCollectionViewCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:HomeBannerCellID forIndex:index];
    cell.bannerModel = self.bannerArray[index];
    return cell;
}


- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(326, 164);
    layout.itemSpacing = 15;
    layout.layoutType = normal;
    layout.itemHorizontalCenter = YES;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}


@end
