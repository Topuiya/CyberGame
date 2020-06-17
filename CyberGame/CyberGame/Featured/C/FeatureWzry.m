//
//  FeatureWzry.m
//  CyberGame
//
//  Created by apple on 2020/6/10.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FeatureWzry.h"
#import "FeaturedTableViewCell.h"
#import "FeaturedDataModel.h"
#import "WzryDetailVC.h"

@interface FeatureWzry () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *wzryDataArray;

@end

NSString *FeatureWzryID = @"FeatureWzry";

@implementation FeatureWzry

- (void)viewDidLoad {
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FeaturedTableViewCell class]) bundle:nil] forCellReuseIdentifier:FeatureWzryID];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    if (SCREEN_WIDTH == 414) {
        self.headViewHeight.constant = 172.3;
    }else if (SCREEN_WIDTH == 375){
        self.headViewHeight.constant = 156;
    }
    
    [self getWzryData];
}

-(UIView *)listView{
    return self.view;
}

- (void)getWzryData {
    WEAKSELF
//    NSDictionary *dic = @{@"project":@"game"};
    [ENDNetWorkManager getWithPathUrl:@"/user/talk/getTalkListByProject?project=game" parameters:nil queryParams:nil Header:nil success:^(BOOL success, id result) {
        NSError *error;
        weakSelf.wzryDataArray = [MTLJSONAdapter modelsOfClass:[FeaturedDataModel class] fromJSONArray:result[@"data"][@"list"] error:&error];
        //刷新cell
        [self.tableView reloadData];
    } failure:^(BOOL failuer, NSError *error) {
        [Toast makeText:weakSelf.view Message:@"请求数据失败" afterHideTime:DELAYTiME];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wzryDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FeatureWzryID];
    cell.featuredDataModel = self.wzryDataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedDataModel *dataModel = self.wzryDataArray[indexPath.row];
    WzryDetailVC *detailVC = WzryDetailVC.new;
    detailVC.model = dataModel;
    [self.navigationController pushViewController:detailVC animated:YES];
}

@end
