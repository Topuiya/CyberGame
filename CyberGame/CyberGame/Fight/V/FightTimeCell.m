//
//  FightTimeCell.m
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FightTimeCell.h"
#import <BRPickerView/BRPickerView.h>
#import "FightInfoModel.h"

@interface FightTimeCell ()

@property (nonatomic, strong) NSDate *dateSelectDate;
@property (nonatomic, strong) BRDatePickerView *datePicketView;

@end
@implementation FightTimeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    _dateTextF.userInteractionEnabled = YES;
    UITapGestureRecognizer *yearTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapTitleLabel)];
    [_dateTextF addGestureRecognizer:yearTap];
}
- (void)didTapTitleLabel {
    //年月日时
    // 1.创建日期选择器
    BRDatePickerView *datePicketView = [[BRDatePickerView alloc] init];
    // 2.设置属性
    datePicketView.pickerMode = BRDatePickerModeYMDH;
    datePicketView.title = @"请选择约战时间";
    datePicketView.selectDate = [NSDate date];
    datePicketView.minDate = [NSDate br_setYear:2020 month:1 day:1];
    datePicketView.maxDate = [NSDate br_setYear:2020 month:12 day:31];
    datePicketView.isAutoSelect = YES;
    datePicketView.resultBlock = ^(NSDate * _Nullable selectDate, NSString * _Nullable selectValue) {
        self.infoModel.datetimeStr = selectValue;
        NSLog(@"选择的值: %@",selectValue);
    };
    //设置自定义样式
    BRPickerStyle *customStyle = [[BRPickerStyle alloc] init];
    customStyle.pickerColor = UIColor.whiteColor;
    customStyle.separatorColor = UIColor.grayColor;
    datePicketView.showToday = YES;
//    datePicketView.pickerStyle = [BRPickerStyle pickerStyleWithThemeColor:[UIColor blueColor]];
    
    // 添加选择器头视图
    CGFloat ScreenWid = [UIScreen mainScreen].bounds.size.width;
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWid, 36)];
    headerView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.1f];
    NSArray *unitArr = @[@"年", @"月", @"日", @"时"];
    for (NSInteger i = 0; i < unitArr.count; i++) {
        CGFloat width = ScreenWid / unitArr.count;
        CGFloat orginX = i * (ScreenWid / unitArr.count);
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(orginX, 0, width, 36)];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16.0f];
        label.textColor = [UIColor darkGrayColor];
        label.text = unitArr[i];
        [headerView addSubview:label];
    }
    datePicketView.pickerHeaderView = headerView;
    // 3.显示
    [datePicketView show];
    
   
}

@end
