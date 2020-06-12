//
//  FightTimeCell.m
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FightTimeCell.h"

@interface FightTimeCell ()

@property (weak, nonatomic) IBOutlet UIPickerView *timePickerView;

@end
@implementation FightTimeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//共有多少列
- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView {
    return 5;
}
//每一列有多少行
- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}
//每一列每一个行展示什么文字
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
//    NSMutableArray *array = self.foodArray[component];
//    return array[row];
    return @"乌拉乌拉";
}

@end
