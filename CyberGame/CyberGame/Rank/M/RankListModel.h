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
@property (nonatomic, assign)NSNumber *lose;
@property (nonatomic, assign)NSNumber *score;
@property (nonatomic, copy)NSString *teamName;
@property (nonatomic, assign)NSNumber *win;

@end

NS_ASSUME_NONNULL_END
