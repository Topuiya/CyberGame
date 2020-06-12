//
//  SortHeadView.m
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "SortHeadView.h"

@implementation SortHeadView

//初始化
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *locationView = [[NSBundle mainBundle]loadNibNamed:@"SortHeadView" owner:self options:nil].firstObject;
        locationView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 65);
        [self addSubview:locationView];
    }
    return self;
}

@end
