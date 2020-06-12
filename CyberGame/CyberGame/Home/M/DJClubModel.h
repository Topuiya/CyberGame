//
//  DJClubModel.h
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DJClubModel : NSObject

@property (nonatomic, assign)NSNumber *star;
@property (nonatomic, assign)Boolean hot;
@property (nonatomic, copy)NSString *address;
@property (nonatomic, copy)NSString *pic;
@property (nonatomic, copy)NSString *name;

@end

NS_ASSUME_NONNULL_END
