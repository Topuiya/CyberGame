//
//  RanlListModel.h
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RankListModel : NSObject

@property (nonatomic, copy)NSString *iconName;
@property (nonatomic, strong)NSNumber *lose;
@property (nonatomic, strong)NSNumber *score;
@property (nonatomic, copy)NSString *teamName;
@property (nonatomic, strong)NSNumber *win;

@end

NS_ASSUME_NONNULL_END
