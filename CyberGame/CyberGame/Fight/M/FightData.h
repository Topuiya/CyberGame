//
//  FightData.h
//  CyberGame
//
//  Created by apple on 2020/6/19.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FightData : NSObject<NSCoding>

@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *pwd;

@property (nonatomic, copy) NSString *gameBtnSave;
@property (nonatomic, copy) NSString *ruleBtnSave;

@end

NS_ASSUME_NONNULL_END
