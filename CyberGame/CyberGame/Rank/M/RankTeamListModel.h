//
//  RankTeamListModel.h
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RankTeamListModel : NSObject

@property (nonatomic,copy)NSString *moduleName;
@property (nonatomic,strong)NSArray *list;

@end

NS_ASSUME_NONNULL_END
