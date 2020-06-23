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
#import "MineHeadTableCell.h"

#import "MineTableCellModel.h"

@interface MineVC () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *mineArray;

@end

@implementation MineVC

- (NSArray *)mineArray
{
    if(_mineArray == nil)
    {
        MineTableCellModel *model1 = MineTableCellModel.new;
        model1.titleStr = @"我的约战";
        model1.icon = @"ic_fight";
        model1.textStr = @"";
        
        MineTableCellModel *model2 = MineTableCellModel.new;
        model2.titleStr = @"我的收藏";
        model2.icon = @"ic_inform";
        model2.textStr = @"";
        
        MineTableCellModel *model3 = MineTableCellModel.new;
        model3.titleStr = @"我的点赞";
        model3.icon = @"ic_love";
        model3.textStr = @"";
        
        MineTableCellModel *model4 = MineTableCellModel.new;
        model4.titleStr = @"关于我们";
        model4.icon = @"ic_aboutus";
        model4.textStr = @"最新版本1.1.0";
        
        MineTableCellModel *model5 = MineTableCellModel.new;
        model5.titleStr = @"切换账号";
        model5.icon = @"ic_account nmb";
        model5.textStr = @"";
        
        MineTableCellModel *model6 = MineTableCellModel.new;
        model6.titleStr = @"修改密码";
        model6.icon = @"ic_code";
        model6.textStr = @"";
        
        MineTableCellModel *model7 = MineTableCellModel.new;
        model7.titleStr = @"反馈中心";
        model7.icon = @"ic_feedback center";
        model7.textStr = @"";
        
        MineTableCellModel *model8 = MineTableCellModel.new;
        model8.titleStr = @"设置";
        model8.icon = @"ic_site";
        model8.textStr = @"";
        
        NSMutableArray *temp = NSMutableArray.new;
        [temp addObject:model1];
        [temp addObject:model2];
        [temp addObject:model3];
        [temp addObject:model4];
        [temp addObject:model5];
        [temp addObject:model6];
        [temp addObject:model7];
        [temp addObject:model8];
        _mineArray = temp;
    }
    return _mineArray;
}

NSString *MineID = @"Mine";
NSString *MineHeadTabelID = @"MineHeadTabelCell";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F1F1F9"];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MineTableCell class]) bundle:nil] forCellReuseIdentifier:MineID];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([MineHeadTableCell class]) bundle:nil] forCellReuseIdentifier:MineHeadTabelID];
}

- (void)viewWillAppear:(BOOL)animated {
    self.tabBarController.tabBar.hidden = NO;
    
    self.title = @"我的";
    [self.navigationController.navigationBar setTitleTextAttributes:
    @{NSFontAttributeName:[UIFont systemFontOfSize:18],
      NSForegroundColorAttributeName:UIColor.blackColor}];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:UIColor.whiteColor] forBarMetrics:UIBarMetricsDefault];
    
//    [self getUserLocalData];
    
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
    userModel.reservation = @0;
    
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
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return 3;
    }else if (section == 2) {
        return 4;
    }else
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
    if (indexPath.section == 0 && indexPath.row == 0) {
        MineHeadTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MineHeadTabelID];
//        cell.attentionLabel.text = model.focus.description;
//        cell.historyLabel.text = model.history.description;
//        cell.reservationLabel.text = model.reservation.description;
        WEAKSELF
        
        cell.selectedMineHeadTableViewCellBlock = ^{
            LoginVC *vc = LoginVC.new;
            [weakSelf presentViewController:vc animated:YES completion:^{
                //解档,拿到部分用户信息数据
                LocalData *localDataModel = [EGHCodeTool getOBJCWithSavekey:DJData];
                UserDataModel *userModel = localDataModel.userModel;
//                cell.reservationLabel.text = userModel.reservation.description;
            }];
        };
        return cell;
    }
    else {
        MineTableCell *cell = [tableView dequeueReusableCellWithIdentifier:MineID forIndexPath:indexPath];
        if(indexPath.section == 1)
        {
            cell.model = self.mineArray[indexPath.row];
        }
        else if(indexPath.section == 2)
        {
            cell.model = self.mineArray[indexPath.row + 3];
        }
        else if(indexPath.section == 3)
        {
            cell.model = self.mineArray[indexPath.row + 7];
        }
        //归档
        
        
        return cell;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01f    ;
    } else {
        return 6;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = UIView.new;
    view.backgroundColor = [UIColor colorWithHexString:@"#F1F1F0"];
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1 && indexPath.row == 0) {
        MyFightVC *myFightVC = MyFightVC.new;
        myFightVC.titleStr = @"我的约战";
        [self.navigationController pushViewController:myFightVC animated:YES];
    }
}
@end
