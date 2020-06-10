//
//  WzryVC.m
//  CyberGame
//
//  Created by apple on 2020/6/6.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "WzryVC.h"
#import "RankTableViewCell.h"

#import "UIColor+Hex.h"

@interface WzryVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WzryVC

NSString *WzryID = @"wzry";
- (void)viewDidLoad {

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
 

    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RankTableViewCell class]) bundle:nil] forCellReuseIdentifier:WzryID];
    
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#6716d6"];
}

-(UIView *)listView{
    return self.view;
}

#pragma mark  - 数据源方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WzryID];
    return cell;
}

@end
