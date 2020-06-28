//
//  SortHeadView.m
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "SortHeadView.h"
#import "UIColor+Hex.h"

@implementation SortHeadView

- (void)awakeFromNib {
    [super awakeFromNib];
    //去掉cell的选中效果
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self.leftBtn addTarget:self action:@selector(headLeftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn addTarget:self action:@selector(headRightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (IBAction)headLeftBtnClick:(UIButton *)sender {
    if (_selectedLeftHeadBlock) {
        _selectedLeftHeadBlock();
    }
    
    self.rightImageView.hidden = YES;
    self.leftImageView.hidden = NO;
    
    [self.rightBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
}
- (IBAction)headRightBtnClick:(UIButton *)sender {
    if (_selectedRightHeadBlock) {
        _selectedRightHeadBlock();
    }
    
    
    self.rightImageView.hidden = NO;
    self.leftImageView.hidden = YES;
    
    [self.rightBtn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
}

@end
