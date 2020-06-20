//
//  FightRuleTableCell.m
//  CyberGame
//
//  Created by apple on 2020/6/20.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FightRuleTableCell.h"
#import "UIColor+Hex.h"

@implementation FightRuleTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.detailTextF.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
    
    //修改光标的位置
    self.detailTextF.leftView = [[UIView alloc] initWithFrame:CGRectMake(10, 1, 7, 26)];
    //输入框中的叉号
    self.detailTextF.leftViewMode = UITextFieldViewModeWhileEditing;
    //修改光标颜色
    self.detailTextF.tintColor = [UIColor colorWithHexString:@"#999999"];
    //内容水平对齐方式
    self.detailTextF.textAlignment = NSTextAlignmentJustified;
}


@end
