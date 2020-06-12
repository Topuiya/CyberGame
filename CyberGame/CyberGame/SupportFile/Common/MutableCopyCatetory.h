//
//  MutableCopyCatetory.h
//  CyberGame
//
//  Created by apple on 2020/6/11.
//  Copyright © 2020 zzh. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface NSArray (Catetory)
-(NSMutableArray *)mutableArrayDeeoCopy;
@end
 
@interface NSDictionary (Catetory)
-(NSMutableDictionary *)mutableDicDeepCopy;
@end
NS_ASSUME_NONNULL_END
