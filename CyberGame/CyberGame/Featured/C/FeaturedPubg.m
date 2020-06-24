//
//  FeaturedPubg.m
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FeaturedPubg.h"
#import "FeaturedTableViewCell.h"
#import "WzryDetailVC.h"

@interface FeaturedPubg () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *pubgDataArray;

@end

@implementation FeaturedPubg

NSString *FeaturePubgID = @"FeaturePubg";
- (void)viewDidLoad {
    if (SCREEN_WIDTH == 414) {
        self.headViewHeight.constant = 172.3;
    }else if (SCREEN_WIDTH == 375){
        self.headViewHeight.constant = 156;
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FeaturedTableViewCell class]) bundle:nil] forCellReuseIdentifier:FeaturePubgID];
    
}

- (UIView *)listView{
    return self.view;
}

- (void)viewWillAppear:(BOOL)animated {
    if (self.pubgDataArray == nil) {
        [self getPubgData];
    }
}

-(void)filterData{
    NSMutableArray *filterArray = [NSMutableArray array];
    for (FeaturedDataModel *wzryModel in self.pubgDataArray) {
        if ([wzryModel.content containsString:@"吃鸡"] || [wzryModel.content containsString:@"绝地求生"]) {
            [filterArray addObject:wzryModel];
        }
    }
    self.pubgDataArray = filterArray;
}

- (void)getPubgData {
    WEAKSELF
    [ENDNetWorkManager getWithPathUrl:@"/user/talk/getTalkListByProject?project=game" parameters:nil queryParams:nil Header:nil success:^(BOOL success, id result) {
        NSError *error;
        weakSelf.pubgDataArray = [MTLJSONAdapter modelsOfClass:[FeaturedDataModel class] fromJSONArray:result[@"data"][@"list"] error:&error];
        [weakSelf filterData];
        //刷新cell
        [self.tableView reloadData];
    } failure:^(BOOL failuer, NSError *error) {
        [Toast makeText:weakSelf.view Message:@"请求数据失败" afterHideTime:DELAYTiME];
    }];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.pubgDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FeaturePubgID];
    cell.featuredDataModel = self.pubgDataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedDataModel *dataModel = self.pubgDataArray[indexPath.row];
    WzryDetailVC *detailVC = WzryDetailVC.new;
    detailVC.model = dataModel;
    [self.navigationController pushViewController:detailVC animated:YES];
}
@end
