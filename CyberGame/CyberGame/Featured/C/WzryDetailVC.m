//
//  WzryDetailVC.m
//  CyberGame
//
//  Created by apple on 2020/6/16.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "WzryDetailVC.h"
#import "DetailHeadTableCell.h"
#import "UserInfoModel.h"
#import <SDWebImage.h>
#import "UIImage+OriginalImage.h"
#import "UIImage+Image.h"

@interface WzryDetailVC () <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong)NSArray *dataArray;
@property (nonatomic, strong)UserInfoModel *userModel;
@end

@implementation WzryDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:RGBA(255, 255, 255, 0)] forBarMetrics:UIBarMetricsDefault];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //隐藏分割线
    self.tableView.separatorStyle = UITableViewScrollPositionNone;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self addRegisterXib];
    
    _userModel = _model.user;
    
    //右边按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage originalImageWithName:@"ic_back_g"] style:UIBarButtonItemStyleDone target:self action:@selector(backBtnClick)];
    
}
- (UIImage *)wr_navBarBackgroundImage {
    return [UIImage new];
}
- (void)backBtnClick {
    [self.navigationController popViewControllerAnimated:YES];
}

NSString *wzryDetailHeadID = @"wzryDetailHead";
//注册xib
- (void)addRegisterXib {
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([DetailHeadTableCell class]) bundle:nil] forCellReuseIdentifier:wzryDetailHeadID];
}

#pragma mark - UITableViewViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailHeadTableCell *cell = [tableView dequeueReusableCellWithIdentifier:wzryDetailHeadID];
    cell.selectionStyle = UITableViewScrollPositionNone;
    //设置图片,取第一张图片为主图
    NSURL *headURL = [NSURL URLWithString:_userModel.head];
    [cell.headImageView sd_setImageWithURL:headURL];
    
    cell.nickName.text = _userModel.nickName;
    cell.timeLabel.text = _userModel.publishTime.description;
    
    NSString *str1 = [_model.content substringToIndex:26];
    cell.titleLabel.text = str1;
    
    //设置图片,取第一张图片为主图
    NSString *picURL = [_model.picture componentsSeparatedByString:@","][0];
    [cell.picImageView sd_setImageWithURL:[NSURL URLWithString:picURL]];
    cell.contentLabel.text = _model.content;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

@end
