//
//  FeaturedPubg.m
//  CyberGame
//
//  Created by apple on 2020/6/12.
//  Copyright © 2020 zzh. All rights reserved.
//

#import "FeaturedPubg.h"

@interface FeaturedPubg ()

@end

@implementation FeaturedPubg

- (void)viewDidLoad {
    if (SCREEN_WIDTH == 414) {
        self.headViewHeight.constant = 172.3;
    }else if (SCREEN_WIDTH == 375){
        self.headViewHeight.constant = 156;
    }
}

- (UIView *)listView{
    return self.view;
}
@end
