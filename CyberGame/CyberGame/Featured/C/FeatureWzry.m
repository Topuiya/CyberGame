//
//  FeatureWzry.m
//  CyberGame
//
//  Created by apple on 2020/6/10.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FeatureWzry.h"
#import "FeaturedTableViewCell.h"

@interface FeatureWzry () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

NSString *FeatureWzryID = @"FeatureWzry";

@implementation FeatureWzry

- (void)viewDidLoad {
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([FeaturedTableViewCell class]) bundle:nil] forCellReuseIdentifier:FeatureWzryID];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

-(UIView *)listView{
    return self.view;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FeaturedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:FeatureWzryID];
    return cell;
}

@end
