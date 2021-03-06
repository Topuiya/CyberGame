//
//  WzryVC.m
//  CyberGame
//
//  Created by apple on 2020/6/6.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "WzryVC.h"
#import "RankTableViewCell.h"
#import "RankTeamListModel.h"
#import "RankListModel.h"
#import "UIImage+OriginalImage.h"

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
    return _WzryModel.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RankTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:WzryID];
    RankListModel *model = _WzryModel.list[indexPath.row];
    
    cell.iconImage.image = [UIImage imageNamed:model.iconName];
    cell.teamName.text = model.teamName;
    cell.winLabel.text = model.win.description;
    cell.loseLabel.text = model.lose.description;
    cell.scoreLabel.text = model.score.description;
    
    if (indexPath.row == 0) {
        [cell.numBtn setImage:[UIImage originalImageWithName:@"NO.1"] forState:UIControlStateNormal];
        [cell.numBtn setTitle:@"" forState:UIControlStateNormal];
    }
    else if (indexPath.row == 1) {
        [cell.numBtn setImage:[UIImage originalImageWithName:@"NO.2"] forState:UIControlStateNormal];
        [cell.numBtn setTitle:@"" forState:UIControlStateNormal];
    }
    else if (indexPath.row == 2) {
        [cell.numBtn setImage:[UIImage originalImageWithName:@"NO.3"] forState:UIControlStateNormal];
        [cell.numBtn setTitle:@"" forState:UIControlStateNormal];
    }
    else {
        NSMutableArray *numArray = NSMutableArray.new;
        for (int i = 0; i < _WzryModel.list.count;i++) {
            NSString *num = [NSString stringWithFormat:@"%d",i + 1];
            [numArray addObject:num];
        }
        [cell.numBtn setTitle:numArray[indexPath.row] forState:UIControlStateNormal];
        [cell.numBtn setImage:UIImage.new forState:UIControlStateNormal];
    }
    
    
    return cell;
}

@end
