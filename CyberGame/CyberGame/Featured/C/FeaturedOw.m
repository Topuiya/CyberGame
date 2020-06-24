//
//  FeaturedOw.m
//  CyberGame
//
//  Created by apple on 2020/6/10.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FeaturedOw.h"
#import "FeaturedTableViewCell.h"
#import "WzryDetailVC.h"

@interface FeaturedOw () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *owDataArray;

@end

@implementation FeaturedOw

NSString *FeatureOwID = @"FeatureOw";
- (void)viewDidLoad {
    if (SCREEN_WIDTH == 414) {
        self.headViewHeight.constant = 172.3;
    }else if (SCREEN_WIDTH == 375){
        self.headViewHeight.constant = 156;
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FeaturedTableViewCell class]) bundle:nil] forCellReuseIdentifier:FeatureOwID];
    
}

-(UIView *)listView{
    return self.view;
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.owDataArray == nil) {
        [self getOwData];
    }
}

-(void)filterData{
    NSMutableArray *filterArray = [NSMutableArray array];
    for (FeaturedDataModel *owModel in self.owDataArray) {
        if ([owModel.content containsString:@"守望先锋"] || [owModel.content containsString:@"ow"]) {
            [filterArray addObject:owModel];
        }
    }
    self.owDataArray = filterArray;
}

- (void)getOwData {
    WEAKSELF
    [ENDNetWorkManager getWithPathUrl:@"/user/talk/getTalkListByProject?project=game" parameters:nil queryParams:nil Header:nil success:^(BOOL success, id result) {
        NSError *error;
        weakSelf.owDataArray = [MTLJSONAdapter modelsOfClass:[FeaturedDataModel class] fromJSONArray:result[@"data"][@"list"] error:&error];
        [weakSelf filterData];
        //刷新cell
        [self.tableView reloadData];
    } failure:^(BOOL failuer, NSError *error) {
        [Toast makeText:weakSelf.view Message:@"请求数据失败" afterHideTime:DELAYTiME];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.owDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FeatureOwID];
    cell.featuredDataModel = self.owDataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedDataModel *dataModel = self.owDataArray[indexPath.row];
    WzryDetailVC *detailVC = WzryDetailVC.new;
    detailVC.model = dataModel;
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
