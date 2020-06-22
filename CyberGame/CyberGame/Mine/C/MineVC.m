//
//  MineVC.m
//  CyberGame
//
//  Created by apple on 2020/6/3.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "MineVC.h"
#import "UIImage+Image.h"
#import "UIImage+OriginalImage.h"
#import "MineTableCell.h"
#import "LoginVC.h"
#import "MyFightVC.h"

@interface MineVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MineVC

NSString *MineID = @"Mine";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F1F1F9"];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MineTableCell class]) bundle:nil] forCellReuseIdentifier:MineID];
    
    _userImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *userTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapUserImageView)];
    [_userImageView addGestureRecognizer:userTap];
    
    [self getUserLocalData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    
    self.title = @"我的";
    [self.navigationController.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:18],
      NSForegroundColorAttributeName:UIColor.blackColor}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forBarMetrics:UIBarMetricsDefault];
    
}
- (void)didTapUserImageView {
    LoginVC *loginVC = [[LoginVC alloc] init];
    [self.navigationController pushViewController:loginVC animated:YES];
}

- (void)getUserLocalData {
    
    LocalData *localData = [EGHCodeTool getOBJCWithSavekey:DJData];
    if (localData == nil) {
        localData = LocalData.new;
    }
    if (localData.login == false) {
        //无用户登录.跳转到登录界面
        [self addUserLocalData];
    }
}

-(void)addUserLocalData {
    //解档,拿到LocalData模型
    LocalData *localData = [EGHCodeTool getOBJCWithSavekey:DJData];
    
    UserDataModel *userModel = UserDataModel.new;
    userModel.account = @"1";
    userModel.pwd = @"1";
    //关注,足迹,预约
    userModel.focus = @0;
    userModel.history = @0;
    userModel.reservation = @"0";
    
    //localData的用户模型为userModel,并将login值改为真
    localData.userModel = userModel;
    localData.login = true;
    NSMutableArray *newLocalArray = [NSMutableArray array];
    //便利数组,将userModel添加到临时数组
    for (UserDataModel *userModel in localData.localModelArray) {
        [newLocalArray addObject:userModel];
    }
    [newLocalArray addObject:userModel];
    //将临时数组的值赋值给localModelArray之后归档
    LocalData *localMode = LocalData.new;
    localMode.localModelArray = newLocalArray;
    localData = localMode;
    [EGHCodeTool archiveOJBC:localData saveKey:DJData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else if (section == 1) {
        return 4;
    }else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MineTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MineID forIndexPath:indexPath];
    
    //解档,拿到部分用户信息数据
    LocalData *localData = [EGHCodeTool getOBJCWithSavekey:DJData];
    UserDataModel *model = localData.localModelArray[indexPath.row];
    
    self.attentionLabel.text = model.focus.description;
    self.historyLabel.text = model.history.description;
    self.reservationLabel.text = model.reservation.description;
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.title.text = @"我的约战";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_fight"];
        cell.ortherLbael.text = @"";
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        cell.title.text = @"我的收藏";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_inform"];
        cell.ortherLbael.text = localData.userModel.collection.description;
    }else if (indexPath.section == 0 && indexPath.row == 2) {
        cell.title.text = @"我的点赞";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_love"];
        cell.ortherLbael.text = localData.userModel.like.description;
    }
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        cell.title.text = @"关于我们";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_aboutus"];
        cell.ortherLbael.text = @"最新版本1.1.0";
    }else if (indexPath.section == 1 && indexPath.row == 1) {
        cell.title.text = @"切换账号";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_account nmb"];
        cell.ortherLbael.text = nil;
    }
    else if (indexPath.section == 1 && indexPath.row == 2) {
        cell.title.text = @"修改密码";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_code"];
        cell.ortherLbael.text = nil;
    }else if (indexPath.section == 1 && indexPath.row == 3) {
        cell.title.text = @"反馈中心";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_feedback center"];
        cell.ortherLbael.text = nil;
    }
    
    else if (indexPath.section == 2) {
        cell.title.text = @"设置 ";
        cell.iconImageView.image = [UIImage imageNamed:@"ic_site"];
        cell.ortherLbael.text = nil;
    }
    //归档
    [EGHCodeTool archiveOJBC:localData saveKey:DJData];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 6;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = UIView.new;
    view.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        MyFightVC *myFightVC = MyFightVC.new;
        myFightVC.titleStr = @"我的约战";
        [self.navigationController pushViewController:myFightVC animated:YES];
    }
}
@end
