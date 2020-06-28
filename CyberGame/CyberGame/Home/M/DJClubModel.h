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

@property (nonatomic, strong)NSNumber *star;
@property (nonatomic, copy)NSString *address;
@property (nonatomic, copy)NSString *pic;
@property (nonatomic, copy)NSString *name;
@property (assign, nonatomic, getter=isHot) BOOL hot;

+ (instancetype)djWithDict:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
