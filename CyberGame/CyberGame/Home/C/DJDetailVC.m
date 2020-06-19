//
//  DJDetailVC.m
//  CyberGame
//
//  Created by apple on 2020/6/17.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "DJDetailVC.h"
#import "UIImage+OriginalImage.h"
#import "DJDetailTableCell.h"
#import <SDWebImage.h>
#import "UIImage+Image.h"
#import <WRNavigationBar.h>
#import <WRCustomNavigationBar.h>
#import "UIColor+Hex.h"

@interface DJDetailVC () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DJDetailVC

NSString *DJDetailID = @"DJDetailTableCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    //右边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageWithName:@"ic_back_g"] style:UIBarButtonItemStyleDone target:self action:@selector(backBtnClick)];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DJDetailTableCell class]) bundle:nil] forCellReuseIdentifier:DJDetailID];
}

- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIImage *)wr_navBarBackgroundImage {
    return UIImage.new;
}

- (void)viewWillAppear:(BOOL)animated {
//    self.navigationItem.title = _model.name;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
//    [self.navigationController.navigationBar setTitleTextAttributes:
//    @{NSFontAttributeName:[UIFont systemFontOfSize:15],
//      NSForegroundColorAttributeName:[UIColor blackColor]}];
}

#pragma mark - UITableViewViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DJDetailTableCell *cell = [tableView dequeueReusableCellWithIdentifier:DJDetailID];
    //设置图片
    NSURL *picURL = [NSURL URLWithString:_model.pic];
    [cell.picImageView sd_setImageWithURL:picURL];
    
    cell.nameLabel.text = _model.name;
    cell.addressLabel.text = _model.address;
    
    cell.timeLabel.text = @"营业时间";
    cell.dateLabel.text = @"00:00-24:00";
    NSLog(@"doubleValue:%.1f",_model.star.doubleValue);

    //设置星星
    //ic_star_s 灰色   ic_half star 半  ic_full star 整颗
    if ([_model.star isEqual: @1]) {
        cell.star1.image = [UIImage imageNamed:@"ic_full star"];
        cell.star2.image = cell.star3.image = cell.star4.image = cell.star5.image = [UIImage imageNamed:@"ic_star_s"];
    }
    if ([_model.star isEqual: @2]) {
        cell.star1.image = cell.star2.image = [UIImage imageNamed:@"ic_full star"];
        cell.star3.image = cell.star4.image = cell.star5.image = [UIImage imageNamed:@"ic_star_s"];
    }
    if ([_model.star isEqual: @3]) {
        cell.star1.image = cell.star2.image = cell.star3.image = [UIImage imageNamed:@"ic_full star"];
        cell.star4.image = cell.star5.image = [UIImage imageNamed:@"ic_star_s"];
    }
    if ([_model.star isEqual: @4]) {
        cell.star1.image = cell.star2.image = cell.star3.image = cell.star4.image = [UIImage imageNamed:@"ic_full star"];
        cell.star5.image = [UIImage imageNamed:@"ic_star_s"];
    }
    if ([_model.star isEqual:@5]) {
        cell.star1.image = cell.star2.image = cell.star3.image = cell.star4.image = cell.star5.image = [UIImage imageNamed:@"ic_full star"];
    }
    if (_model.star.doubleValue == 1.5) {
        cell.star1.image = [UIImage imageNamed:@"ic_full star"];
        cell.star2.image = [UIImage imageNamed:@"ic_half star"];
        cell.star3.image = cell.star4.image = cell.star5.image = [UIImage imageNamed:@"ic_star_s"];
    }
    if (_model.star.doubleValue == 2.5) {
        cell.star1.image = cell.star2.image = [UIImage imageNamed:@"ic_full star"];
        cell.star3.image = [UIImage imageNamed:@"ic_half star"];
        cell.star4.image = cell.star5.image = [UIImage imageNamed:@"ic_star_s"];
    }
    if (_model.star.doubleValue == 3.5) {
        cell.star1.image = cell.star2.image = cell.star3.image = [UIImage imageNamed:@"ic_full star"];
        cell.star4.image =  [UIImage imageNamed:@"ic_half star"];
        cell.star5.image = [UIImage imageNamed:@"ic_star_s"];
    }
    if (_model.star.doubleValue == 4.5) {
        cell.star1.image = cell.star2.image = cell.star3.image = cell.star4.image = [UIImage imageNamed:@"ic_full star"];
        cell.star5.image = [UIImage imageNamed:@"ic_half star"];
    }
    
    return cell;
}

@end
