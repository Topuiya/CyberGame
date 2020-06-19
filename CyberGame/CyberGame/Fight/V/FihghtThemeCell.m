//
//  FihghtThemeCell.m
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FihghtThemeCell.h"
#import "UIColor+Hex.h"
#import "UIImage+Image.h"
#import "UIImage+OriginalImage.h"
#import "FightData.h"

@interface FihghtThemeCell ()

/** 临时按钮(用来记录哪个按钮为选中状态) */
@property (nonatomic, weak) UIButton *selectedBtn;

@property(strong, nonatomic) NSMutableArray *btnArray;

@end

@implementation FihghtThemeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    NSArray *nameArray = [NSArray arrayWithObjects:@"王者荣耀", @"英雄联盟", @"绝地求生", @"守望先锋", nil];
    CGFloat w = SCREEN_WIDTH / nameArray.count;
    self.btnArray = [NSMutableArray array];
    for (int i = 0; i < nameArray.count; i++) {
        CGFloat x = w * i;
        UIButton *button = [UIButton new];
        
        [button setTitle:nameArray[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
        button.titleLabel.font = [UIFont systemFontOfSize:15.f];
        [button setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
        
        button.frame = CGRectMake(x + 10, 37, w - 20, 25);
        [self addSubview:button];
        //给按钮设置tag
        button.tag = i;
        //监听点击
        [button addTarget:self action:@selector(didClickSortGameButton:) forControlEvents:UIControlEventTouchUpInside];
        //将按钮保存在数组
        [self.btnArray addObject:button];
        
        if (button.tag == 0) {
            button.selected = YES;
            _selectedBtn = button;
        }
    }
    
    
}

- (void)didClickSortGameButton:(UIButton *)button {
    self.selectedBtn = button;
    button.selected = !button.selected;
    for (int i = 0; i < self.btnArray.count; i++) {
        UIButton *btn = self.btnArray[i];
        if (button.tag == i) {
            btn.selected = btn.selected;
        }else {
            btn.selected = NO;
        }
        btn.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
        [btn setTitleColor:[UIColor colorWithHexString:@"#666666"] forState:UIControlStateNormal];
    }
    UIButton *btn = self.btnArray[button.tag];
    if (btn.selected) {
        //选中之后的颜色
        btn.backgroundColor = [UIColor colorWithHexString:@"#FDD9C1"];
        //点击之后直接修改button的颜色
        [button setTitleColor:[UIColor colorWithHexString:@"#F87812"] forState:UIControlStateNormal];
    }else {
        //选中之后再次点击的颜色
        btn.backgroundColor = [UIColor colorWithHexString:@"#FDD9C1"];
        [button setTitleColor:[UIColor colorWithHexString:@"#F87812"] forState:UIControlStateNormal];
    }

}

@end
